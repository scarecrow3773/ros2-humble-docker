FROM osrf/ros:humble-desktop-full-jammy

#SHELL ["/bin/bash", "-c"] 

RUN apt-get update
# Error-fixing nautilus file-browser (weil: kann man ja immer mal brauchen)
RUN apt-get install -y dbus-x11 && apt-get install -y at-spi2-core

RUN  apt-get install locales

# Setup
RUN locale-gen en_US en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
RUN export LANG=en_US.UTF-8
RUN apt-get install -y software-properties-common
#RUN add-apt-repository universe

RUN apt-get install -y git && apt-get install -y python3-pip && apt-get install -y nautilus
RUN apt-get install -y gnome-terminal && apt-get install -y gedit

# ROS Setup
RUN apt-get install -y ros-humble-rqt

# Gazebo Installation
RUN apt-get install -y ros-humble-ros2-control
RUN apt-get install -y ros-humble-controller-manager
RUN apt-get install -y ros-humble-ros2-controllers
RUN apt-get install -y ros-humble-rqt-tf-tree
RUN apt-get install -y ros-humble-gazebo-ros2-control
RUN pip install xacro

RUN apt-get install -y ros-humble-gazebo-plugins
RUN apt-get install -y ros-humble-rmw-cyclonedds-cpp
RUN export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
RUN apt-get install -y ros-humble-nav2-bringup
RUN apt-get install -y ros-humble-slam-toolbox
RUN apt-get install -y ros-humble-nav2-map-server
RUN apt-get install -y ros-humble-twist-mux
RUN apt-get install -y ros-humble-nav2-bringup

RUN apt-get install -y ros-humble-xacro
RUN apt-get install -y ros-humble-joint-state-publisher
RUN apt-get install -y ros-humble-joint-state-publisher-gui


# Project cloning ... right now only for testing
RUN mkdir -p ~/ros2_ws/src
RUN cd ~/ros2_ws/src && git clone --branch ros2-humble-docker https://github.com/scarecrow3773/mobile_robotics_maze .

# ROS sourcing ...
SHELL ["/bin/bash", "-c"] 
#RUN source /opt/ros/humble/setup.bash

# Colcon build in docker is a wee bitch: "RUN source /opt/ros/humble/setup.bash" before "RUN colcon build" is not enough
RUN cd ~/ros2_ws && source /opt/ros/humble/setup.bash && colcon build
#SHELL ["/bin/bash", "-c"]
#RUN source ~/ros2_ws/install/local_setup.bash
#RUN export GAZEBO_MODEL_PATH=~/ros2_ws/src/mobile_robotics_maze/mobile_robotics_hschoon/meshes
RUN export GAZEBO_MODEL_PATH=~/ros2_ws/src/mobile_robotics_hschoon/meshes


#RUN cd ~/ros2_ws/src/mobile_robotics_maze && chmod +x ros_exam_auto.sh
RUN cd ~/ros2_ws/src && chmod +x ros_exam_auto.sh

RUN echo "Done :D"
