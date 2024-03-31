; Home y, x, z, and Toolchanger Lock axes

M98 P"homeu.g" ; X and Z require U to be homed first in case a tool is currently active
M98 P"homey.g"
M98 P"homex.g"
M98 P"homeb.g" ; There is no real homing for b and c rn so this is to avoid G29 errors
			   ; from movement without homing.
M98 P"homec.g"
M98 P"homez.g"


; Move to center of bed

G91                          ; Relative Mode.
;G1 Z5                        ; Pop Z up slightly so we don't crash while traveling over the usable bed region.
G1 Z33						  ; As above but circular bed, which has hardware above the bed.

;G90                          ; Absolute Mode.
;G53 G0 X100 Y150 F6000 	 ; rectangular bed

G53 G0 X0 Y0 F6000	 ; circular bed
G90