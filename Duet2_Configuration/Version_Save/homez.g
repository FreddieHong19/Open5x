; homez.g
; called to home the Z axis
;
; generated by RepRapFirmware Configuration Tool v2 on Tue Aug 06 2019 23:15:45 GMT+0200 (Central European Summer Time)


;Uncomment the following to use Pinda Sensor
G91              ; relative positioning
G1 Z5 F6000 S2   ; lift Z relative to current position
G90              ; absolute positioning
G1 X100 Y90 F6000 ; go to first probe point
G30              ; home Z by probing the bed

; Uncomment the following lines to lift Z after probing
;G91             ; relative positioning
;G1 S2 Z5 F100   ; lift Z relative to current position
;G90             ; absolute positioning
