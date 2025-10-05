
FROM --platform=linux/amd64 ghcr.io/tiryoh/ros2-desktop-vnc:jazzy

# Install deps
RUN apt update && apt install -y \
    python3-colcon-common-extensions \
    python3-rosdep \
    && rm -rf /var/lib/apt/lists/*

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ros-jazzy-rmw-cyclonedds-cpp \
    ros-jazzy-ros-gz
    

# Set workspace
WORKDIR /home/antsy

# Build your code
# RUN . /opt/ros/jazzy/setup.sh && \
#     rosdep update && rosdep install --ignore-src -r -y && \
#     colcon build
# RUN rosdep init && \
#RUN  rosdep update
RUN cd /home/$USERNAME/ && colcon build
COPY ./ros_entrypoint.sh /
RUN chmod +x /ros_entrypoint.sh
#ENTRYPOINT ["/ros_entrypoint.sh"]
#CMD ["bash"]
