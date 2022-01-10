M302 S190  ; Allow extrusion above 190

G1 E5 F300 ; Feed 5mm of filament at 300mm/min
G1 E-1 F1000 ; Retract 1mm of filament at 1000mm/min
M400
M291 P"Please clean the nozzle then press OK" S2
M24
