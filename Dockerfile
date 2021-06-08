ARG GO_VERSION=1.16.4


ARG AZURE_VERSION="2.9.1"
ARG TF_CLI_VERSION="0.15.5"
ARG TFSEC_VERSION="0.39.35"
ARG TFLINT_VERSION="0.28.1"
ARG TFDOCS_VERSION="0.9.1"

# CLIs Dockerized Providers
#FROM amazon/aws-cli:${AWS_VERSION} as build-aws
FROM mcr.microsoft.com/azure-cli:${AZURE_VERSION} as build-azure
FROM hashicorp/terraform:${TF_CLI_VERSION} as build-tf-cli
FROM tfsec/tfsec-alpine:v${TFSEC_VERSION} as build-tfsec
FROM wata727/tflint:${TFLINT_VERSION} as build-tflint
FROM cytopia/terraform-docs:${TFDOCS_VERSION} as build-terraform-docs
# hadolint ignore=DL3007
FROM accurics/terrascan:latest as build-tfscan

################################################################

# Base Alpine Version & Environment
FROM golang:$GO_VERSION-alpine

#COPY --from=build-aws /usr/local/aws-cli/ /usr/local/aws-cli/
#COPY --from=build-aws /usr/local/bin/ /usr/local/bin/
COPY --from=build-azure /usr/local/bin/az /usr/local/bin/az
COPY --from=build-tf-cli /bin/terraform /usr/local/bin/terraform
COPY --from=build-tfsec /usr/bin/tfsec /usr/local/bin/tfsec
COPY --from=build-tflint /usr/local/bin/tflint /usr/local/bin/tflint
COPY --from=build-terraform-docs /usr/local/bin/terraform-docs /usr/local/bin/terraform-docs
COPY --from=build-tfscan /go/bin/terrascan /usr/local/bin/tfscan

# Cloud CLI-related Packages
ENV TASK_VERSION=3.4.2
ENV GCLOUD_VERSION=343.0.0
ENV PYTHON_VERSION_MINOR=3.9
ENV PYTHON_VERSION_MAJOR=3
ENV AZURE_VERSION=2.18.0

# Alpine Packages
ENV GCC_VERSION=10.2.1_pre1-r3
ENV CURL_VERSION=7.77.0-r0
ENV NCURSES_VERSION=6.2_p20210109-r0
ENV JQ_VERSION=1.6-r1
ENV GIT_VERSION=2.30.2-r0
ENV BASH_VERSION=5.1.0-r0

ENV ARCH=amd64
ENV ARCH_86=x86_64
ENV OS=linux

ENV PYTHONUNBUFFERED=1
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
 bash=${BASH_VERSION} gcc=${GCC_VERSION} g++ git=${GIT_VERSION} curl=${CURL_VERSION} \
 zlib libffi-dev  \
 musl-dev python${PYTHON_VERSION_MAJOR} openssl \
 sudo jq=${JQ_VERSION} py${PYTHON_VERSION_MAJOR}-pip ncurses=${NCURSES_VERSION} \
 openssh-client rsync \
 ca-certificates musl-dev \
 openssl-dev make python${PYTHON_VERSION_MAJOR}-dev \
 && ln -sf python${PYTHON_VERSION_MAJOR} /usr/bin/python \
 && ln -s /usr/bin/python${PYTHON_VERSION_MINOR} /usr/local/bin/python \
 && python${PYTHON_VERSION_MAJOR} -m ensurepip

SHELL ["/bin/bash", "-eo", "pipefail", "-c"]

# Go-Critic
RUN curl -sSfL "https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh" | sh -s '-- -b $(go env GOPATH)/bin' 

# Task / makefile Alternative
RUN wget -O /tmp/task.tar.gz https://github.com/go-task/task/releases/download/v${TASK_VERSION}/task_${OS}_${ARCH}.tar.gz && \
 tar -C /usr/bin/ -xvf /tmp/task.tar.gz && \
 rm -rf /tmp/gotty.tar.gzln

# Gcloud SDK CLI
RUN curl https://sdk.cloud.google.com > /tmp/install.sh \
 && bash /tmp/install.sh --disable-prompts  \
 && cp -r ~/google-cloud-sdk /usr/local/google-cloud-sdk \
 && /bin/bash -c 'source /usr/local/google-cloud-sdk/path.bash.inc' \
 && ln -s /usr/local/google-cloud-sdk/bin/gcloud /usr/local/bin/gcloud

# Creating initial environment Variables and config folders
RUN echo "export PATH="/usr/local/google-cloud-sdk/bin:${PATH}"" >> "${HOME}/.bashrc" \
 && echo "export PATH="/go/bin:/usr/local/go/bin:${PATH}"" >> "${HOME}/.bashrc" \
 && mkdir /root/.aws

# Bootstrapping the project
WORKDIR /project
COPY . .

# Install Azure-cli and its dependencies
RUN pip${PYTHON_VERSION_MAJOR} install -r scripts/requirements.txt
RUN chmod +x /project/scripts/entrypoint.sh && /bin/bash -s /project/scripts/entrypoint.sh

# Verifying dependencies existence within Dockerfile
RUN curl -sL https://git.io/_has | bash -s git az aws tfscan \
 tfsec terraform-docs terraform go task python bash

CMD ["/bin/bash"]
ENTRYPOINT ["/project/scripts/entrypoint.sh"]

