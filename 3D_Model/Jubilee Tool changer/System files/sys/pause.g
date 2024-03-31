
; Pause macro file
G1 E-3 F2500        ; retract 3mm
G91                 ; relative moves
;G1 H2 Z3 F5000      ; raise nozzle 3mm (rectangular 305 x 305mm)
G1 H2 Z33 F5000      ; raise nozzle 33mm (circular)
G90                 ; absolute moves
G1 X305 Y85 F5000   ; move head out of the way of the print