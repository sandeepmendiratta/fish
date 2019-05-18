NAME = fish-test
IMAGE = smendiratta/fish
TAG := $(shell cat version)

golang-build:
	GOOS=linux GOARCH=amd64 go build fish.go
	docker build -t $(IMAGE):$(TAG) -f Dockerfile .

run:
	docker run -d -e fish_APP_PORT=8080 -p 8080:8080 --name $(NAME) $(IMAGE):$(TAG)

delete:
	docker rm -f $(NAME)

push:
	docker push $(IMAGE):$(TAG)
