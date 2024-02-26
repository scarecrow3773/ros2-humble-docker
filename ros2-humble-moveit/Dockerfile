FROM osrf/ros:humble-desktop-full-jammy

#SHELL ["/bin/bash", "-c"] 

RUN apt-get update && apt-get install -y \
    dbus-x11 \ 
    at-spi2-core \
    locales

# Setup
RUN locale-gen en_US en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
RUN export LANG=en_US.UTF-8

# General Setup
RUN apt-get install -y \
    software-properties-common \
    git \
    python3-pip \
    nautilus \
    gnome-terminal \
    gedit

# ROS+Gazebo Setup
RUN apt-get install -y \
    ros-humble-rqt \
    ros-humble-ros2-control \
    ros-humble-controller-manager \
    ros-humble-ros2-controllers \
    ros-humble-rqt-tf-tree \
    ros-humble-gazebo-ros2-control

RUN pip install xacro

RUN apt-get install -y \
    ros-humble-gazebo-plugins \
    ros-humble-rmw-cyclonedds-cpp

RUN export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp

RUN apt-get install -y \
    ros-humble-nav2-bringup \
    ros-humble-slam-toolbox \
    ros-humble-nav2-map-server \
    ros-humble-twist-mux \
    ros-humble-nav2-bringup \
    ros-humble-xacro \
    ros-humble-joint-state-publisher \
    ros-humble-joint-state-publisher-gui


# Install MoveIt
RUN sudo apt-get install -y \
    build-essential \
    cmake \
    git \
    libbullet-dev \
    python3-colcon-common-extensions \
    python3-flake8 \
    python3-pip \
    python3-pytest-cov \
    python3-rosdep \
    python3-setuptools \
    python3-vcstool \
    wget && \
    python3 -m pip install -U \
    argcomplete \
    flake8-blind-except \
    flake8-builtins \
    flake8-class-newline \
    flake8-comprehensions \
    flake8-deprecated \
    flake8-docstrings \
    flake8-import-order \
    flake8-quotes \
    pytest-repeat \
    pytest-rerunfailures \
    pytest

RUN apt-get update && apt-get dist-upgrade -y
#RUN sudo rosdep init
RUN rosdep update

SHELL ["/bin/bash", "-c"] 
RUN source /opt/ros/humble/setup.bash

# Uninstall Any Pre-existing MoveIt Debians
RUN apt-get remove ros-$ROS_DISTRO-moveit*

RUN export COLCON_WS=~/ws_moveit2/ 
#ENV COLCON_WS="~/ws_moveit2/"
RUN mkdir -p $COLCON_WS/src && cd $COLCON_WS/src

# Download Source Code
RUN cd $COLCON_WS/src && git clone https://github.com/ros-planning/moveit2.git -b $ROS_DISTRO
RUN cd $COLCON_WS/src && for repo in moveit2/moveit2.repos $(f="moveit2/moveit2_$ROS_DISTRO.repos"; test -r $f && echo $f); do vcs import < "$repo"; done
RUN rosdep install -r --from-paths . --ignore-src --rosdistro $ROS_DISTRO -y

# Build MoveIt
RUN cd $COLCON_WS && colcon build  --parallel-workers 1 --event-handlers desktop_notification- status- --cmake-args -DCMAKE_BUILD_TYPE=Release
RUN source $COLCON_WS/install/setup.bash


#SHELL ["/bin/bash", "-c"] 
#RUN cd ~/ros2_ws && source /opt/ros/humble/setup.bash

# Moveit2 Docker yaml: https://raw.githubusercontent.com/ros-planning/moveit2_tutorials/main/.docker/docker-compose.yml
# https://moveit.picknik.ai/main/doc/how_to_guides/how_to_setup_docker_containers_in_ubuntu.html

# Tutorial: https://moveit.picknik.ai/main/doc/tutorials/quickstart_in_rviz/quickstart_in_rviz_tutorial.html

# Universal Robot: https://github.com/ros-industrial/universal_robot

RUN echo "Done, now execute:"
RUN echo "cd ~/ros2_ws/src && ./ros_exam_auto.sh"
