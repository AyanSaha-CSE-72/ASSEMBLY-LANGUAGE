include 'emu8086.inc'
.model small
.stack 100h
.data
n db 7
.code

main proc
    mov al,n
    cmp al,1
    jbe notprime
    cmp al,2
    je prime

    mov bl,2
check:
    mov al,n
    mov ah,0
    mov dl,bl
    div dl          ; AH remainder
    cmp ah,0
    je notprime
    inc bl
    mov al,n
    cmp bl,al
    jl check

prime:
    call newline
    print 'Prime'
    mov ah,4Ch
    int 21h

notprime:
    call newline
    print 'Not Prime'
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
