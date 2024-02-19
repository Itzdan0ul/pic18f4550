; Dispositivos Programables - 4NV40
; Práctica 4
; Authors:
;   Roque Ramírez Jesus Guadalupe
;   Urtiz López Dan Jair
    
#include "configuration_bits.inc"

processor 18f4550
    
org 0

psect   program,local,class=CODE,reloc=2 ; Code section for the PIC18 program
program:
    goto    init                            ; Jump to the "init" label
psect CODE
init:
    movlw   0x0F                            ; Load the value 0x0F into register W
    movwf   ADCON1                          ; Configure all pins as digital.
    
    movlw   0xFF                            ; Load the value 0xFF into register W
    movwf   TRISA                           ; Configure port A as input
    
    movlw   0x00                            ; Load the value 0x00 into register W
    movwf   TRISB                           ; Configure port B as output
    
start:
    movf    PORTA,w                         ; Move the value from port A to register W
    andlw   0x0E                            ; Perform an AND operation with 0x0E
    call    table                           ; Call the "table" subroutine
    movwf   PORTB                           ; Move the result to port B
    bra	    start                           ; Jump to the "start" label
    
table:
    addwf   PCL,1                           ; Increment the program counter value
    retlw   0x48                            ; Return the value 0x48 (H)
    retlw   0x45                            ; Return the value 0x45 (E)
    retlw   0x4C                            ; Return the value 0x4C (L)
    retlw   0x4C                            ; Return the value 0x4C (L)
    retlw   0x4F                            ; Return the value 0x4F (O)
end program                                 ; End of the program
