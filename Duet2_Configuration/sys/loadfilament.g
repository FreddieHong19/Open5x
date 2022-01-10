M302 S0    ; Allow extrusion at any temperature
M291 P"Push down filament and press OK" R"Loading filament" S2


G1 E70 F700 ; Feed 70mm of filament at 800mm/min
G1 E50 F200 ; Feed 50mm of filament at 300mm/min
M400	      ; Wait for moves to complete
M302 S190    ; Allow extrusion at minimum 190

M302 S190  ; Allow extrusion above 190

G1 E5 F300 ; Feed 5mm of filament at 300mm/min
G1 E-1 F1000 ; Retract 1mm of filament at 1000mm/min
M400
M291 P"Please clean the nozzle then press OK" S2
M24
