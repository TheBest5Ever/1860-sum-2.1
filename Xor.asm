    @R0
    D=M         // D = R0

    @R1
    D=D&M       // D = common bits between R0 and R1

    @R2
    M=D         // Store R0 & R1 temporarily in R2

    @R0
    D=M         // D = R0

    @R1
    D=D|M       // D = All bits that are 1 between R0 and R1

    @R2
    D=D-M       // D = R0 or R1 - R0 and R1 (xor)

