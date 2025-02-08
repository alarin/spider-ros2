#!/bin/bash

echo "ANTSY starting..."

source install/setup.bash

echo "Lauching control node..."
ros2 run antsy_control follow_velocity_rectangle &

echo "Launching robot description..."
ros2 launch antsy_description description.launch.py &

# echo "Enabling motors..."
# ros2 run hiwonder_ros2 write_motors_only &

# source install/setup.bash
# exec bash

wait