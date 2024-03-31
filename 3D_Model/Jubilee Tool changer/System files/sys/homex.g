; Home X Axis

; In case homex.g is called in isolation, ensure 
; (1) U axis is homed (which performs tool detection and sets machine tool state to a known state) and 
; (2) Y axis is homed (to prevent collisions with the tool posts)
; (3) Y axis is in a safe position (see 2)
; (4) No tools are loaded.
; Ask for user-intervention if either case fails.

G90                     ; Set absolute mode

if !move.axes[3].homed
  M291 R"Cannot Home X" P"U axis must be homed before X to prevent damage to tool. Press OK to home U or Cancel to abort" S3
  M98 P"homeu.g"

if !move.axes[1].homed
  M291 R"Cannot Home X" P"Y axis must be homed before x to prevent damage to tool. Press OK to home Y or Cancel to abort" S3
  M98 P"homey.g"
  
if move.axes[1].userPosition >= 305
  G0 Y305 F20000       ; Rapid to safe y position

if state.currentTool != -1
  M84 U
  M291 R"Cannot Home X" P"Tool must be deselected before homing. U has been unlocked, please manually dock tool and press OK to continue or Cancel to abort" S3
  M98 P"homeu.g"
  
G91                     ; Relative mode
;G1 H2 Z5 F5000          ; Lower the rectangular 305 x 305 mm bed
G1 H2 Z33 F5000			; As above but circular bed, which requires greater dive.
G1 X-330 F3000 H1       ; Big negative move to search for endstop
G1 X4 F600              ; Back off the endstop
G1 X-10 F600 H1         ; Find endstop again slowly
;G1 H2 Z-5 F5000         ; Raise the rectangular 305 x 305 mm bed
G1 H2 Z-33 F5000			; As above but circular bed, which requires greater dive.
G90                     ; Set absolute mode