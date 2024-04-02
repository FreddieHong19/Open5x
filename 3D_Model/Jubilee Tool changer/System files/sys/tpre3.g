; Template for tpre.g for any tool on a rectangular 300 mm bed
; where (0,0) is defined as the lower left corner of a centered
; 300x300 square on a 305x305mm bed, OR a 100mm circular bed with
; 5 axis capabilities from the Open5X project.
; Runs after freeing the previous tool if the next tool is tool-X.
; Note: tool offsets are not applied at this point!

; -------- Rectangular ---------
;G90                  ; Ensure the machine is in absolute mode before issuing movements.
;G0 X{TOOL X PARKING POST X POSITION} Y275 F20000 ; Rapid to the approach position without any current tool.

; -------- Circular --------
G91							; switch to relative
G1 Z{33+2.65}	; drop circular bed to avoid collisions
							; add the G10 Z offset for Tool 1
							; to account for extra nozzle height
G90							; switch back to absolute
G0 X{195.7-150} Y45 F6000	; move tool position for circular bed
													; we use Y45 because motors protrude up
													; anything past Y60.95 is dangerous
													; and we must accomodate thickness of carriage

G60 S0               ; Save this position as the reference point from which to later apply new tool offsets.