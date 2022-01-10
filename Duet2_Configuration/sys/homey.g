M915 X S2 F0 H400 R0		                ; Set X axis Sensitivity
M915 Y S2 F0 H400 R0		                ; Set y axis Sensitivity

M913 X50 Y50 Z100 ; set X Y Z motors to 50% of their normal current

G91                     ; relative positioning
G1 Z8 F800 H2          ; lift Z relative to current position
G1 H1 Y-215 F4800 ; move quickly to X and Y axis endstops and stop there 