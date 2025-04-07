# containerization101
Containerization of basic C application.

Containerization is the process of packaging an application and all its dependencies into a container image. We normally store images in registries for easy access.
Container is a runtime instance of a docker image. Docker image is a collection of layers that comprise the application and all dependencies (OS, dependet libs).
Once you have the image, you can run it as a container.

The Dockerfile is a list of instructions that tell docker build how to build the image.

The first three lines of the following Dockerfile create the three layers shown in Figure 1.3 (base OS, app, dependencies). The fourth line is metadata telling Docker how to start the app.

```
FROM golang:1.20-alpine       <<==== Start from base OS
COPY go.mod go.sum .          <<==== Copy app and dependencies
RUN go mod download           <<==== Install dependencies
ENTRYPOINT [ "/bin/server" ]  <<==== How to start the app
```

docker build command is used to build the image from the docker file.
docker run command is used to run the docker image as a container.

This example has a basic c program that is packaged as a Alpine linux based image.

Alpine Linux is a lightweight and secure Linux distribution that has gained popularity due to its minimal size, efficient resource usage, and security-focused design. 
Alpine Linux uses musl libc and BusyBox instead of the more commonly used glibc and GNU Core Utilities.

musl libc: This is a different version of the C standard library, which is a collection of basic functions that programs written in C use to perform tasks like input/output operations, 
memory management, and string manipulation. Alpine uses musl libc instead of the more common glibc (GNU C Library). Musl libc is smaller and simpler, which helps keep Alpine lightweight and efficient.

BusyBox: This is a single executable that combines many common Unix utilities into one package. Instead of having separate programs for each utility (like you would with GNU coreutils),
usyBox bundles them together. This makes Alpine more compact because it has fewer individual programs to manage.

