; Fred_Prusa_20210722

; General preferences
G90                                         ; Send absolute coordinates...
M83                                         ; ...but relative extruder moves

; Network
M550 P"FPrusa"                        ; Set machine name
M552 S1                                     ; Enable network
;M552 S2                                     ; Enable AP

;*** Access point is configured manually via M587
M586 P0 S1                                  ; Enable HTTP
M586 P1 S0                                  ; Disable FTP
M586 P2 S0                                  ; Disable Telnet
M575 P1 S1 B57600							; Panel Due

; Drive Mappings
M569 P0 S0                                 ; Drive 0 goes backwards: X Axis
M569 P1 S1                                 ; Drive 1 goes forward: Y Axis
M569 P2 S0                                  ; Drive 2 goes backwards: Z Axis
M569 P3 S1                                  ; Drive 3 goes forwards: E Axis
M569 P4 S1                                  ; Drive 4 goes forwards: Z Axis (at E1)

; Micrpstepping and Speed
M350 X16 Y16 E16 Z16 I1                     ; Configure microstepping with interpolation
M92 X100.00 Y100.00 Z400.00 E415.00         ; Set steps per mm (prusa use gt2-16 pulley)
M566 X480.00 Y480.00 Z24.00 E270.00 P1      ; Set maximum instantaneous speed changes (mm/min)
M203 X12000.00 Y12000.00 Z750.00 E1500.00   ; Set maximum speeds (mm/min)
M201 X1000.00 Y1000.00 Z1000.00 E5000.00    ; Set accelerations (mm/s^2)
M906 X620.00 Y620.00 Z560.00 E650.00 I10    ; Set motor currents (mA) and motor idle factor in percent
M84 S30                                     ; Set idle timeout


;Axis Limit
M208 X0:240 Y0:185 Z-0.1:150  ; 			X carriage moves from 0 to 240, Y bed goes from 0 to 185, Z -0.1 to 150
M564 H0							; allow unhomed movement

; Endstops for each Axis
M574 X1 S3				 ; Set endstops controlled by motor load detection
M574 Y1 S3                               ; Set endstops controlled by motor load detection

; Stallgaurd Sensitivy
M915 X S3 F0 H400 R1		                ; Set X axis Sensitivity
M915 Y S3 F0 H400 R1		                ; Set y axis Sensitivity

; Z-Probe PINDA
M574 Z1 S2 ; Set endstops controlled by probe
M558 P5 C"^zprobe.in" I1 H0.7 F1000 T6000 A20 S0.005 ; PINDA
M308 S2 P"e1_temp" A"PINDA" Y"thermistor" T100000 B3950
;G31 P1000 X23 Y5 Z0.985 	                 ; PEI Sheet Offset C0.0010 S20 H2	
;G31 P1000 X23 Y5 Z0.440 	                 ; PEI Sheet Offset MICRO SWISS NOZZLE	
;G31 P1000 X23 Y5 Z1.285 					; Textured Sheet Offset
G31 P1000 X23 Y5 Z0.770 					; Textured Sheet Offset MICRO SWISS NOZZLE

M557 X24:221 Y10:195 P9                     ; Define mesh grid

; Heatbed Heaters and Thermistor Bed 
M308 S0 P"bed_temp" Y"thermistor" T100000 B4138 R4700 ; Set thermistor + ADC parameters for heater 0 Bed
M950 H0 C"bedheat" T0						; Creates Bed Heater
M307 H0 A128.0 C498.9 D4.5 V24.0 B0         ; Bed PID Calibration and PWM
M140 H0										; Bed uses Heater 0
M143 H0 S120                                ; Set temperature limit for heater 0 to 120C Bed

; Filament Sensor Port and Loading Feature ON
M950 J1 C"e0stop" ; Input 1 e0 Filament Sensor 
M581 P1 T2 S0 R0 ; Filament Sensor P1 triggers Trigger2.g always (R0)

; HotEnd Heaters and Thermistor HotEnd           
M308 S1 P"e0_temp" Y"thermistor" T100000 B4725 R4700  ; Set thermistor + ADC parameters for heater 1 HotEnd
M950 H1 C"e0heat" T1					; Create HotEnd Heater
M307 H1 A306.9 C115.4 D4.0 V23.8 B0		; Hotend PID Calibration and PWM
M143 H1 S285                            ; Set temperature limit for heater 1 to 285C HotEnd
M302 S185 R185

; Fans
M950 F1 C"Fan1" Q250				; Creates HOTEND Fan
M106 P1 T45 S255 H1                 ; HOTEND Fan Settings
M950 F0 C"Fan0" Q250				; Creates PARTS COOLING FAN
M106 P0 H-1                         ; Set fan 1 value, PWM signal inversion and frequency. Thermostatic control is turned off PARTS COOLING FAN

; Tools
M563 P0 D0 H1 F0                            ; Define tool 0
G10 P0 X0 Y0 Z0                             ; Set tool 0 axis offsets
G10 P0 R0 S0                                ; Set initial tool 0 active and standby temperatures to 0C



