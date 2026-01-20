include 'emu8086.inc'
.model small
.stack 100h
.data
.code

main proc
    call read2
    mov bl,4
    mov ah,0
    div bl          ; AH = remainder
    cmp ah,0
    je leap

    call newline
    print 'Not Leap Year'
    mov ah,4Ch
    int 21h

leap:
    call newline
    print 'Leap Year'
    mov ah,4Ch
    int 21h
main endp

read2 proc
    print 'Enter last 2 digits of year: '
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
