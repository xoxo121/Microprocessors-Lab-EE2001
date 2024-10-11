    AREA Program, CODE, READONLY
    ENTRY

    LDR r0, =Num1  ;load the numbers into R0 and R1
    LDR r1, =Num2
    MOV r2, #0 ; assign and clear the quotient register
Loop
    CMP r1, #0 ;test division by 0
    BEQ Error1
    CMP r1, r0 ;is the dividend less than the divisor ?
    BGT Result ;if yes, then we are done
    ADD r2, r2, #1 ;add one to quotient
    SUB r0, r0, r1 ;subtract the divisor from the dividend

    B Loop

Error1
    MOV r3, #0xFFFFFFFF ;error flag (-1)
    B Result

Result
    LDR r4,  = Remainder ;store the remainder and quotient
    STR r0, [r4]
    LDR r5, = Quotient
        STR r2, [r5]
        SWI &11

Num1 DCD 1000000 ;dividend
Num2 DCD  100 ;divisor
    ALIGN

    AREA Data2, DATA, Readwrite

Quotient DCD 0
Remainder DCD 0

END