// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// Assumes that R0 >= 0, R1 >= 0, and R0 * R1 < 32768.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

    @1
    D=M
    @i
    M=D    //iにR[1]を代入
    @sum
    M=0
(LOOP)
    @i
    D=M
    @END
    D;JEQ  //iが0ならENDに飛ぶ
    @0
    D=M
    @sum
    M=D+M  //sumにR[0]を足す
    @i
    M=M-1  //iを1引く
    @LOOP
    0;JMP
(END)
    @sum
    D=M
    @2
    M=D    //R[2]にsumを代入
    @END
    0;JMP