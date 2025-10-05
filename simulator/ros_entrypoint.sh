#!/bin/bash

echo "ANTSY Simulator Container"

#bash /entrypoint.sh &

source /opt/ros/jazzy/setup.sh
source install/setup.bash
#exec bash
#ros2 launch antsy_simulation gz.launch.py
echo "Lauching control node..."
ros2 run antsy_control follow_velocity_rectangle &

echo "Launching robot description..."
ros2 launch antsy_description description.launch.py &

ros2 launch antsy_simulation simulator.launch.xml

exec "$@"
