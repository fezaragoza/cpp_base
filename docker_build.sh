#!/bin/bash

echo "Building Docker Image..."

docker build --build-arg UID=$(id -u) --build-arg GID=$(id -g) --build-arg USERNM=$(whoami) \
            -t cpp_base:latest -f ./.devcontainer/Dockerfile .