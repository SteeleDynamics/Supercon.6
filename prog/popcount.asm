        mov     R0,0xE          ; move 0xE into R0
        mov     [0xF0],R0       ; set page to 0xE
        mov     R0,0x0          ; move 0x0 into R0
        mov     [0xE6],R0       ; move 0x0 into E6
        GOSUB   popcount        ; get the popcount
        ret     R0,0            ; stop program

; popcount subroutine
; 1. get popcount of reg E6
; 2. put result in reg E6
popcount:
        mov     R0,[0xE6]       ; move E6 into R0
        and     R0,0x5          ; mask unshifted bits
        mov     R1,R0           ; move R0 into R1
        mov     R0,[0xE6]       ; move E6 into R0
        and     R0,0xF          ; clear carry flag
        rrc     R0              ; roll R0 
        and     R0,0x5          ; mask shifted bits
        add     R0,R1           ; R0 <- R0 + R1
        mov     [0xE6],R0       ; move R0 into E6
        and     R0,0x3          ; mask unshifted bits
        mov     R1,R0           ; move R0 into R1
        mov     R0,[0xE6]       ; move E6 into R0
        and     R0,0xF          ; clear carry flag
        rrc     R0              ; roll R0 
        rrc     R0              ; roll R0 
        and     R0,0x3          ; mask shifted bits
        add     R0,R1           ; R0 <- R0 + R1
        mov     [0xE6],R0       ; move R0 into E6
        ret     R0,0            ; popcount subroutine return
