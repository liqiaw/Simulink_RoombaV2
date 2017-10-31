# Simulink_RoombaV2
# ECE 4422 Project #2
# Sean Martin 
Submission for Digital Controls ECE 4422 class project #2. Roomba obstacle avoidance via Simulink Stateflow

Note that this is a continuation of Project 1, whose code can be found at the below repository
```
https://github.com/spm1200/Simulink_Roomba
```

Download the below zipped file. Unzip the folder into 
your MATLAB folder. Add the folder to the Matlab search path by running
the following in the Matlab command window, changing
yourpath to your specific path.
```
>>>addpath(genpath('yourpath/Matlab/martin_project1'))
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
Open the sample .slx file provided. Be sure to open the library file too 
so the Sample file can find the block references.
```
martin_sean_RoombaLib.slx
SampleWIFI.slx
```
This file will run the 6 range sensors on the Roomba,
check battery percentage and temperature sensor as well
as set the wheel speeds (defaults to spinning the Roomba in 
a circle). See below YouTube video for a demo.

[Simulink Roomba Demo](https://www.youtube.com/watch?v=0nQMwHtMGac)
