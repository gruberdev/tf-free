ARG GO_VERSION=1.16.4 

ARG GCLOUD_VERSION="342.0.0"

ARG AWS_VERSION="2.2.6"
ARG AZURE_VERSION="0.9.9"
ARG TF_CLI_VERSION="0.15.4"
ARG TFSEC_VERSION="0.39.35"
ARG TFLINT_VERSION="0.28.1"
ARG TFDOCS_VERSION="v0.8.0"

FROM google/cloud-sdk:${GCLOUD_VERSION}-alpine as build-gcloud
FROM amazon/aws-cli:${AWS_VERSION}-alpine as build-aws
FROM microsoft/azure-cli:${AZURE_VERSION}-alpine as build-azure
FROM hashicorp/terraform:${TF_CLI_VERSION} as build-tf-cli
FROM tfsec/tfsec-alpine:v${TFSEC_VERSION} as build-tfsec
FROM wata727/tflint:${TFLINT_VERSION} as build-tflint
FROM cytopia/terraform-docs:${TFDOCS_VERSION} as build-terraform-docs
FROM accurics/terrascan:latest as build-tfscan

################################################################

FROM golang:$GO_VERSION-alpine

COPY --from=build-gcloud /usr/bin/gcloud /usr/local/bin/gcloud
COPY --from=build-aws /usr/local/bin/aws /usr/local/bin/aws
COPY --from=build-azure /usr/bin/gcloud /usr/local/gcloud
COPY --from=build-tf-cli /usr/bin/gcloud /usr/local/gcloud
COPY --from=build-tfsec /usr/bin/gcloud /usr/local/gcloud
COPY --from=build-tflint /usr/bin/gcloud /usr/local/gcloud
COPY --from=build-tfscan /usr/bin/gcloud /usr/local/gcloud

ENV TASK_VERSION=3.4.2
ENV ARCH=amd64
ENV OS=linux

ENV PYTHONUNBUFFERED=1
ARG ACCESS_TOKEN
ENV EMAIL=${EMAIL}
ENV USERNAME=${USERNAME}

RUN GOCACHE=OFF
RUN go env -w GOPRIVATE=github.com/gruberdev
ENV \
 LANG="${LANG:-$LANG_DEFAULT}" \
 LC_ALL="${LC_ALL:-$LC_ALL_DEFAULT}" \
 PATH="/usr/local/go/bin:${PATH}" \
 GO111MODULE='on' \
 ACCESS_TOKEN="${ACCESS_TOKEN}" \
 USERNAME=${USERNAME} \
 SHELL="/bin/bash"

RUN apk add --update --no-cache \
 bash gcc g++ git curl \
 wget musl-dev python3 \
 openssh-client rsync \
 ca-certificates \
 && ln -sf python3 /usr/bin/python \
 && python3 -m ensurepip \
 && pip3 install --no-cache --upgrade pip setuptools pre-commit

RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin \
 && golangci-lint --version

RUN wget -O /tmp/task.tar.gz https://github.com/go-task/task/releases/download/v${TASK_VERSION}/task_${OS}_${ARCH}.tar.gz && \
 tar -C /usr/bin/ -xvf /tmp/task.tar.gz && \
 rm -rf /tmp/gotty.tar.gz

WORKDIR /project
RUN mkdir -p ~/.ssh \
 && chmod 700 ~/.ssh \
 && echo -e "Host *\n\tStrictHostKeyChecking no\n\tIdentityFile ~/ssh_key\n\n" > ~/.ssh/config \
 && ssh-keygen -t rsa -b 4096 -C "${EMAIL}" -N '${USERNAME}' -f tmp_rsa

COPY . .
RUN git config --global url."https://${USERNAME}:${ACCESS_TOKEN}@github.com".insteadOf "https://github.com"
RUN echo 'export PATH="/go/bin:/usr/local/go/bin:${PATH}"' >> "${HOME}/.bashrc"

CMD /bin/bash