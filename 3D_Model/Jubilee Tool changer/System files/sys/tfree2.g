; Template for tfree.g for any tool on a rectangular 300 mm bed
; where (0,0) is defined as the lower left corner of a centered
; 300x300 square on a 305x305mm bed, OR a 100mm circular bed with
; 5 axis capabilities from the Open5X project.
; Runs at the start of a toolchange if the current tool is tool-0.
; Note: tool offsets are applied at this point unless we preempt commands with G53!

; ------- rectangular ------
;G91                          ; Relative Mode.
;G1 Z2                        ; Pop Z up slightly so we don't crash while traveling over the usable bed region.
;G90                          ; Absolute Mode.
;G53 G0 X{TOOL X PARKING POST X POSITION} Y275 F6000
							 ; Rapid to the back of the post. Stay away from the tool rack so we don't collide with tools.
                             ; This position must be chosen such that the most protruding y face of the current tool
                             ; (while on the carriage) does not collide with the most protruding y face of any parked tool.

;G53 G1 Y337 F6000            ; Controlled move to the park position with tool-1. (park_x, park_y)
;M98 P"/macros/tool_unlock.g" ; Unlock the tool
;G53 G1 Y316.4 F6000            ; Retract the pin.


; -------- circular -------
G91 							; Relative mode
G1 Z{33+4.18}		; Z dive allowing the carriage (Z33) plus
								; tool (+TOOL Z OFFSET) to clear the bed
G90								; absolute mode
G53 G0 X{97.3-150} Y{275-169.55} F6000		; controlled move to back of post
G53 G1 Y{337-169.55} F6000		; move all the way forward into post
M98 P"/macros/tool_unlock.g"	; unlock tool
G53 G1 Y45 F6000				; retract the carriage
G91								; relative mode
G1 Z{-33-4.18}		; move bed back up
G90								; back to absolute