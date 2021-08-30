#!/bin/bash
docker run -it --name=cpp_base_container --rm --net=host \
            --user $(id -u):$(id -g) \
            cpp_base:latest

# -v /mnt/c/Users/ferzm/project/src:/root/ferzm/project/src
# --mount source=/mnt/c/Users/ferzm/project/src/,target=/root/ferzm/,type=bind