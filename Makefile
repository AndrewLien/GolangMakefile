APPNAME=makefile_example
GO_CMD = sudo docker run --rm -w /go/src/$(APPNAME) $(APPNAME):latest 

.PHONY: all build docker_build run run_no_build compile


all: build compile

build:
	sudo docker build -t $(APPNAME) .

run:    build
	$(GO_CMD) /go/src/$(APPNAME)/bin/$(APPNAME)

run_no_build:
	$(GO_CMD) /go/src/$(APPNAME)/bin/$(APPNAME)

copy_binary_to_local: build
	sudo docker create -ti --name binDummy $(APPNAME) bash
	sudo docker cp binDummy:/go/src/$(APPNAME)/bin/$(APPNAME) bin/
	sudo docker rm -f binDummy
