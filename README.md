# 5-axis 3D printer

This is a github repository for Open5x: 5-axis 3D printer


This Github repository contains detailed research material of the published CHI 2022 conference paper titled "Open5x: Accessible 5-axis 3D printing and conformal slicing"

Research mateiral shared in this repository include:

1. Materials and supplier list

2. 3D printing files for assembly

3. Settings for 3D printer electronics board (Duet2 + RepRap firmware 3.1.1)

4. Instructions for hardware assemnbly

5. Grasshopper definition and Rhino template for 5-axis Slicing.


![](images/5_axis_Prusa.jpg)

Link to the video:

https://youtu.be/x9rG15qrDIE


--------

This is an on-going project and there are still a few areas that need to be improved.
The next iteration of open5x will include:

Hardware:
1. Auto-leveling the tilt on U-axis (so the printing bed is perfeclty in parall with the X-axis) currently this is achieved through digital sprit level + manual G92 U0
2. Part cooling fan will be re-designed so that air is blown on to the end of the long nozzle but without reducing the contact angle.
3. Endstop on Z-axis to avoid manual bed leveling.

Software:
1. Grasshopper definition is going through series of iteration to reduce the computing time of slicing.
2. There are still few remaining erors in the currrent version which is being worked on.
3. Eventually we would aim to have stand-alone opensource slicer for 5-axis.

The current version of the open5X will be shown at 3D meetup Sweden 2022 March 26-27


-------

Donation
[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/donate/?hosted_button_id=EU5UT7KPFXXUG)

