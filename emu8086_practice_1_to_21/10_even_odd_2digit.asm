include 'emu8086.inc'
.model small
.stack 100h
.data
.code

main proc
    call read2
    mov bl,2
    mov ah,0
    div bl
    cmp ah,0
    je even

    call newline
    print 'Odd'
    mov ah,4Ch
    int 21h

even:
    call newline
    print 'Even'
    mov ah,4Ch
    int 21h
main endp

read2 proc
    print 'Enter 2-digit number: '
    mov ah,01h
    int 21h
    sub al,48
    mov bl,al
    mov ah,01h
    int 21h
    sub al,48
    mov bh,al
    mov al,bl
    mov ah,0
    mov bl,10
    mul bl
    add al,bh
    ret
read2 endp

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
