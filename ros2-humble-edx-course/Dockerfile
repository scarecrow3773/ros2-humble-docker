# This is an auto generated Dockerfile for ros:desktop-full
# generated from docker_images/create_ros_image.Dockerfile.em
FROM osrf/ros:noetic-desktop-focal

# install ros packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-noetic-desktop-full=1.5.0-1* \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && sudo apt-get install -y git \
    lsb-release \
    wget \
    gnupg

#RUN apt-get update && apt-get upgrade -y

#RUN apt-get remove libignition-math6 libignition-math6-dev
#RUN wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg
#RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null
#RUN apt-get update
#RUN apt-get install -y libignition-math5 libignition-math5-dev

RUN echo "Machs nochmal 11"
# Project cloning ... right now only for testing
RUN mkdir -p ~/catkin_ws/src
RUN cd ~/catkin_ws/src && git clone https://github.com/scarecrow3773/ros2-edx-files .
RUN cd ~/catkin_ws/src && git clone https://github.com/ros-planning/moveit_msgs.git
RUN cd ~/catkin_ws/src && git clone --branch noetic-devel https://github.com/wg-perception/object_recognition_msgs.git
RUN cd ~/catkin_ws/src && git clone --branch melodic-devel https://github.com/OctoMap/octomap_msgs.git

RUN apt install -y python3-catkin-tools
SHELL ["/bin/bash", "-c"] 
RUN cd ~/catkin_ws && source /opt/ros/noetic/setup.bash && catkin build


# ROS sourcing ...
SHELL ["/bin/bash", "-c"] 
# Colcon build in docker is a wee bitch: "RUN source /opt/ros/humble/setup.bash" before "RUN colcon build" is not enough
#RUN cd ~/catkin_ws && source /opt/ros/noetic/setup.bash && catkin_make
#RUN cd ~/catkin_ws && source /opt/ros/noetic/setup.bash && catkin_make --pkg hrwros_week5 hrwros_msgs
#RUN cd ~/catkin_ws && source /opt/ros/noetic/setup.bash


RUN echo "Done, now execute:"