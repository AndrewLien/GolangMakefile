FROM golang:1.11.10-alpine3.9

ENV APPNAME makefile_example

RUN apk update && apk upgrade && \
    apk add --no-cache git openssh bash

ENV GBIN /go/bin/

ADD . /go/src/$APPNAME
WORKDIR /go/src/$APPNAME/src/

RUN go get -u github.com/golang/dep/...

RUN dep ensure -v

ENV GOPATH /go/src/$APPNAME
WORKDIR /go/src/$APPNAME/
