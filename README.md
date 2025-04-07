# Containerization101
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


## Commands
```
$ docker build -t my-app .
[+] Building 24.0s (10/10) FINISHED                                                                                                                                                                                                                                      docker:default
 => [internal] load build definition from Dockerfile                                                                                                                                                                                                                               0.0s
 => => transferring dockerfile: 1.44kB                                                                                                                                                                                                                                             0.0s
 => [internal] load metadata for docker.io/library/alpine:latest                                                                                                                                                                                                                  12.1s
 => [internal] load .dockerignore                                                                                                                                                                                                                                                  0.0s
 => => transferring context: 2B                                                                                                                                                                                                                                                    0.0s
 => [internal] load build context                                                                                                                                                                                                                                                  0.0s
 => => transferring context: 14.77kB                                                                                                                                                                                                                                               0.0s
 => [1/5] FROM docker.io/library/alpine:latest@sha256:a8560b36e8b8210634f77d9f7f9efd7ffa463e380b75e2e74aff4511df3ef88c                                                                                                                                                             6.5s
 => => resolve docker.io/library/alpine:latest@sha256:a8560b36e8b8210634f77d9f7f9efd7ffa463e380b75e2e74aff4511df3ef88c                                                                                                                                                             0.0s
 => => sha256:a8560b36e8b8210634f77d9f7f9efd7ffa463e380b75e2e74aff4511df3ef88c 9.22kB / 9.22kB                                                                                                                                                                                     0.0s
 => => sha256:1c4eef651f65e2f7daee7ee785882ac164b02b78fb74503052a26dc061c90474 1.02kB / 1.02kB                                                                                                                                                                                     0.0s
 => => sha256:aded1e1a5b3705116fa0a92ba074a5e0b0031647d9c315983ccba2ee5428ec8b 581B / 581B                                                                                                                                                                                         0.0s
 => => sha256:f18232174bc91741fdf3da96d85011092101a032a93a388b79e99e69c2d5c870 3.64MB / 3.64MB                                                                                                                                                                                     6.2s
 => => extracting sha256:f18232174bc91741fdf3da96d85011092101a032a93a388b79e99e69c2d5c870                                                                                                                                                                                          0.2s
 => [2/5] RUN apk add --no-cache gcc libc-dev                                                                                                                                                                                                                                      4.1s
 => [3/5] WORKDIR /usr/src/app                                                                                                                                                                                                                                                     0.2s
 => [4/5] COPY . .                                                                                                                                                                                                                                                                 0.1s
 => [5/5] RUN gcc -o hello hello.c                                                                                                                                                                                                                                                 0.2s
 => exporting to image                                                                                                                                                                                                                                                             0.9s
 => => exporting layers                                                                                                                                                                                                                                                            0.9s
 => => writing image sha256:f62a90c1ebb9672d603f4908e71de36f129685629ae6a58bb694471324a1d5e0                                                                                                                                                                                       0.0s
 => => naming to docker.io/library/my-app                                                                                                                                                                                                                                          0.0s

$ docker run my-app
HELLO FROM THE TEST APP!

$ docker images
REPOSITORY              TAG       IMAGE ID       CREATED          SIZE
my-app                  latest    f62a90c1ebb9   19 minutes ago   180MB
```

