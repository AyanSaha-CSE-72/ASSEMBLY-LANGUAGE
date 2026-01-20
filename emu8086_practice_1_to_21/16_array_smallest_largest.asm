include 'emu8086.inc'
.model small
.stack 100h
.data
arr db 4,7,2,9,5
small db ?
large db ?
.code

main proc
    mov ax,@data
    mov ds,ax

    mov si,offset arr
    mov al,[si]
    mov small,al
    mov large,al

    mov cx,4
    inc si

lp:
    mov al,[si]
    cmp al,small
    jl us
    cmp al,large
    jg ul
nx:
    inc si
    loop lp
    jmp show

us:
    mov small,al
    jmp nx
ul:
    mov large,al
    jmp nx

show:
    call newline
    print 'Smallest = '
    mov dl,small
    add dl,48
    mov ah,02h
    int 21h

    call newline
    print 'Largest = '
    mov dl,large
    add dl,48
    mov ah,02h
    int 21h

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
