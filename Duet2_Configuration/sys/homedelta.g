; Example Homing file for RepRapFirmware on delta printer

M117 Use https://configurator.reprapfirmware.org/ to set up your printer config

;G91							; use relative positioning
;******* Change F250 in the following line to F2500 when you are finished commissioning
;******* Change 320 in the following to a higher value if your Kossel has taller towers
;G1 S1 X320 Y320 Z320 F2500	; move all carriages up 320mm, stopping at the endstops
;G1 S2 X-3 Y-3 Z-3			; move all carriages down 3mm
;G1 S1 X6 Y6 Z6 F250			; move carriages slowly up 6mm, stopping at the endstops
;G1 Z-5 F2000				; down a few mm so that we can centre the head
;G90							; back to absolute positioning
;G1 X0 Y0 F2000				; centre the head and set a reasonable feed rate
