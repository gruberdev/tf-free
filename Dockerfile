# Core Docker Packages Versioning
ARG GO_VERSION=1.16.4
ARG AZURE_VERSION="2.9.1"
ARG TF_CLI_VERSION="1.0.0"
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

# Base Image: Alpine & Environment Configuration
FROM golang:$GO_VERSION-alpine

# Image Labels for Metadata Configuration
LABEL org.opencontainers.image.source = "https://github.com/gruberdev/tf-free"

#COPY --from=build-aws /usr/local/aws-cli/ /usr/local/aws-cli/
#COPY --from=build-aws /usr/local/bin/ /usr/local/bin/
COPY --from=build-azure /usr/local/bin/az /usr/local/bin/az
COPY --from=build-tf-cli /bin/terraform /usr/local/bin/terraform
COPY --from=build-tfsec /usr/bin/tfsec /usr/local/bin/tfsec
COPY --from=build-tflint /usr/local/bin/tflint /usr/local/bin/tflint
COPY --from=build-terraform-docs /usr/local/bin/terraform-docs /usr/local/bin/terraform-docs
COPY --from=build-tfscan /go/bin/terrascan /usr/local/bin/tfscan

# CLI Providers Versioning within the last Docker image
ENV TASK_VERSION=3.4.2
ENV GCLOUD_VERSION=343.0.0
ENV PYTHON_VERSION_MINOR=3.8
ENV PYTHON_VERSION_MAJOR=3
ENV AZURE_VERSION=2.18.0
ENV AWS_CLI_VERSION=2.2.13
ENV AZ_COMPUTE_VERSION=21.0.0
ENV AZ_STORAGE_VERSION=18.0.0
ENV AZ_RESOURCE_VERSION=18.0.0
ENV AZ_KEYVAULT_VERSION=4.2.0
ENV AZ_BLOB_VERSION=12.8.1

# Alpine Packages versioning lock
ENV GCC_VERSION=10.2.1_pre1-r3
ENV CURL_VERSION=7.77.0-r0
ENV NCURSES_VERSION=6.2_p20210109-r0
ENV JQ_VERSION=1.6-r1
ENV GLIBC_VER=2.31-r0
ENV GIT_VERSION=2.30.2-r0
ENV BASH_VERSION=5.1.0-r0

# Architecture Metadata
ENV ARCH=amd64
ENV ARCH_86=x86_64
ENV OS=linux

ENV PYTHONUNBUFFERED=1
ENV CRYPTOGRAPHY_DONT_BUILD_RUST=1
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
 bash gcc g++ git curl cargo rust \
 zlib libffi-dev binutils openssl-dev \
 python${PYTHON_VERSION_MAJOR} openssl \
 sudo jq=${JQ_VERSION} py${PYTHON_VERSION_MAJOR}-pip ncurses \
 openssh-client rsync \
 ca-certificates musl-dev \
 openssl-dev make python${PYTHON_VERSION_MAJOR}-dev \
 && ln -sf python${PYTHON_VERSION_MAJOR} /usr/bin/python \
 && rm -rf /usr/local/bin/python \
 && ln -s /usr/bin/python${PYTHON_VERSION_MINOR} /usr/local/bin/python \
 && python${PYTHON_VERSION_MAJOR} -m ensurepip && \
 pip install --upgrade pip pipenv && \
 pip --no-cache-dir install -U pip && \
 apk del --purge python3-dev gcc \
     musl-dev make libffi-dev \
     openssl-dev

# Configuring bash instead of sh
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

# Install awscliv2
# See: https://github.com/aws/aws-cli/issues/3553
# Discussion: https://github.com/aws/aws-cli/issues/4947
# RUN apk --no-cache add \
#  && curl -sL https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub -o /etc/apk/keys/sgerrand.rsa.pub \
#  && curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-${GLIBC_VER}.apk \
#  && curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-bin-${GLIBC_VER}.apk \
#  && apk add --no-cache \
#  glibc-${GLIBC_VER}.apk \
#  glibc-bin-${GLIBC_VER}.apk \
#  && curl -sL https://awscli.amazonaws.com/awscli-exe-${OS}-${ARCH_86}.zip -o awscliv2.zip \
#  && unzip awscliv2.zip \
#  && aws/install \
#  && rm -rf \
#  awscliv2.zip \
#  aws \
#  /usr/local/aws-cli/v2/*/dist/aws_completer \
#  /usr/local/aws-cli/v2/*/dist/awscli/data/ac.index \
#  /usr/local/aws-cli/v2/*/dist/awscli/examples \
#  && rm glibc-${GLIBC_VER}.apk \
#  && rm glibc-bin-${GLIBC_VER}.apk \
#  && rm -rf /var/cache/apk/*

# Install Azure-cli and dependencies
RUN pip${PYTHON_VERSION_MAJOR} install azure-mgmt-compute==${AZ_COMPUTE_VERSION} azure-mgmt-storage==${AZ_STORAGE_VERSION} \
 azure-mgmt-resource==${AZ_RESOURCE_VERSION} azure-keyvault-secrets==${AZ_KEYVAULT_VERSION} \
 azure-storage-blob==${AZ_BLOB_VERSION} && \
 chmod +x /project/scripts/entrypoint-dev.sh && /bin/bash -s /project/scripts/entrypoint-dev.sh \
 && chmod +x /project/scripts/test.sh

# Verifying dependencies existence within Dockerfile
RUN curl -sL https://git.io/_has | bash -s git az tfscan \
 tfsec terraform-docs terraform go task python bash

CMD ["/bin/bash", "-c"]
ENTRYPOINT ["/project/scripts/entrypoint-dev.sh"]



