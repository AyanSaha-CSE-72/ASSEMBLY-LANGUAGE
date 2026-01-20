include 'emu8086.inc'
.model small
.stack 100h
.data
ch db ?
.code
main proc
    print 'Enter a digit: '
    mov ah,01h
    int 21h
    mov ch,al

    mov dl,10
    mov ah,02h
    int 21h
    mov dl,13
    mov ah,02h
    int 21h

    print 'You entered: '
    mov dl,ch
    mov ah,02h
    int 21h

    mov ah,4Ch
    int 21h
main endp
end main
