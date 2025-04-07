# Use the official Alpine Linux image as the base image
FROM alpine:latest

# Install GCC (GNU Compiler Collection) and other necessary packages
RUN apk add --no-cache gcc libc-dev

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Compile the C program
RUN gcc -o hello hello.c

# Run the compiled program
CMD ["./hello"]

# syntax=docker/dockerfile:1

# Comments are provided throughout this file to help you get started.
# If you need more help, visit the Dockerfile reference guide at
# https://docs.docker.com/go/dockerfile-reference/

# Want to help us make this template better? Share your feedback here: https://forms.gle/ybq9Krt8jtBL3iCk7

#ARG NODE_VERSION=23.3.0

#FROM node:${NODE_VERSION}-alpine

# Use production node environment by default.
#ENV NODE_ENV production


#WORKDIR /usr/src/app

# Download dependencies as a separate step to take advantage of Docker's caching.
# Leverage a cache mount to /root/.npm to speed up subsequent builds.
# Leverage a bind mounts to package.json and package-lock.json to avoid having to copy them into
# into this layer.
#RUN 

# Run the application as a non-root user.
#USER root

# Copy the rest of the source files into the image.
#COPY . .

# Expose the port that the application listens on.
#EXPOSE 8080

# Run the application.
#CMD a.out
