;To obtain the tenth number in Fibonacci sequence
 
    AREA Program, CODE, READONLY
    ENTRY

    MOV r1, #0
    MOV r2, #1
    MOV r0, #10

fibn
    SUBS r0, r0, #1
    BEQ stop

    ADD r3, r1, r2
    MOV r1,r2
    MOV r2,r3
    B fibn

stop 
    B stop

END