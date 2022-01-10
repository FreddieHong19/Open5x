; stop.g
; called when a print is cancelled after a pause.

;M83            ; relative extruder moves
;G1 E-3 F3000  ; retract 3mm of filament
;G91            ; relative positioning
;G1 Z10 F360     ; lift Z by 10mm
;G90            ; absolute positioning