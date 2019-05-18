# fish

This is a sample fish application. Based on the version you release, it will
show it under the /color endpoint. Use the Makefile to build the image and tag
it based on the version.

## Run
1. Go to [smendiratta/fish](https://hub.docker.com/r/smendiratta/fish) on Docker Hub for version information.
1. `docker run -d -e fish_APP_PORT=8080 smendiratta/fish:<tag>`

## API
| Endpoint       | Description           |
| :------------- |:-------------|
| /health   | shows the app name and healthy status |
| /fish    | shows the version |
| /   | welcome |

## Updates
1. Change the version under "version" file.
1. Issue `make golang-build` to build the binary and container.
1. Issue `make push` to push it to Docker Hub.
