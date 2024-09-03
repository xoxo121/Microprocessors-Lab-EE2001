.cseg
.org 0x0000

rjmp main

numbers:
    .db 0x05, 0x03, 0x07, 0x02, 0x04

main:
    ldi r30, low(numbers<<1)
    ldi r31, high(numbers<<1)
    lpm r16, Z+
    lpm r17, Z+
    lpm r18, Z+
    lpm r19, Z+
    lpm r20, Z+

	ldi r21, 4
	mov r22, r21
	loop1:
		loop2:
			cp r16, r17
			brlo s1
			mov r21, r16
			mov r16, r17
			mov r17, r21

			s1:
				cp r17, r18
				brlo s2
				mov r21, r17
				mov r17, r18
				mov r18, r21
			s2:
				cp r18, r19
				brlo s3
				mov r21, r18
				mov r18, r19
				mov r19, r21
			s3:
				cp r19, r20
				brlo s4
				mov r21, r19
				mov r19, r20
				mov r20, r21
			s4:
				dec r22
				brne loop2
				dec r21
				brne loop1

				; Store sorted numbers in data memory
				ldi r26, low(0x0100)  ; Start address in SRAM
				ldi r27, high(0x0100)

				st X+, r16
				st X+, r17
				st X+, r18
				st X+, r19
				st X+, r20
