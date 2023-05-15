# Jubilee 3D Printer Open5x Implementation

This is a work-in-progress folder for files associated with creating an Open5X Jubilee 3D Printer. The files are provided, as-is, with no implied further support. Fabricating the module is easy but there is inherent risk with its use; collisions or other issues could cause permanent mechanical damage. Use at your own risk.

The files in this folder have been tested on a 300 mm^3 build space Jubilee 3D printer and may require modification for production systems.

# Introduction
These files are for modifying a Jubilee 3D printer to be compatible with the 5-axis build platform in the E3D_ToolChanger folder in this repo. By printing and assembling these parts, the Z-axis on a stock Jubilee can accept the existing 5-axis build platform.

# Integration Warnings
- Make sure to set tool change macros such that the tool will always clear the top of the 5-axis build platform before and after tool changes
- Collisions of the build plate and the gantry can happen during 5-axis printing. Be careful!

# Hardware Required
The below hardware is in addition to the additional hardware needed to make the 5-axis build platform specified in the E3D_Toolchanger folder

## Components to affix metal plate to z-axis couplers
(You can re-use the existing nuts and bolts below from your current Z-axis bed couplers if needed)
- 8x bolts to affix to linear rails
- 2x anti-backlash nuts for Z-axis travel
- 8x M4 heat-set inserts to affix to Z-axis bridge plate (Recommend Ultrasert ii)
- 8x M4 bolts to affix to Z-axis bridge plate
  
## Components to affix the 5-axis build platform to the Z-axis bridge plate
- 4x M4 bolts
- 4x M4 nuts

# Printed Parts
- 1x left bed coupler
- 1x right bed coupler

# Additional Parts
The below part can be ordered from sendcutsend or another laser cutting service (should be ~$35 total, shipped).

- 1x Z-axis bridge plate

# Firmware Notes
- A Duet3 with RepRap Firmware was used.
- An example config file is provided for you to adapt to your printer. Make sure to use the file as an example only to adapt to your own use case and printer setup.

# Additional Notes
- (A axis would rotate around the X-axis by convention)
- B axis rotates around the Y-axis by convention
- C axis rotates around the Z-axis by convention

# Potential Improvements for Next Revision
- Use 20x40 AL extrusion instead of laser-cut steel, add additional printed component in this design
- Explain changes to config vs. stock and add additional documentation