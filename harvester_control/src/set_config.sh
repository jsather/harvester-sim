#!/bin/bash

# echo "Sleeping for 100 seconds!"
sleep 10 # Wait for Gazebo to load
rosservice call /gazebo/set_model_configuration 'j2s6s200' '' '[j2s6s200_joint_1, j2s6s200_joint_2, j2s6s200_joint_3, j2s6s200_joint_4, j2s6s200_joint_5, j2s6s200_joint_6]' '[0,2.9,1.3,4.2,1.4,0.0]' #'[4.85,  2.89024235,  4.67513993, 6.14, 1.75846814,4.85]' #'[-1.43407924,  2.89024235,  4.67513993, -0.1068601 , 1.75846814,-1.41330691]' '[0,2.9,1.3,4.2,1.4,0.0]' #'[-1.59529562,  2.9081193 ,  4.67507937,  3.14159056,  4.51632522,  3.1210306 ]'
rosservice call /gazebo/unpause_physics
rosservice call /j2s6s200/controller_manager/switch_controller '[effort_joint_trajectory_controller, effort_finger_trajectory_controller, joint_state_controller]' '[]' '2'
