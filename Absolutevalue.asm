    @R0
    D=M        // Loads x into D

    @R1
    M=D        // Stores D in R1

    @R2
    M=0        //Sets negative Flag to off as it's my default assumption

    @R3
    M=0       //Sets overflow to 0 as that would be the only case where the absolute value c=would not be able to be computed

    @R0
    D=M      //Loads x into D again

    @32768     
    D=D-A      // Checks x is not equal to -32768 as that would be an overflow error. 32768 is represented as -32668 in HACKs two's compliment.

    @Overflow
    D;JEQ      //This line Jumps to the label CANNOT_COMPUTE if D is equal to 0

    @R0
    D=M        //Loads x into D to overwrite previous D

    @positive
    D;JGE      //Jumps to the POSITIVE label if x is larger than or equal to 0

    
    @R2
    M=1      //If the previous jumps weren't executed the number must be negative meaning we chamge the negative flag to 1

    @R0
    D=M        //Loads x into D

    D=-D      //Makes the negative number positive to calculate the absolute value and becomes the new value of D

    @R1
    M=D        // Stores absolute value in R1

    @END
    0;JMP      //Jumps to END label

(Overflow)
    @R3        //We are unable to calculate the absolute value as an overflow would occur so we set the Flag to 1
    M=1        

    @R0     //Loads x into D
    D=M     

    @R1     //Stores D in R1
    M=D 

    @END        //Jumps to END label 
    0;JMP     

(positive)
    @R1
    M=D       //Stores absolute value in R1

(END)
    