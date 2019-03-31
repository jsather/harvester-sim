#!/bin/bash
# Description: set_config.sh is a hack to force robot into acceptable position 
#     at the beginning of the simulation. Should be unnecessary on recent 
#     versions of Gazebo.

sleep 10 # Wait for Gazebo to load
rosservice call /gazebo/set_model_configuration 'j2s6s200' '' '[j2s6s200_joint_1, j2s6s200_joint_2, j2s6s200_joint_3, j2s6s200_joint_4, j2s6s200_joint_5, j2s6s200_joint_6]' '[0,2.9,1.3,4.2,1.4,0.0]' 
rosservice call /gazebo/unpause_physics
rosservice call /j2s6s200/controller_manager/switch_controller '[effort_joint_trajectory_controller, effort_finger_trajectory_controller, joint_state_controller]' '[]' '2'
