FROM ros:noetic-robot-focal

ENV IM_IN_DOCKER Yes
ENV HOME /root

RUN apt update --fix-missing && \
    apt upgrade -y && \
    apt install -y \
    python3-pip

RUN apt install -y libzmq3-dev \
                    git \
                    build-essential \
                    autoconf \
                    libtool \
                    libeigen3-dev \
                    cmake \
                    vim \
                    gdb \
                    lsb-core \
                    wget


CMD [ "/bin/bash" ]