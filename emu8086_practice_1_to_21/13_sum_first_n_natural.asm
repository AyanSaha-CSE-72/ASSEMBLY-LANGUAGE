include 'emu8086.inc'
.model small
.stack 100h
.data
n   db 10
sum dw ?              ; ? result save ???? ????
.code

main proc

    mov ax, @data
    mov ds, ax

    mov ax, 0
    mov bx, 1
    mov cl, n
    mov ch, 0           ; CX = n

sumloop:
    add ax, bx
    inc bx
    loop sumloop

    mov sum, ax         ; ? SAVE RESULT

    call newline
    print 'Sum = '

    mov ax, sum         ; ? RESTORE RESULT
    call print_ax

    mov ah, 4Ch
    int 21h

main endp


newline proc
    mov dl, 10
    mov ah, 02h
    int 21h
    mov dl, 13
    mov ah, 02h
    int 21h
    ret
newline endp


print_ax proc
    push ax
    push bx
    push cx
    push dx

    mov cx, 0
    mov bx, 10

    cmp ax, 0
    jne L1
    mov dl, '0'
    mov ah, 02h
    int 21h
    jmp L3

L1:
    mov dx, 0
L2:
    div bx
    push dx
    inc cx
    mov dx, 0
    cmp ax, 0
    jne L2

PRINT:
    pop dx
    add dl, 48
    mov ah, 02h
    int 21h
    loop PRINT

L3:
    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_ax endp

end main
