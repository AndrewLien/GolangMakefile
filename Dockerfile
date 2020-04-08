FROM golang:1.13.9-alpine3.10

ENV APPNAME makefile_example

RUN apk update && apk upgrade

ADD . /go/src/$APPNAME
WORKDIR /go/src/$APPNAME/

RUN GO111MODULES=on go build /go/src/$APPNAME/cmd/$APPNAME/main.go && \
    mv /go/src/$APPNAME/main /go/src/$APPNAME/bin/makefile_example


