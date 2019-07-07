# harvester-sim
![harvester-gif](https://imgur.com/0dghLur.gif)

Virtual harvesting environment using ROS and Gazebo. Originally used by Jonathon Sather in his research on autonomous strawberry harvesting. ([paper](https://arxiv.org/abs/1903.02074)) ([video summary](https://youtu.be/C6hrCVv2B-o))

This stack is a fork of [kinova-ros](https://github.com/Kinovarobotics/kinova-ros) that includes a simulated strawberry world with a procedurally generated strawberry plant. 

## Dependencies
* [ROS](https://www.ros.org)

```
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Set up keys (valid as of 6/30/2019)
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

# Install ROS kinetic
sudo apt-get update
sudo apt-get install -y ros-kinetic-desktop-full

# Initialize rosdep
sudo apt-get update
sudo rosdep init
rosdep update  # No sudo here

# Install related packages
sudo apt-get install python-rosinstall \
                   python-rosinstall-generator \
                   python-wstool \
                   build-essential \
                   ros-kinetic-ros-control \
                   ros-kinetic-ros-controllers \
                   ros-kinetic-gazebo-ros-control \
                   ros-kinetic-trac-ik-kinematics-plugin
```

* [ruby](https://www.ruby-lang.org/en/downloads/) (used for random plant generation)
```
sudo apt-get install ruby 
sudo gem install rubystats
```

## File System
 * `harvester_contol`: Launch file to start harvester controllers 
 * `harvester_description`: Where the meshes and URDF specifications live
 * `harvester_gazebo`: Launch file to start harvester gazebo world. Also includes world sdf files
 * `harvester_moveit`: Launch file for MoveIt drivers
 
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


## Usage
After testing, interface with [harvester-python](https://github.com/jsather/harvester-python) or your own agent. See havester-python for more details.

## Author

* **Jonathon Sather** 

## License
This project is licensed under the BSD 2-CLAUSE - see [LICENSE](LICENSE) for details.

## Acknowledgments
* harvester-sim based off of [kinova-ros](https://github.com/Kinovarobotics/kinova-ros)
