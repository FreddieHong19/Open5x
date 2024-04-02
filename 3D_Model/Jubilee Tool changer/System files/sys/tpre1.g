; tpre1.g
; Runs after freeing the previous tool if the next tool is tool-1.
; Note: tool offsets are not applied at this point!

; ----- Rectangular --------
;G90                   ; Ensure the machine is in absolute mode before issuing movements.
;G0 X-8.7 Y275 F20000 ; Rapid to the approach position without any current tool.

; ------ Circular --------
G91							; switch to relative
G1 Z{33+10.68+29.79}				; drop circular bed to avoid collisions
							; add the G10 Z offset for Tool 1
							; to account for extra nozzle height
G90							; switch back to absolute 
G0 X{-8.7-150} Y45 F6000	; move tool position for circular bed
							; we use Y45 because motors protrude up
							; anything past Y60.95 is dangerous,
							; and we must accomodate the thickness of the carriage

G60 S0                ; Save this position as the reference point from which to later apply new tool offsets.