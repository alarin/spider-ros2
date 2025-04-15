#!/bin/bash

echo "ANTSY Simulator Container"
source install/setup.bash
ros2 launch antsy_simulation gazebo.launch.py
exec "$@"