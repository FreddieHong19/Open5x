; tpre0.g
; Runs after freeing the previous tool if the next tool is tool-0.
; Note: tool offsets are not applied at this point!

; ------ Rectangular ------
;G90                  ; Ensure the machine is in absolute mode before issuing movements.
;G0 X308.3 Y275 F20000 ; Rapid to the approach position without any current tool.

; ------ Circular --------
G91					; Switch to relative
G1 Z{33+2.63}				; Drop circular bed to avoid collisions
							; amount is the standard Z dive 
							; plus the G10 tool offset for Tool 0
G90					; Switch back to absolute
G0 X{308-150} Y45 F6000	; Move to tool position but for circular bed.
							; We use Y45 because now have to worry about the
							; motors which protrude up; anything past Y60.95
							; is dangerous move, requires a dive

G60 S0               ; Save this position as the reference point from which to later apply new tool offsets.