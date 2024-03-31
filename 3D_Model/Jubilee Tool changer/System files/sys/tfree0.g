; tfree0.g
; Runs at the start of a toolchange if the current tool is tool-0.
; Note: tool offsets are applied at this point unless we preempt commands with G53!

G91                          ; Relative Mode.
;G1 Z2                        ; Pop Z up slightly so we don't crash while traveling over the usable bed region.
G1 Z{33+2.63} 						 ; As above, but greater Z dive for 100mm circular bed
							 ; add 2.63 (Tool 0 G10 Z offset) so to account for 
							 ; extra height of the nozzle.
G90                          ; Absolute Mode.

; ----- rectangular ------
;G53 G0 X308.3 Y275 F6000
;;G53 G0 X293.0 Y275 F12000     ; Rapid to the back of the post. Stay away from the tool rack so we don't collide with tools.
                             ; This position must be chosen such that the most protruding y face of the current tool
                             ; (while on the carriage) does not collide with the most protruding y face of any parked tool.
;G53 G1 Y337 F6000            ; Controlled move to the park position with tool-1. (park_x, park_y)
;M98 P"/macros/tool_unlock.g" ; Unlock the tool
;G53 G1 Y316.4 F6000            ; Retract the pin.

; ----- circular ------ (translation is (-150, -169.55, -14.35) from rect to circular)
G53 G0 X{308-150} Y{275-169.55} F6000   ; Rapid to the back of the post. Stay away from the tool rack so we don't collide with tools.
                             ; This position must be chosen such that the most protruding y face of the current tool
                             ; (while on the carriage) does not collide with the most protruding y face of any parked tool.
G53 G1 Y{337-169.55} F6000            ; Controlled move to the park position with tool-1. (park_x, park_y)
M98 P"/macros/tool_unlock.g" ; Unlock the tool
G53 G1 Y45 F6000            ; Retract the pin.
G91
G1 Z{-33-2.63}						 ; Move bed back up
G90