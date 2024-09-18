.org 0
rjmp reset ; on reset, program starts here

.org 0x002 ; Interrupt vector address for INT1.
rjmp int1_ISR

reset:
    ldi R16, 0x70 ; setup the stack pointer to point to address 0x0070
    out SPL, R16
    ldi R16, 0x00
    out SPH, R16
    
    ldi R16, 0xFF ; make PB1 output
    out DDRB, R16
    
    ldi R16, 0x00 ; make PORTD input
    out DDRD, R16
    
    ldi R16, 0x08 ; use pull-up resistor for PD3
    out PORTD, R16
    
    in R16, GICR
    ori R16, 0x80 ; enable INT1 interrupt
    out GICR, R16
    
    ldi R16, 0x00 ; Turn off LED
    out PORTB, R16
    
    sei ; enable interrupts

white_loop:
	ldi R16, 0x04 ; Turn on the white LED (PB2)
    out PORTB, R16
    rjmp white_loop


indefiniteloop: 
    rjmp indefiniteloop

int1_ISR:
    cli ; clear interrupts
    in R16, SREG ; save status register SREG
    push R16
    
    ldi R16, 10 ; blink LED 10 times
    mov R0, R16

back5:
    ldi R16, 0x02 ; Turn on LED (change to 0x01 if LED is on PB0)
    out PORTB, R16

    ; Delay 1
    ldi R17, 0xFF ; Initialize R17 for delay loop
delay1:
    ldi R16, 0xFF
back2:
    ldi R17, 0xFF
back1:
    dec R17
    brne back1
    dec R16
    brne back2

    ldi R16, 0x00 ; Turn off LED
    out PORTB, R16

    ; Delay 2
    ldi R17, 0xFF ; Initialize R17 for delay loop
delay2:
    ldi R16, 0xFF
back3:
    ldi R17, 0xFF
back4:
    dec R17
    brne back4
    dec R16
    brne back3

    dec R0
    brne back5 ; Check if LED has blinked 10 times

    pop R16 ; Retrieve status register
    out SREG, R16

    sei ; Enable interrupts
    reti ; Return from interrupt
