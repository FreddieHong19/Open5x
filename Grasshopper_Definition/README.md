# Usage

This folder contains the necessary files for using Grasshopper to create a 5-axis G-code.
Grasshopper is a visual scripting extension integrated into a popular 3D CAD software called Rhino 3D.
Unfortunately, Rhino 3D is not free software, but a 90 days fully functioning free-trial version is provided.

The grasshopper script here is still undergoing improvement and development.
The eventual goal is to migrate the system off Rhino 3D and operate somewhere free and open source. 

The current iteration of the Grasshopper script requires the below dependencies:

https://www.food4rhino.com/en/app/heteroptera : To find a centroid of a 3D geometry
https://docs.microsoft.com/en-us/dotnet/api/system.linq?view=net-6.0 : To collect max/min values in list

Rhino 3D and Grasshopper are excellent for simulating the movements of the hardware.
To simulate the movement, the 3D file of the rotary gantry (e.g. Prusa_5axis_profile_v2.3dm) needs to be uploaded inside the simulation node.



# Update

The latest ieration of the Grasshopper script is from 2023-04-10


