
.cseg
.org 0x0000

rjmp main

numbers:
    .db 0x05, 0x03, 0x07, 0x02, 0x04, 0x09, 0x01, 0x08, 0x06, 0x0A

main:
    ldi r30, low(numbers<<1)
    ldi r31, high(numbers<<1)
    lpm r16, Z+     ; r16 is min
    mov r17, r16    ; r17 is max
    ldi r18, 9      ; r18 is count

fun:
    lpm r19, Z+
    cp r16, r19
    brlo s1
    mov r16, r19
s1:
    cp r17, r19
    brsh s2
    mov r17, r19
s2:
    dec r18
    brne fun

    ; r16 now holds the minimum value
    ; r17 now holds the maximum value


