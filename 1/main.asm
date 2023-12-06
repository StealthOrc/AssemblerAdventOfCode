bits 64
default rel

segment .data
; 0xd,0xa and 13,10 are the same = CRLF
;    msg db "Hello world!", 0xd, 0xa, 0
;    msg2 db "Bye world!", 13, 10
    str1 db '1abc2', 13,10, 0
    str2 db 'pqr3stu8vwx', 13,10, 0
    str3 db 'a1b2c3d4e5f', 13,10, 0
    str4 db 'treb7uchet', 13,10, 0
    buffer db      '"hello, world' 
        times 64-$+buffer db '"'

segment .text
global main
extern _CRT_INIT
extern ExitProcess

extern printf

main:
    push    rbp
    mov     rbp, rsp
    sub     rsp, 32

    lea     rcx, [str1]
    call    printf

    lea     rcx, [str1+1]
    call    printf

    lea     rcx, [str2]
    call    printf

    lea     rcx, [buffer]
    call    printf

    xor     rax, rax
    call    ExitProcess
