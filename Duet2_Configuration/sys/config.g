;Open5x_ver_20211118

; General preferences
G90                                         ; Send absolute coordinates...
M83                                         ; ...but relative extruder moves
M555 P2 						; Set firmware compatibility to look like Marlin

;Kinematics Profile for 5-axis (cartesian)
M669 K0 X1:0:0:0:0 Y0:-1:0:0:0 Z0:0:1:0:0 U0:0:0:1:0 V0:0:0:0:1

; Network
M550 P"Open5x"                        ; Set machine name
M552 S1                                     ; Enable network
;M552 S2                                     ; Enable AP


;*** Access point is configured manually via M587
M586 P0 S1                                  ; Enable HTTP
M586 P1 S0                                  ; Disable FTP
M586 P2 S0                                  ; Disable Telnet
M575 P1 S1 B57600			  ; Panel Due


; Drive Mappings
M569 P0 S0                                  ; Drive 1 goes backward: X Axis
M569 P1 S0                                  ; Drive 1 goes backwards: Y Axis
M569 P2 S0                                  ; Drive 2 goes backwards: Z Z Axis
M569 P3 S1                                  ; Drive 3 goes forwards: E0
M569 P4 S0                                  ; Drive 4 goes anti-clockwise: U Axis
M569 P5 S0				    ; Drive 5 goes anti-clockwise: V Axis


M584 X0 Y1 Z2 E3 U4 V5 ; My Driver Mapping

;Microstepping and Speed

M350 X16 Y16 Z16 E32 A16 B16 I1                 			; Configure microstepping with interpolation

M92 X100.00 Y100.00 Z400.00 E280.00 A26.667 B35.556 		    ; Set steps per mm and steps per degree
M566 X480.00 Y480.00 Z24.00 E270.00 A480.00 B480.00 P1     	    ; Set maximum instantaneous speed changes (mm/min)
M203 X12000.00 Y12000.00 Z750.00 E1500.00 A5000.00 B12000.00  	    ; Set maximum speeds (mm/min)
M201 X1000.00 Y1000.00 Z1000.00 E1000.00 A1000.00 B1000.00   	    ; Set accelerations (mm/s^2)
M906 X620.00 Y620.00 Z560.00 E700.00 A1300.00 B1300.00 I10            ; Set motor currents (mA) and motor idle factor in percent
M84 S30                                    			    ; Set idle timeout


;Axis Limit
M208 X-126:125   Y-92.3:50  Z125:-1 A-200:200 B-12000:12000					; Centre of the rotating bed is set to origin 0,0
M564 H0								; allow unhomed movement


; Endstops for each Axis
M574 X1 S3				 ; Set endstops controlled by motor load detection
M574 Y1 S3                               ; Set endstops controlled by motor load detection
M574 Z2 S4                               ; configure sensorless endstop for high end on Z (Detected by two motors)


; Stallgaurd Sensitivy
M915 X S3 F0 H400 R1		                ; Set X axis Sensitivity
M915 Y S3 F0 H400 R1		                ; Set y axis Sensitivity
M915 Z S3 F0 H400 R1		                ; Set z axis Sensitivity




; Z-Probe (manual)
M558 P0 H15 F120 T6000                          ; disable Z probe but set dive height, probe speed and travel speed


; Heatbed Heaters and Thermistor Bed 
M140 H-1 ; Disable heated bed

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
M563 P0 D0 H1 F0                            ; Define tool 0 Heater Block 1
G10 P0 X0 Y0 Z0                             ; Set tool 0 axis offsets
G10 P0 R0 S0                                ; Set initial tool 0 active and standby temperatures to 0C



