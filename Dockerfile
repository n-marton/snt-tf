FROM golang:alpine as TF
MAINTAINER "HashiCorp Terraform Team <terraform@hashicorp.com>"

ENV TERRAFORM_VERSION=0.11.11

RUN apk add --update git bash openssh

ENV TF_DEV=true
ENV TF_RELEASE=true

WORKDIR $GOPATH/src/github.com/hashicorp/terraform
RUN git clone https://github.com/hashicorp/terraform.git ./ && \
    git checkout v${TERRAFORM_VERSION} && \
    /bin/bash scripts/build.sh

FROM alpine:3.8
RUN apk update; apk add git
COPY --from=TF /go/src/github.com/hashicorp/terraform/bin/terraform  /usr/local/bin/terraform
WORKDIR /tmp/
ENTRYPOINT [ "/usr/local/bin/terraform" ]