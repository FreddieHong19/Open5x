; tfree1.g
; Runs at the start of a toolchange if the current tool is tool-1.
; Note: tool offsets are applied at this point unless we preempt commands with G53!

G91                          ; Relative Mode.
;G1 Z2                        ; Pop Z up slightly so we don't crash while traveling over the usable bed region.
G1 Z{33+10.68+29.79}						  ; As above, greater Z dive for 100 mm circular bed
									  ; Add G10 Z offset for Tool 1 to avoid crashes
G90                          ; Absolute Mode.

; ------- rectangular -------					 
;G53 G0 X-8.7 Y275 F12000    ; Rapid to the back of the post. Stay away from the tool rack so we don't collide with tools.
                             ; This position must be chosen such that the most protruding y face of the current tool
                             ; (while on the carriage) does not collide with the most protruding y face of any parked tool.
;G53 G1 Y337 F6000            ; Controlled move to the park position with tool-1. (park_x, park_y)
;M98 P"/macros/tool_unlock.g" ; Unlock the tool
;G53 G1 Y305 F6000            ; Retract the pin.	
																							  
; ------- circular ------											  
G53 G0 X{-8.7-150} Y{275-169.55} F6000  ; rapid to the back of toolpost
G53 G1 Y{337-169.55} F6000				; move slowly all the way into the tool
M98 P"/macros/tool_unlock.g" ; Unlock the tool
G53 G1 Y45 F6000            ; Retract the pin.
G91
G1 Z{-33-10.68-29.79}						 ; Move bed back up
G90