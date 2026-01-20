include 'emu8086.inc'
.model small
.stack 100h
.data
.code

main proc
    call read2
    mov bl,al
    call newline
    call read2
    mov bh,al

    mov al,bl
    mov ah,0
    mov dl,bh
    mul dl            ; AX = bl * bh

    call newline
    print 'Mul = '
    call print_ax

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

print_ax proc
    push ax bx cx dx
    mov cx,0
    mov bx,10
    cmp ax,0
    jne M1
    mov dl,'0'
    mov ah,02h
    int 21h
    jmp M3
M1: mov dx,0
M2: div bx
    push dx
    inc cx
    mov dx,0
    cmp ax,0
    jne M2
MP: pop dx
    add dl,48
    mov ah,02h
    int 21h
    loop MP
M3: pop dx cx bx ax
    ret
print_ax endp

end main
