FROM ros:noetic-robot-focal

ENV IM_IN_DOCKER Yes

ARG USERNM
ARG UID
ARG GID

RUN groupadd -g ${GID} ${USERNM}
# RUN useradd -ms /bin/bash ${USERNM}
RUN useradd -m -u ${UID} -g ${GID} -s /bin/bash ${USERNM} && \
    usermod -aG sudo ${USERNM}
# RUN useradd ${USERNM} sudo
# RUN adduser --disabled-password --gecos '' ${USERNM}
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER ${USERNM}

ENV HOME /home/${USERNM}

# UBUNTU LIBRARIES & PACKAGES
RUN sudo apt update --fix-missing && \
    sudo apt upgrade -y && \
    sudo apt install -y \
    python3-pip

RUN sudo apt install -y  lsb-core \ 
                    # Linux Std Base support
                    # GENERAL DEV
                    libzmq3-dev \
                    git \
                    vim \
                    # C/C++
                    #   gcc, g++, libc6-dev, make, dpkg-dev
                    build-essential \ 
                    #   GNU
                    gdb \
                    autoconf \
                    libtool \
                    #   C++ Linear Alg. Lib.
                    libeigen3-dev \
                    # GENERAL
                    cmake \
                    wget

# ROS-DEV
RUN sudo rosdep fix-permissions
RUN rosdep update

RUN /bin/bash -c "source /opt/ros/noetic/setup.bash; mkdir -p ~/catkin_ws/src/; cd ~/catkin_ws; catkin_make"


# LOCAL COPIES
COPY ./start.sh $HOME/
RUN echo "source ~/start.sh" >> ~/.bashrc


# ENDING PHASE
RUN /bin/bash -c "source /opt/ros/noetic/setup.bash; cd ~/catkin_ws; catkin_make; source devel/setup.bash" 


WORKDIR ${HOME}/
CMD [ "/bin/bash" ]