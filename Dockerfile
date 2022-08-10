# Core Docker Packages Versioning
ARG GO_VERSION=1.19.0
ARG TF_CLI_VERSION="1.2.7"
ARG TFSEC_VERSION="1.13.2"
ARG TFDOCS_VERSION="0.9.1"

# CLIs Dockerized Providers
FROM hashicorp/terraform:${TF_CLI_VERSION} as build-tf-cli
FROM tfsec/tfsec-alpine:v${TFSEC_VERSION}-amd64 as build-tfsec
FROM cytopia/terraform-docs:${TFDOCS_VERSION} as build-terraform-docs
# hadolint ignore=DL3007
FROM accurics/terrascan:latest as build-tfscan

################################################################

# Base Image: Alpine & Environment Configuration
FROM golang:$GO_VERSION-alpine

# Image Labels for Metadata Configuration
LABEL org.opencontainers.image.source = "https://github.com/gruberdev/tf-free.git"

COPY --from=build-tf-cli /bin/terraform /usr/local/bin/terraform
COPY --from=build-tfsec /usr/bin/tfsec /usr/local/bin/tfsec
COPY --from=build-terraform-docs /usr/local/bin/terraform-docs /usr/local/bin/terraform-docs
COPY --from=build-tfscan /go/bin/terrascan /usr/local/bin/tfscan

# Architecture Metadata
ENV ARCH=amd64
ENV ARCH_86=x86_64
ENV OS=linux
ENV TASK_VERSION=3.14.1
# hadolint ignore=SC2034
RUN go env -w GOPRIVATE=github.com/gruberdev
ENV \
 LANG="${LANG:-$LANG_DEFAULT}" \
 LC_ALL="${LC_ALL:-$LC_ALL_DEFAULT}" \
 PATH="/usr/local/go/bin:${PATH}" \
 GO111MODULE='on' \
 SHELL="/bin/bash" \
 HAS_ALLOW_UNSAFE=y \
 GOCACHE=/go

# Install Python and GCC dependencies
# hadolint ignore=DL3018
RUN apk add --update --no-cache \
 bash gcc g++ git curl \
 zlib libffi-dev binutils \
 openssh-client rsync \
 ca-certificates musl-dev 

# Configuring bash instead of sh
SHELL ["/bin/bash", "-eo", "pipefail", "-c"]

# Go-Critic
RUN curl -sSfL "https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh" | sh -s '-- -b $(go env GOPATH)/bin' 

# Task / makefile Alternative
RUN wget -q -O /tmp/task.tar.gz https://github.com/go-task/task/releases/download/v${TASK_VERSION}/task_${OS}_${ARCH}.tar.gz && \
 tar -C /usr/bin/ -xvf /tmp/task.tar.gz && \
 rm -rf /tmp/gotty.tar.gzln

RUN echo "export PATH="/go/bin:/usr/local/go/bin:${PATH}"" >> "${HOME}/.bashrc" 

# Bootstrapping the project
WORKDIR /project
COPY . .
RUN chmod +x /project/scripts/entrypoint.sh 

# Verifying dependencies existence within Dockerfile
RUN curl -sL https://git.io/_has | bash -s git tfscan \
 tfsec terraform-docs terraform go task bash

CMD ["/bin/bash"]
ENTRYPOINT ["/project/scripts/entrypoint.sh"]
