PROJECT = gardeners-query-time
ID = pikesley/${PROJECT}

all: build

build:
	docker build -t ${ID} .

push:
	docker push ${ID}

run:
	docker run -v "$(shell pwd)"/gqt:/opt/gqt -it ${ID}:latest bash

