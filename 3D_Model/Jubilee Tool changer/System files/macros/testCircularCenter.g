;Probe each corner of the circular bed to be sure of a good center
G90						;absolute mode
						;(e.g. G0 X10 Y0 goes to (10, 0) 
						;not (prev X + 10, prev Y + 10)
G30 P0 X-44 Y0 Z-99999
G30 P1 X44 Y0 Z-99999
G30 P2 X0 Y-44 Z-99999
G30 P3 X0 Y44 Z-99999