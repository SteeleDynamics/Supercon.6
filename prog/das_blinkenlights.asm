mov r0, 3        ; Set CPU speed
mov [0xF1], r0   ;

mov r0, 2        ; Set matrix page
mov [0xF0], r0   ;

mov r2, 2        ; Set memory row and columns 
mov r3, 3        ;
mov r4, 0        ;

mov r0, [0xFF]   ; Read random number
mov [r3:r4], r0  ; Move into position on matrix
mov r0, [0xFF]   ;
mov [r2:r4], r0  ; Repeat for other side
mov r0, r4       ;
cp r0, 15        ; Check row count
inc r4           ; Move to next row
skip z, 1        ; Skip after row 15
jr -9            ; Loop forever
