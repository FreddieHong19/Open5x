; Jubilee CoreXY ToolChanging Printer - Config File
; This file intended for Duet 3 hardware, main board plus onr expansion boards
h
; Name and network
; This is configured from the connected Raspberry Pi or here if in stand alone
; mode
;-------------------------------------------------------------------------------
; Networking
M550 P"Jubilee"           ; Name used in ui and for mDNS  http://Jubilee.local
;M552 P192.168.1.2 S1      ; Use Ethernet with a static IP, 0.0.0.0 for dhcp
;M553 P255.255.255.0       ; Netmask
;M554 192.168.1.1          ; Gateway


; General setup
;-------------------------------------------------------------------------------
M111 S0                    ; Debug off 
M929 P"eventlog.txt" S1    ; Start logging to file eventlog.txt

; General Preferences
M555 P2                    ; Set Marlin-style output
G21                        ; Set dimensions to millimetres
G90                        ; Send absolute coordinates...
M83                        ; ...but relative extruder moves


; Stepper mapping
;-------------------------------------------------------------------------------
; Connected to the MB6HC as the table below.
; Note: first row is numbered left to right and second row right to left
; _________________________________
; | X(Right) | Y(Left)  | U(lock) |
; | Z(Back)  | Z(Right) | Z(Left) |
; Main board addresses:
; 0.X: Duet 3 Mini 5+ (drivers 0.0 - 0.4)
; 1.X: Duet 6HC expansion (drivers 1.0 - 1.2)


; --------- Set physical drive properties -----
;M569 P0 S0                ; Drive 0 | X stepper
;M569 P1 S0                ; Drive 1 | Y Stepper
;M569 P0.4 S0  D2           ; Drive 4 | Back Z D3 stealth chop ; no longer need this leadscrew

M569 P1.0 S0 D3         ; 3HC Drive 0 | X stepper | Port 0 , D3 stealthchop
M569 P1.1 S0 D3            ; 3HC Drive 1 | Y Stepper | Port 1 D3 stealthchop                                        
M569 P0.1 S0                  ; Drive 2 | U Tool Changer Lock  670mA
M569 P0.2 S0  D2        ; Drive 2 | Front Left Z D3 stealth chop
M569 P0.3 S0  D2            ; Drive 3 | Front Right Z D3 stealth chop
M569 P0.4 ; Want B axis to go anti-clockwise
M569 P0.0 S0; See same for C axis but for some reason one S0 and one S1 worked.

; ------ All axis drive mapping -----
M584 X1.1 Y1.0                ; X and Y for CoreXY
M584 U0.1                   ; U for toolchanger lock
M584 Z0.2:0.3               ; Z has two drivers
M584 B0.4
M584 C0.0

; ----- Set motor currents -------
M906 U{0.7*sqrt(2)*670} I60 ; 70% of 670mA RMS idle 60%
                            ; Note that the idle will be shared for all drivers
M906 Z{0.7*sqrt(2)*1680}  ; 70% of 1680mA RMS
M906 X{0.85*sqrt(2)*2500} ; LDO XY 2000mA RMS the TMC5160 driver on duet3
M906 Y{0.85*sqrt(2)*2500} ; generates a sinusoidal coil current so we can 
                          ; multply by sqrt(2) to get peak used for M906
                          ; Do not exceed 90% without heatsinking the XY 
                          ; steppers.
M906 B{0.7*sqrt(2)*1500} ; 70% the peak of a sinusoidal current * rated
						 ; current / phase of my motor, which is 1500 mA
						 ; motors are the TwoTrees Nema 17 motors.
M906 C{0.7*sqrt(2)*1500}


;Distribution/ToolBoard


; Toolboard 0: address 20
; Toolboard 1: address 21
; Toolboard 2: address 22
;Toolboard 3: address 23
; Tool steppers on toolboards

M584 E20.0:21.0:22.0:23.0
M569 P20.0 S0 D2 ; D2 is spreadcycle D3 is stealthchop

M569 P21.0 S0 D2 ; D2 is spreadcycle D3 is stealthchop

M569 P22.0 S0 D2 ;

M569 P23.0 S1 D2 ; Sherpa Micro reversed
;M584 E1.0:1.1             ; Extruders for two tools on expansion board address 1
;M569 P1.0 S0 D2           ; Drive 6 | Extruder T0 1400mA Spreadcycle Mode
;M569 P1.1 S0 D2           ; Drive 7 | Extruder T1 1400mA Spreadcycle Mode
;M906 E1400                ; {0.7*sqrt(2)*1400} 70% of 1400mA
                          ; E don't support expressions in 3.2.0-beta4


;M569 P3 S0 D2             ; Drive 3 direction | Extruder 0 in Spreadcycle Mode
;M569 P4 S0 D2             ; Drive 4 direction | Extruder 1 in Spreadcycle Mode



; Kinematics
;-------------------------------------------------------------------------------
; Kinematics for CoreXYBC printer
; From Garth's: 
M669 K8 X1:1:0:0:0:0 Y1:-1:0:0:0:0 Z0:0:1:0:0:0 B0:0:0:0:1:0 C0:0:0:0:0:1 U0:0:0:1:0:0

; Kinematic bed ball locations.
; Locations are extracted from CAD model assuming lower left build plate corner
; is (0, 0) on a 305x305mm plate.
;M671 X297.5:2.5:150 Y313.5:313.5:-16.5 S10 ; Front Left: (297.5, 313.5)
                                           ; Front Right: (2.5, 313.5)
                                           ; Back: (150, -16.5)
                                           ; Up to 10mm correction

; With the 5 axis bed, we only use Front Left and Front Right screws, so can delete Back.
; Also, adjust coordinates so we pivot at the screws, not at the ball joints (no longer have those)
M671 X297.5:2.5 Y313.5:313.5 S2 ; Front Left: (297.5, 313.5)
                                           ; Front Right: (2.5, 313.5)
                                           ; Up to 2mm correction b/c rigid screws.

; Axis and motor configuration 
;-------------------------------------------------------------------------------

M350 X1 Y1 Z1 U1       ; Disable microstepping to simplify calculations

;M92 X{1/(0.9*16/180)}  ; step angle * tooth count / 180
;M92 Y{1/(0.9*16/180)}  ; The 2mm tooth spacing cancel out with diam to radius
;M92 E51.875            ; Extruder - BMG 0.9 deg/step

M92 X{1/(1.8*16/180)}  ; step angle * tooth count / 180
M92 Y{1/(1.8*16/180)}  ; The 2mm tooth spacing cancel out with diam to radius
M92 Z{360/0.9/4}       ; 0.9 deg stepper / lead (4mm) of screw 
M92 U{13.76/1.8}       ; gear ratio / step angle for tool lock geared motor.
M92 B{{(200/360)*(80/20)}*16} ; steps per deg in body = gear ratio *
							  ; (steps/rev * rev/degree) *
							  ; microstepping factor
M92 C{{(200/360) * (72/20)} * 16}; as above with the 72T gear for bed

; Enable microstepping all step per unit will be multiplied by the new step def
M350 X16 Y16 I1        ; 16x microstepping for CoreXY axes. Use interpolation.
M350 U4 I1             ; 4x for toolchanger lock. Use interpolation.
M350 Z16 I1            ; 16x microstepping for Z axes. Use interpolation.
M350 B16 I1			   ; 16x microstepping for B and C axes with interp.
M350 C16 I1

;Extruder
M350 E16:16:16:16 I1         ; 16x microstepping for Extruder axes. Use interpolation.
M92 E695:695:695:735 ; Exstruder steps/mm 
M203 E7200:7200:7200:7200 ; max speed mm/min
M566 E400:400:400:400 ; Instantaneous speed change mm/min
M201 E10000:10000:10000:10000 ; accerlation mm/s2
M906 E1200:1200:1200:1200 I10 ;motor current 1.2A idle current 10%
M207 S1.5 F7200 Z0.2 ; firmware retraction

M572 D1 S0.10            ; Set pressure advance,(esun_matte_pla, edxtech ezpc_cf, esun_pla+, overture petg)
M572 D0 S0.00    ;Set pressure advance, 3dxtech ezpc
M572 D2 S0.06
M572 D3 S0.06
; Speed and acceleration
;-------------------------------------------------------------------------------
;M201 E1300                              ; Extruder

M201 X2000 Y2000                        ; Accelerations (mm/s^2)
M201 Z100                               ; LDO ZZZ Acceleration
M201 U800                               ; LDO U Accelerations (mm/s^2)
M201 B1000								; Can find with a acceleration
										; calculator online, but that
										; requires data i don't have
										; yoinked Garth's 1000 mm/min
										; since seemed conservative
M201 C1000  

M203 X18000 Y18000 Z1600 U9000     ; Maximum axis speeds (mm/min)
M203 B2800							; Max speed = max deg / min
									; means max revs/min (570, call
									; it 500 under load) * 200 steps/rev
									; = 100K steps/min, and from M92
									; we have steps/deg, so 100K / 35.56
M203 C3125							; as above but 100K / 32


M566 X500 Y500 Z500 U50           ; Maximum jerk speeds (mm/min)
M566 B300 P1					  ; Jerk appears to be black magic so
								  ; set more or less arbitrarily
								  ; P1 means jerk will be used between
								  ; any two moves, not just travel moves,
								  ; which makes sense here.
M566 C300 P1



; Endstops and probes 
;-------------------------------------------------------------------------------
; Connected to the MB6HC as the table below.
; | U | Z |
; | X |
; | Y |

M574 U1 S1 P"^io1.in"  ; homing position U1 = axis min, type S1 = switch
;M574 X1 S1 P"^io1.in"  ; homing position X1 = low-end, type S1 = switch
;M574 Y1 S1 P"^io2.in"  ; homing position Y1 = low-end, type S1 = switch
M574 X1 S1 P"^1.io0.in"  ; 3HC homing position X1 = axis min, type S1 = switch
M574 Y1 S1 P"^1.io1.in"  ; 3HC homing position Y1 = axis min, type S1 = switch

M574 Z0                ; we will use the switch as a Z probe not endstop 
M558 P8 C"io0.in" H3 F360 T6000 ; H = dive height F probe speed T travel speed
G31 K0 X0 Y0 Z-2    ; Set the limit switch position as the  "Control Point."
                    ; Note: the switch free (unclicked) position is 7.2mm,
                    ; but the operating position (clicked) is 6.4 +/- 0.2mm. 
                    ; A 1mm offset (i.e: 7.2-6.2 = 1mm) would be the 
                    ; Z to worst-case free position, but we add an extra 1mm
                    ; such that XY travel moves across the bed when z=0
                    ; do *not* scrape or shear the limit switch.

; Set axis software limits and min/max switch-triggering positions.
; Adjusted such that (0,0) lies at the lower left corner of a 300x300mm square 
; in the 305mmx305mm build plate.
;M208 X-13.75:313.75 Y-44:341 Z0:295 		; set XYZ origin for rectangular plate
;M208 X-158.25:169.25 Y-211:174 Z0:295	 ; set XYZ origin for 100mm circular plate (eyeball center)
M208 X-163.75:163.75 Y-213.55:171.55 Z-14.5:280.5	 ; set XYZ for 100mm circular plate by model

M208 U0:200            ; Set Elastic Lock (U axis) max rotation angle
M208 B-200:200 			; Set max rotation in either direction
						; for B and C axes. Since they can do a full
						; circle, this can be arbitrarily large.
M208 C-99999:99999 		


; Heaters and temperature sensors
;-------------------------------------------------------------------------------

; Bed
M308 S0 P"0.temp0" Y"thermistor" T100000 B3950 A"Bed" ; Keenovo thermistor
M950 H0 C"0.out0" T0                ; H = Heater 0
                                    ; C is output for heater itself
                                    ; T = Temperature sensor
;M143 H0 S140                        ; Set maximum temperature for bed to 140C 
M143 H0 S40							 ; set max bed temp to 40C
									 ; this is for the unheated 5 axis stage
									 ; I didn't disconnect heated bed but never
									 ; want it to turn on.

;M307 H0 A589.8 C589.8 D2.2 V24.1 B0 ; Keenovo 750w 230v built in thermistor
                                    ; mandala rose bed
M307 H0 R0.900 K0.279:0.000 D1.39 E1.35 S1.00 B0 ; from bed tune
M140 H0                             ; Assign H0 to the bed


; Tools
; Heaters and sensors must be wired to main board for PID tuning (3.2.0-beta4)

;Revo6 on toolboard 0
M308 S1 P"20.temp0" Y"thermistor" T100000 B4725 C7.06e-8 A"ToolTemp0" ; ATC Semitec 104GT-2
M950 H1 C"20.out0" T1                      ; Heater for extruder out tool 0
; M307 H1 A1252.3 C361.3 D5.3 V24.0 B0    ; from pid tuning without sock
;M307 H1 A811.4 C309.4 D4.7 V24.0 B0       ; With sock
M143 H1 S300                              ; Maximum temp for hotend to 300C
;Rapido on toolboard 1
M308 S2 P"21.temp0" Y"thermistor" T100000 B4725 C7.06e-8 A"ToolTemp1" ; ATC Semitec 104GT-2
M950 H2 C"21.out0" T2                      ; Heater for extruder out tool 0
; M307 H1 A1252.3 C361.3 D5.3 V24.0 B0    ; from pid tuning without sock
;M307 H1 A811.4 C309.4 D4.7 V24.0 B0       ; With sock
M143 H2 S300                              ; Maximum temp for hotend to 300C


;Rapdio on toolboard 2
M308 S3 P"22.temp0" Y"thermistor" T100000 B4725 C7.06e-8 A"ToolTemp2" ; ATC Semitec 104GT-2
M950 H3 C"22.out0" T3

M143 H3 S300

;Revo6 on toolboard 3
M308 S4 P"23.temp0" Y"thermistor" T100000 B4725 C7.06e-8 A"ToolTemp3" ; ATC Semitec 104GT-2
M950 H4 C"23.out0" T4

M143 H4 S300

; Fans
;-------------------------------------------------------------------------------

;Toolboard0 Fans
M950 F1 C"20.out1"
M106 P1 S255 H1 T45 C"Revo6HeatBreakFan"
M950 F2 C"20.out2" Q10000
M106 P2 C"Revo6PrintCool"

;Toolboard1 Fans
M950 F3 C"21.out1"
M106 P3 S255 H2 T45 C"RapidoHeatBreakFan"

;Toolboard2 Fans
M950 F4 C"22.out1"
M106 P4 S255 H3 T45 C"RapidoHeatBreakFan"
M950 F5 C"22.out2" Q10000
M106 P5 C"RapidoPrintCool"


;Toolboard3 Fans
M950 F6 C"23.out1"
M106 P6 S255 H4 T45 C"Revo62HeatBreakFan"
M950 F7 C"23.out2" Q10000
M106 P7 C"Revo62PrintCool"

;M950 F1 C"0.out8"
;M106 P1 S255 H1 T45 C"HeatBreakCool0" ; S = Speed of fan Px
                                      ; Hxx = heater for thermo mode
                                      ; T = temps for thermo mode.
;M950 F5 C"0.out7"
;M106 P5 C"PrintCool0"

; Tool definitions
;-------------------------------------------------------------------------------
M563 P0 S"Tool Revo6" D0 H1 F2  ; Px = Tool number
                            ; Dx = Drive Number
                            ; H1 = Heater Number
                            ; Fx = Fan number print cooling fan
G10  P0 S0 R0               ; Set tool 0 operating and standby temperatures
                            ; (-273 = "off")
;M572 D0 S0.10              ; Set pressure advance, esun_matte_pla


M563 P1 S"Tool RapidoDiamond" D1 H2 

G10 P1 S0 R0

M563 P2 S"Tool RapdioCHT" D2 H3 F5

G10 P2 S0 R0

M563 P3 S"Tool Revo2" D3 H4 F7

G10 P3 S0 R0




M98  P"/sys/Toffsets.g"     ; Set tool offsets from the bed


M501                        ; Load saved parameters from non-volatile memory

; ----- Disabling the unhomed movement since we now have the manual B and C home -------
;M564 S1 H0 ; allow unhomed movement
		   ; meant for B and C axis b/c no limit switches
		   ; However, applies to all axes, so must be sure to home all
		   ; before printing
		   ; S1 means will only move inside boundaries
		   ; Garth does this by omission since default behavior is S1 H1
		   ; Thus should work
