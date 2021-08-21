#!/bin/bash

echo "Building Docker Image..."

docker build -t cpp_base:latest -f ./.devcontainer/Dockerfile .