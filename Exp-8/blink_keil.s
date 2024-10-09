	AREA LED,CODE,READONLY
	ENTRY
	EXPORT SystemInit
	EXPORT __main
 
; Fill the port register addresses from the LPC2378 manual
PINSEL10 EQU 0xE002C028
FIO2DIR EQU  0x3FFFC040
PINSEL4 EQU  0xE002C010
FIO2PIN EQU  0x3FFFC054
SystemInit
    ; Configure PINSEL10 to disable ETM function
    LDR R0, =PINSEL10
    LDR R1, [R0]
    MOV R2, #8      ; Load constant to disable ETM function (assuming bits)
    BIC R1, R1, R2           ; Clear the appropriate bits in R1
    STR R1, [R0]             ; Store the modified value back into PINSEL10

    ; Configure PINSEL4
    LDR R0, =PINSEL4         ; Load the address of PINSEL4
    MOV R2, #0x00000000      ; Set pins to GPIO mode
    STR R2, [R0]             ; Store the value in PINSEL4

    ; Set FIO2DIR for output
    LDR R0, =FIO2DIR         ; Load the address of FIO2DIR
    MOV R2, #0x000000FF      ; Set the lower 8 bits to output (for LEDs)
    STR R2, [R0]             ; Store the value in FIO2DIR

__main
; Code to display a number on LEDs begins
	LDR R0, = FIO2PIN; use the appropriate register to set values
	MOV R1, #25
	STR R1,[R0]
	ldr r2, =100000; Load delay value
 
loop
    SUB R2, R2, #1           ; Decrement R2
    CMP R2, #0               ; Compare R2 with 0
    BNE loop                 ; Branch if not equal to 0

    MOV R1, #0               ; Clear R1
    STR R1, [R0]             ; Turn off LEDs
    LDR R2, =100000          ; Load delay value
    
loop1
    SUB R2, R2, #1           ; Decrement R2
    CMP R2, #0               ; Compare R2 with 0
    BEQ __main               ; If equal, go back to __main
    B loop1                  ; Otherwise, loop

forever
    B forever                ; Infinite loop

    END
