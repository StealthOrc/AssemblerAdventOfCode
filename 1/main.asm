bits 64
default rel

segment .data
; 0xd,0xa and 13,10 are the same = CRLF
;    msg db "Hello world!", 0xd, 0xa, 0
;    msg2 db "Bye world!", 13, 10
    str1 db '1abc2', 13,10,0
    str2 db 'pqr3stu8vwx', 13,10, 0
    str3 db 'a1b2c3d4e5f', 13,10, 0
    str4 db 'treb7uchet', 13,10, 0
    exited db 'exited',0
    crlf db 13,10,0
    ;buffer db      '"hello, world' 
    ;    times 64-$+buffer db ' '
    ;sml db `\u263a`,13,10            ; UTF-8 smiley face 

;undefined variables
segment .bss
	;len of str1 = 8
	string2 resb 8

segment .text
global main
extern _CRT_INIT
extern ExitProcess

extern printf

main:
; Making a stack
; giving us the shadow space
  push rbp
  mov  rbp, rsp
  sub  rsp, 32
; load rcx and print, then read
  lea  rcx, str1
  jmp  readnum

readnum:
; test loop, not working :c
    mov ecx, 0
    looping:
        mov al, [str1+ecx]
        mov [string2+cl], al
        inc cl
        cmp al, 0 ;copy until we find the terminating 0
        je exit
        jmp looping
  call printf
; new line
  lea  rcx, crlf 
  call printf
  jmp  exit
  jmp readnum

print:
; prep so we only print al
  ;mov  ch, 0
  call printf
  jmp  exit


exit:
    lea  rcx, [exited] 
    call printf
    xor  rax, rax
    call ExitProcess
