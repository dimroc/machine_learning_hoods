DOCKER = docker
REPO = dimroc/machinelearninghoods
TAG = latest

build:
	$(DOCKER) build -t $(REPO):$(TAG) .

push:
	$(DOCKER) push $(REPO):$(TAG)

redeploy:
	docker-cloud service redeploy web-mlh.MachineLearningHoods

all: build push

