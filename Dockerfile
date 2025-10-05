FROM osrf/ros:jazzy-desktop-full

# Install deps
RUN apt update && apt install -y \
    python3-colcon-common-extensions \
    python3-rosdep \
    && rm -rf /var/lib/apt/lists/*

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ros-jazzy-rqt* \
    ros-jazzy-plotjuggler-ros \
    ros-jazzy-xacro \
    ros-jazzy-joint-state-publisher \
    ros-jazzy-joint-state-publisher-gui \
    ros-jazzy-actuator-msgs \
    ros-jazzy-rmw-cyclonedds-cpp

# Set workspace
WORKDIR /ros2_ws
COPY ./src ./src
COPY entrypoint.sh /entrypoint.sh
# Build your code
RUN . /opt/ros/jazzy/setup.sh && \
    rosdep update && rosdep install --from-paths src --ignore-src -r -y && \
    colcon build
# Default launch command
#ENTRYPOINT ["/bin/bash"]
