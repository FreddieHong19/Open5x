M290 R0 S0                 ; Reset baby stepping
M561                       ; Disable any Mesh Bed Compensation
; ---probe points for 305 x 305 mm rect bed -----
;G30 P0 X152.5 Y5 Z-99999   ; probe near back leadscrew
;G30 P1 X295 Y295 Z-99999   ; probe near front left leadscrew
;G30 P2 X5 Y295 Z-99999 S3  ; probe near front right leadscrew and calibrate 3 motors

; --- probe point for 100 mm circular bed -----
G30 P0 X-44 Y0 Z-99999
G30 P1 X44 Y0 Z-99999 S2 	; probe both sides of circular bed and calibrate 2 motors.

M98 P"0:/macros/meshLevel.g"                     ; Enable Mesh Bed Compensation (rerun and save height map)