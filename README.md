# ros2-humble-docker
This repository contains several Dockerfiles for various ROS2 Humble Hawksbill projects and tests. The projects are part of the Industrial Informatics Master (MEng) at the University of Applied Sciences Emden/Leer, Germany.


### Notes
(just for me: "ctrl-k v" Opens markdown preview to the side)
docker build -t <"NAME">
docker run -e DISPLAY=host.docker.internal:0.0 -it <"NAME">

## mazebot-hsel
This Dockerfile is used for running the [mazebot](https://github.com/scarecrow3773/mobile_robotics_maze) (Apache-2.0 license) from the HSEL Mobile Robotics course with ROS2 Humble Hawksbill.

## ros2-humble-moveit
Dockerfiles for installing Moveit with ROS2 Humble Hawksbill following the [tutorial](https://moveit.picknik.ai/humble/doc/tutorials/getting_started/getting_started.html).

## Path-Planning and Maze-Solving Example
[https://github.com/HaiderAbasi/ROS2-Path-Planning-and-Maze-Solving](https://github.com/HaiderAbasi/ROS2-Path-Planning-and-Maze-Solving/blob/master/docker/run_docker_Win10.MD)

## UniversalRobot
[Drivers](https://github.com/UniversalRobots/Universal_Robots_ROS2_Driver)
[Moveit Guide](https://docs.ros.org/en/ros2_packages/rolling/api/ur_robot_driver/usage.html#using-moveit)
[URSim Docker](https://docs.ros.org/en/ros2_packages/rolling/api/ur_robot_driver/installation/ursim_docker.html)