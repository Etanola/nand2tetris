// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen
// by writing 'black' in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen by writing
// 'white' in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(MAINLOOP)
    @KBD
    D=M
    @FILL
    D;JNE
    @CLEAN
    0;JMP
(FILL)
    @SCREEN
    D=A
    @i
    M=D         //i=screen(16384)
(LOOP1)
    @i
    D=M
    @KBD        //i<kbd(24576)なら続行
    D=D-A
    @MAINLOOP
    D;JGE
    @i
    A=M
    M=-1        //iのアドレスのビットをすべて1にする
    @i
    M=M+1
    @LOOP1
    0;JMP
(CLEAN)
    @SCREEN
    D=A
    @i
    M=D         //i=screen(16384)
(LOOP2)
    @i
    D=M
    @KBD        //i<kbd(24576)なら続行
    D=D-A
    @MAINLOOP
    D;JGE
    @i
    A=M
    M=0        //iのアドレスのビットをすべて0にする
    @i
    M=M+1
    @LOOP2
    0;JMP

