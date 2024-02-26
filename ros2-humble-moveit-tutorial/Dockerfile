FROM moveit/moveit2:main-humble-tutorial-source
# docker pull moveit/moveit2:main-humble-tutorial-source

#SHELL ["/bin/bash", "-c"] 

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y ros-${ROS_DISTRO}-ur

SHELL ["/bin/bash", "-c"] 
RUN source ~/ws_moveit/install/setup.bash

RUN echo "Done, now execute:"
RUN echo "ros2 launch moveit2_tutorials demo.launch.py"

# docker build -t r1_moveit2_tutorial .  
# docker run -e DISPLAY=host.docker.internal:0.0 -e LIBGL_ALWAYS_INDIRECT=0 --gpus all -it r1_moveit2_tutorial