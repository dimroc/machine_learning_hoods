DOCKER = docker
REPO = dimroc/machinelearninghoods
TAG = latest

build:
	$(DOCKER) build -t $(REPO):$(TAG) .

push:
	$(DOCKER) push $(REPO):$(TAG)

redeploy:
	# tutum has been deprecated for docker cloud
	tutum service redeploy web-mlh.MachineLearningHoods

all: build push

