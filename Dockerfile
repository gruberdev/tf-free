ARG GO_VERSION=1.16.4

ARG GCLOUD_VERSION="342.0.0"
ARG AWS_VERSION="2.2.6"
ARG AZURE_VERSION="2.9.1"
ARG TF_CLI_VERSION="0.15.4"
ARG TFSEC_VERSION="0.39.35"
ARG TFLINT_VERSION="0.28.1"
ARG TFDOCS_VERSION="0.9.1"

FROM amazon/aws-cli:${AWS_VERSION} as build-aws
FROM mcr.microsoft.com/azure-cli:${AZURE_VERSION} as build-azure
FROM hashicorp/terraform:${TF_CLI_VERSION} as build-tf-cli
FROM tfsec/tfsec-alpine:v${TFSEC_VERSION} as build-tfsec
FROM wata727/tflint:${TFLINT_VERSION} as build-tflint
FROM cytopia/terraform-docs:${TFDOCS_VERSION} as build-terraform-docs
FROM accurics/terrascan:latest as build-tfscan

################################################################

FROM golang:$GO_VERSION-alpine

COPY --from=build-aws /usr/local/bin/aws /usr/local/bin/aws
COPY --from=build-azure /usr/local/bin/az /usr/local/bin/az
COPY --from=build-tf-cli /bin/terraform /usr/local/bin/terraform
COPY --from=build-tfsec /usr/bin/tfsec /usr/local/bin/tfsec
COPY --from=build-tflint /usr/local/bin/tflint /usr/local/bin/tflint
COPY --from=build-terraform-docs /usr/local/bin/terraform-docs /usr/local/bin/tfscan
COPY --from=build-tfscan /go/bin/terrascan /usr/local/bin/tfscan

ENV TASK_VERSION=3.4.2
ENV ARCH=amd64
ENV OS=linux

ENV PYTHONUNBUFFERED=1
ARG ACCESS_TOKEN
ENV GITHUB_USER=${GITHUB_USER}
ENV GITHUB_PASSWORD=${GITHUB_PASSWORD}

RUN GOCACHE=OFF
RUN go env -w GOPRIVATE=github.com/gruberdev
ENV \
 LANG="${LANG:-$LANG_DEFAULT}" \
 LC_ALL="${LC_ALL:-$LC_ALL_DEFAULT}" \
 PATH="/usr/local/go/bin:${PATH}" \
 GO111MODULE='on' \
 ACCESS_TOKEN="${ACCESS_TOKEN}" \
 USERNAME=${USERNAME} \
 SHELL="/bin/bash" \
 GOOGLE_PROJECT="${GOOGLE_PROJECT}"

RUN apk add --update --no-cache \
 bash gcc g++ git curl \
 wget musl-dev python3 \
 openssh-client rsync \
 ca-certificates \
 && ln -sf python3 /usr/bin/python \
 && python3 -m ensurepip \
 && pip3 install --no-cache --upgrade pip setuptools pre-commit

RUN 

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
RUN git config --global url.'https://${GITHUB_USER}:${GITHUB_KEY}@github.com'.insteadOf 'https://github.com'
RUN echo 'export PATH="/go/bin:/usr/local/go/bin:${PATH}"' >> "${HOME}/.bashrc"

CMD /bin/bash