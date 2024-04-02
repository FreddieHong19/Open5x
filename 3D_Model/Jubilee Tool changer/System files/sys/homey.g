
; Home Y Axis

G91                     ; Set relative mode
;G1 H2 Z5 F5000          ; Lower the bed
G1 H2 Z33 F5000			; As above but circular bed, which requires greater dive.
G1 Y-400 F3000 H1       ; Big negative move to search for endstop
G1 Y4 F600              ; Back off the endstop
G1 Y-10 F600 H1         ; Find endstop again slowly
G1 Y50      ; Move away from front to avoid carriage slam if tool starts to the left of back Z endstop
;G1 H2 Z-5 F5000         ; Raise the rectangular 305 x 305mm bed
G1 H2 Z-33 F5000					; As above but circular bed, which requires greater dive.
G90                     ; Set absolute mode