; Home Z Axis

if !move.axes[3].homed
  M291 R"Cannot Home Z" P"U axis must be homed before Z to prevent damage to tool. Press OK to home U or Cancel to abort" S3
  M98 P"homeu.g"

; RRF3 does not permit Z homing without x&y being homed first. Popup window for convenience.
if !move.axes[0].homed || !move.axes[1].homed
  M291 R"Cannot Home Z" P"X&Y Axes must be homed before Z for probing. Press OK to home X&Y or Cancel to abort" S3
  M98 P"homey.g"
  M98 P"homex.g"

if state.currentTool != -1
  M84 U
  M291 R"Cannot Home Z" P"Tool must be deselected before homing. U has been unlocked, please manually dock tool and press OK to continue or Cancel to abort" S3
  M98 P"homeu.g"

M290 R0 S0              ; Reset baby stepping
M561                    ; Disable any Mesh Bed Compensation

G91                     ; Relative mode
;G1 H2 Z5 F5000          ; Lower the bed
G1 H2 Z33 F5000			; As above but circular bed, which requires a greater dive.

;G90                     ; back to absolute positioning
;G90 G1 X150 Y130 F10000 ; Move to the center of the rectangular 305 x 305mm bed -20mm to not probe on
                        ; top of the mandal rose bed magnet skrew head (300 mm rect)
G90 G1 X0 Y0 F10000		; Move to center of circular bed
G90

M558 F500               ; Set the probing speed
G30                     ; Probe
M558 F50                ; Set a slower probing speed
G30                     ; Prob
;G32                     ; Run 3-point bed calibration defined in bed.g
						 ; Disabled for now: with the 100mm circular bed, 
						 ; we can't really do two-screw leveling, as
						 ; small deviations across 100mm are read as large
						 ; at the screw locations.
						 ; Also, don't want to mesh bed level every time,
						 ; it takes a while and gets annoying.
G29 S1                  ; Enable Mesh Bed Compensation
