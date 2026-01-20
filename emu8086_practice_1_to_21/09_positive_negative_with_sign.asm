include 'emu8086.inc'
.model small
.stack 100h
.data
.code

main proc
    print 'Enter sign (+/-): '
    mov ah,01h
    int 21h
    mov bl,al

    call newline
    print 'Enter digit: '
    mov ah,01h
    int 21h

    call newline
    cmp bl,'-'
    je neg

    print 'Positive'
    mov ah,4Ch
    int 21h

neg:
    print 'Negative'
    mov ah,4Ch
    int 21h
main endp
end main
