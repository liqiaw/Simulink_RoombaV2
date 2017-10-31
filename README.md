# Simulink_RoombaV2
# ECE 4422 Project #2
# Sean Martin 
Submission for Digital Controls ECE 4422 class project #2. Roomba obstacle avoidance via Simulink Stateflow

Note that this is a continuation of Project 1, whose code can be found at the below repository
```
https://github.com/spm1200/Simulink_Roomba
```
The below instructions are general setup of the iRobot for use in Simulink, and are a redo of Project 1 setup.

Download the below zipped file. Unzip the folder into 
your MATLAB folder. Add the folder to the Matlab search path by running
the following in the Matlab command window, changing
yourpath to your specific path.
```
>>>addpath(genpath('yourpath/Matlab/martin_project2'))
```
The below Matlab and Simulink dependencies are needed.
Download the Real Time Pacer Block in the Add-On
Explorer in MATLAB.
```
Add-Ons -> Get Add-Ons -> Real-Time Pacer for Simulink
```
Download the Matlab Toolbox for the iRobot Create 2 in the Add-On 
Explorer in MATLAB. 
```
Add-Ons -> Get Add-Ons -> Matlab Toolbox for the iRobot Create 2
```
A WiFi module is needed to connect to the Roomba via WiFi.
Use the WiFi Scanner program at the below link to do this.
```
http://download.lizardsystems.com/wifiscanner_setup.exe
```
The WiFi module used here is RooWiFi. Proceed to the link 
below and set up the module. Page 9 contains set-up info for the 
RooWiFi module. 
```
http://www.roowifi.com/wp-content/uploads/RwRemote_User_Guide_v2_rev15.pdf
```
Point your web browser to 10.0.0.1 to verify the connection with
the RooWiFi module.
```
10.0.0.1
```
Type the below command into the Matlab command window to open
Simulink
```
>>>simulink
```
Open the SAMPLE.slx file provided. Be sure to open the library file too 
so the Sample file can find the block references.
```
martin_sean_RoombaLib.slx
SAMPLE.slx
```
This file will run the 6 range sensors, the bump sensors, and
check battery percentage of the Roomba. These sensors will feed a control
algorithm which controls the left/right wheel speeds. The Roomba will Seek Dock
if the battery falls to 10% or below; moreover, there is an emergency stop feature
which is triggered by a push button on the Simulink file shown below. 

#![Alt text](relative/path/to/img.jpg?raw=true "Title")

The control alogorithm is shown below. These are the three parallel states, which will be explained in 
detail below.

#![Alt text](relative/path/to/img.jpg?raw=true "Title")

The Emergency Stop state is shown below. This simply checks the input stop button, and if this goes to 3
(via user input) then a Simulink function is called which stops the simulation, thus stopping the Roomba.

#![Alt text](relative/path/to/img.jpg?raw=true "Title")

The Battery Percentage state is shown below. This checks the charge level input from the Roomba Charge Level 
block. If the level becomes 10 or below, the Roomba is sent a Seek Dock command via a Matlab function block. The docking variable 
controls the Set Wheel Speed Roomba block. That is, when Seek Dock is desired, the Set Wheel Speed Roomba block is turned off.

#![Alt text](relative/path/to/img.jpg?raw=true "Title")

The Control Logic is shown below. This obstacle avoid logic goes straight, continuously checking the IR sensors and 
bump sensors. If any IR sensor becomes 1, the Roomba stops briefly. It determines a left or right zero point turn by 
checking if any of the left three sensors are high. If true, a right turn is completed. If false, a left turn is. Each of these 
zero point turns go until all sensors are clear for a minimum of half a second. Then the Roomba continues straight. If both bump sensors
engage the Roomba reverses. If left bump sensor engages the Roomba reverses and makes a right turn. If right bump sensor engages the
Roomba reverses and makes a left turn. See below for the stateflow.

#![Alt text](relative/path/to/img.jpg?raw=true "Title")

Another obstacle avoid alogrithm was tested. However, the Roomba's IR sensors only see objects at around a distance of 2 inches,
so moving turns usually end in a collision with the obstacle. See the below file.
```
SAMPLE_logicV2.slx
```
The Control Logic is shown below. There are six turns: wide right, tight right, right in place, left in 
place, tight left, wide left. Roomba makes a wide right if left most sensor is 1 and front sensors are 0. Roomba makes a tight right if 
left middle sensor is 1 and front sensors are 0. Roomba makes a right in place if left front sensor is 1. The logic is the same for the 
left turns but with the right sensors. The bump sensor logic is the same as V1. So are the battery level and emergency stop states.

#![Alt text](Simulink_RoombaV2/images/obstacle_avoidV2.png?raw=true "Title")

See below YouTube video for a demo.

[Simulink Roomba Demo](https://www.youtube.com/watch?v=wu4hABgC39g)
