
# Start from golang v1.11 base image
FROM golang:1.11

# Add Maintainer Info
LABEL maintainer="Sandeep Mendiratta <sandeepmendiratta@gmail.com>"

# Set the Current Working Directory inside the container
WORKDIR $GOPATH/src/github.com/sandeepmendiratta/fish

# Copy everything from the current directory to the PWD(Present Working Directory) inside the container
COPY . .

# Enable Go Modules
ENV GO111MODULE=on

# Build the Go app
RUN go build -o ./app/fish .


# Run the binary program produced by `go install`
CMD ["./app/fish"]
