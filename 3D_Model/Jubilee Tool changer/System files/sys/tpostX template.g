; Template for tpost.g for any tool on a rectangular 300 mm bed
; where (0,0) is defined as the lower left corner of a centered
; 300x300 square on a 305x305mm bed, OR a 100mm circular bed with
; 5 axis capabilities from the Open5X project.
; called after firmware thinks Tool0 is selected
; Note: tool offsets are applied at this point!
; Note that commands preempted with G53 will NOT apply the tool offset.

M116 P{TOOL X NUMBER}                    ; Wait for set temperatures to be reached
M302 P{TOOL X NUMBER}                    ; Prevent Cold Extrudes, just in case temp setpoints are at 0
G90                        ; Ensure the machine is in absolute mode before issuing movements.

; ------ Rectangular --------
;G53 G1 Y337 F6000          ; Move to the pickup position with tool-X.
;M98 P"/macros/tool_lock.g" ; Lock the tool

;G1 R2 Z0                   ; Restore prior Z position before tool change was initiated.
                           ; Note: tool tip position is automatically saved to slot 2 upon the start of a tool change.
                           ; Restore Z first so we don't crash the tool on retraction.
;G1 R0 Y0                   ; Retract tool by restoring Y position next now accounting for new tool offset.
                           ; Restoring Y next ensures the tool is fully removed from parking post.
;G1 R0 X0                   ; Restore X position now accounting for new tool offset.
;M106 R2                    ; restore print cooling fan speed

; ------- Circular -------
G53 G1 Y{337-169.55} F6000	; Move to pickup position, but for circular bed.
M98 P"/macros/tool_lock.g"	; Lock the tool

G1 R0 Y0                   ; Retract tool by restoring Y position first: guaranteed OK Z position
						   ; by the tpreX.g which adds a Z dive for circular bed
                           ; Restoring Y first ensures the tool is fully removed from parking post.
G1 R0 X0                   ; Restore X position now accounting for new tool offset.
G1 R2 Z0                   ; Restore prior Z position before tool change was initiated.
                           ; Note: tool tip position is automatically saved to slot 2 upon the start of a tool change.
                           ; Restore Z last so we don't crash into the bed by moving up early.
M106 R2                    ; restore print cooling fan speed
