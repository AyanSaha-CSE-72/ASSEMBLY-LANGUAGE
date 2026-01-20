include 'emu8086.inc'
.model small
.stack 100h
.data
.code
main proc
    print 'Hello Assembly Language'
    mov ah,4Ch
    int 21h
main endp
end main
