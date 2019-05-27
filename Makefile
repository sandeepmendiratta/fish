NAME = fish-test
IMAGE = smendiratta/fish
TAG := $(shell cat version)

build:
  #CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build fish.go
	docker build -t $(IMAGE):$(TAG) -f Dockerfile.mod .

run:
	docker run -d -p 80:8080 --name $(NAME) $(IMAGE):$(TAG)

delete:
	docker rm -f $(NAME)

push:
	docker push $(IMAGE):$(TAG)

show:
	curl http://127.0.0.1/fish
