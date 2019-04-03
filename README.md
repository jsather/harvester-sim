# harvester-sim
<img src="https://imgur.com/0dghLur.gif" width="480">

Virtual harvesting environment using ROS and Gazebo. Originally used by Jonathon Sather in his research on viewpoint optimization for autonomous harvesting. ([preprint](https://arxiv.org/abs/1903.02074)) ([video summary](https://youtu.be/C6hrCVv2B-o))

This stack is a fork of [kinova-ros](https://github.com/Kinovarobotics/kinova-ros) that includes a simulated strawberry world with a procedurally generated strawberry plant. 

## Supported versions
This package has been tested on ROS Kinetic with Gazebo 7.1.0 on Ubuntu 64-bit 16.04. The full tested configuration, including dependencies, can be found in this [Dockerfile](https://github.com/jsather/harvester-docker/blob/master/harvester_project_build/Dockerfile).

## File System
 - `harvester_contol`: Launch file to start harvester controllers 
 - `harvester_description`: Where the meshes and URDF specifications live
 - `harvester_gazebo`: Launch file to start harvester gazebo world. Also includes world sdf files
 - `harvester_moveit`: Launch file for MoveIt drivers
 
## Installation
Clone the repo into your [catkin workspace](http://wiki.ros.org/catkin/Tutorials/create_a_workspace) and build using catkin_make.
```
cd ~/catkin_ws/src
git clone https://github.com/jsather/harvester-sim.git
cd ~/catkin_ws
catkin_make
source devel/setup.bash
```

Add the harvester world and model files to your Gazebo path.

```
export GAZEBO_RESOURCE_PATH=~/catkin_ws/src/harvester-sim/harvester_gazebo:$GAZEBO_RESOURCE_PATH
export GAZEBO_MODEL_PATH=~/catkin_ws/src/harvester-sim/harvester_gazebo/models:$GAZEBO_MODEL_PATH
```

## Running the Simulated Environment
Run harvester_test.launch to spawn arm and randomly generated plant.
``` 
roslaunch harvester_gazebo harvester_test.launch
```
![env](https://imgur.com/J0Mert7.jpg)

The camera view can be seen on the RQT image viewer. 
```
rqt
```
<img src="https://imgur.com/LFBCUxW.jpg" width="480">

After testing, interface with [harvester-python](https://github.com/jsather/harvester-python) or your own agent. See havester-python for more details.

## Built With
* [Gazebo](http://gazebosim.org) - Physics simulator
* [ROS](https://www.ros.org) - Robotics framework

## Author

* **Jonathon Sather** 

## License
This project is licensed under the BSD 2-CLAUSE - see [LICENSE](LICENSE) for details.

## Acknowledgments
* harvester-sim based off of [kinova-ros](https://github.com/Kinovarobotics/kinova-ros)
