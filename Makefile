APPNAME=makefile_example
MAINFILE=main.go
GO_CMD = sudo docker run --rm -w /go/src/$(APPNAME) $(APPNAME):latest
COMPILE_CMD = sudo docker run --rm -v $(CURDIR)/bin/:/go/src/$(APPNAME)/bin/ -w /go/src/$(APPNAME) $(APPNAME):latest

.PHONY: all build docker_build run run_no_build compile


all: build compile

build:
	sudo docker build -t $(APPNAME) .

compile: build
	$(COMPILE_CMD) ./build-go-binaries.bash $(APPNAME)


run:    build
	$(GO_CMD) go run src/$(APPNAME)/$(MAINFILE)

run_no_build:
	$(GO_CMD) go run src/$(APPNAME)/$(MAINFILE)