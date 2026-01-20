include 'emu8086.inc'
.model small
.stack 100h
.data
str db 'HELLO$'
.code

main proc
    mov ax,@data
    mov ds,ax

    ; find end
    mov si,offset str
L1: mov al,[si]
    cmp al,'$'
    je L2
    inc si
    jmp L1
L2: dec si

    call newline
    print 'Reverse = '
R:  mov dl,[si]
    mov ah,02h
    int 21h
    cmp si,offset str
    je done
    dec si
    jmp R
done:
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
