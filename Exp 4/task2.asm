.cseg
.org 0x0000

rjmp main

numbers:
    .db 0x05, 0x03, 0x07, 0x02, 0x04, 0x09, 0x01, 0x08, 0x06, 0x0A

main:
    ldi r30, low(numbers<<1)
    ldi r31, high(numbers<<1)
    lpm r16, Z+     ; r16 is sum
    ldi r18, 9      ; r18 is count

fun:
	lpm r19, Z+
	add r16, r19
    dec r18
    brne fun
