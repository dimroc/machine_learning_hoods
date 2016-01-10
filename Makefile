DOCKER = docker
REPO = tutum.co/dimroc/machinelearninghoods
TAG = latest

build:
	$(DOCKER) build -t $(REPO):$(TAG) .

push:
	$(DOCKER) push $(REPO):$(TAG)

all: build push

