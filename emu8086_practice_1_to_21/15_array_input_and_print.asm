include 'emu8086.inc'
.model small
.stack 100h
.data
arr db 5 dup(?)
.code

main proc
    mov ax,@data
    mov ds,ax

    mov cx,5
    mov si,offset arr

in_loop:
    print 'Enter digit: '
    mov ah,01h
    int 21h
    sub al,48
    mov [si],al
    call newline
    inc si
    loop in_loop

    print 'Array: '
    mov cx,5
    mov si,offset arr
out_loop:
    mov dl,[si]
    add dl,48
    mov ah,02h
    int 21h
    print ' '
    inc si
    loop out_loop

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
