# 5-axis 3D printer

Full length article can be found in below:
https://arxiv.org/abs/2202.11426

Link to the videos:
https://www.youtube.com/watch?v=C3vKHuxUmjc&list=PLSqgj9-nhHAx7sJzOzrpPwBRhMIwGWn0z&index=4

This is a work-in-progress GitHub repository for Open5x: 5-axis 3D printer


There are other amazing works happening around 5-axis 3D printing.
Please refer to [Other works](Other_works.md) to add your multi-axis project submit a pull request and it will be added onto the list



This GitHub repository contains detailed research material of the published CHI 2022 conference paper titled "Open5x: Accessible 5-axis 3D printing and conformal slicing"

Research material shared in this repository include:

1. Materials and supplier list

2. 3D printing files for assembly

3. Settings for 3D printer electronics board (Duet2 + RepRap firmware 3.1.1)

4. Instructions for hardware assembly

5. Grasshopper definition and Rhino template for 5-axis Slicing.


![](images/5_axis_Prusa.jpg)

Link to the video:
https://youtu.be/x9rG15qrDIE


--------

This is an on-going project and there are still a few areas that need to be improved.
The next iteration of open5x will include:

Hardware:
1. Auto-levelling the tilt on U-axis (so the printing bed is perfectly in parallel with the X-axis) currently this is achieved through digital sprit level + manual G92 U0
2. Part cooling fan will be re-designed so that air is blown on to the end of the long nozzle but without reducing the contact angle.
3. Endstop on Z-axis to avoid manual bed levelling.

Software:
1. Grasshopper definition is going through series of iteration to reduce the computing time of slicing.
2. There are still few remaining errors in the current version which is being worked on.
3. Eventually we would aim to have stand-alone opensource slicer for 5-axis.

The current version of the open5X was shown at the East Coast RepRap Festival in Maryland on the 8 & 9th of October 2022

A major update is expected to be released in March 2023!

-------



[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/donate/?hosted_button_id=EU5UT7KPFXXUG)
