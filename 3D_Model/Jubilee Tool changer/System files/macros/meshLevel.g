M561                     ; Unapply any existing mesh
M558 H1.5                ; Tram is done dont need to me so high
;M557 X10:290 Y10:290 P7 ; Define Grid (rect 300 mm)
M557 R49 S15				 ; Define grid (circular 100 mm)
G29                      ; Execute Probing
M558 H3                  ; Put Probe back to normal