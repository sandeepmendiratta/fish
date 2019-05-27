# fish

This is a sample fish application. Based on the version you release, it will
show it under the /color endpoint. Use the Makefile to build the image and tag
it based on the version.

## Run
1. `make golang-build to

1. `docker run -d  smendiratta/fish:<tag>`

## API
| Endpoint       | Description           |
| :------------- |:-------------|
| /health   | shows the app name and healthy status |
| /fish    | shows the version |
| /   | welcome |

## Run
1. Change the version under "version" file.
2. Issue `make golang-build` to build the binary and container.
3. Issue `make run` to run in docker
4. Issue `make show` to run in docker
3. Issue `make push` to push it to Docker Hub.
