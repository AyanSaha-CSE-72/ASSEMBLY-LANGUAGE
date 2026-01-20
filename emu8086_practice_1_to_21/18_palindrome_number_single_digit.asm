include 'emu8086.inc'
.model small
.stack 100h
.data
n db 7
.code
main proc
    ; single digit always palindrome
    call newline
    print 'Palindrome'
    mov ah,4Ch
    int 21h
main endp

newline proc
    mov dl,10
    mov ah,02h
    int 21h
    mov dl,13
    mov ah,02h
    int 21h
    ret
newline endp

end main
