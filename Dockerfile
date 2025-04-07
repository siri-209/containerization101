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

