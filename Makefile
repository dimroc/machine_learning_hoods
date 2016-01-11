DOCKER = docker
REPO = tutum.co/dimroc/machinelearninghoods
TAG = latest

build:
	$(DOCKER) build -t $(REPO):$(TAG) .

push:
	$(DOCKER) push $(REPO):$(TAG)

redeploy:
	tutum service redeploy web-mlh.MachineLearningHoods

all: build push redeploy

