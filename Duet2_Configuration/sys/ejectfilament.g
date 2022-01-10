; Filament runout feature stop and frees up port
M591 D0 P0 C"e0stop" S1 ; Filament Runout Sensor
M950 J1 C"nil"

M291 P"Please wait while the nozzle is being heated up" R"Unloading PLA" T5 ; Display message
T0 ; Activate Hotend
M109 S210
M291 P"Retracting filament..." R"Unloading PLA" T5 ; Display another message
G1 E+8 F300 ; Extrude 8mm of filament at 300mm/min
G1 E-45 F800 ; Retract 480mm of filament at 800mm/min
G1 E-15 F900 ; Retract 480mm of filament at 900mm/min
G1 E-25 F900 ; Retract 480mm of filament at 900mm/min
M400 ; Wait for the moves to finish
M292 ; Hide the message again
M300 S800 P200

; Filament Sensor gets ready for next load
M950 J1 C"e0stop" ; Input 1 e0 Filament Sensor 
M581 P1 T3 S0 R0 ; Filament Sensor P1 triggers Trigger2.g always (R0)




