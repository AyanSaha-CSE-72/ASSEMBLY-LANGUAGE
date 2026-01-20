include 'emu8086.inc'
.model small
.stack 100h
.data
n   db 5
res dw ?
.code

main proc

    mov ax, @data
    mov ds, ax

    mov ax, 1              ; result
    mov bx, 1              ; i = 1

    mov cl, n
    mov ch, 0              ; CX = n

facloop:
    mul bx                 ; DX:AX = AX * BX  (16-bit multiply)
    inc bx
    loop facloop

    mov res, ax            ; ? save result (AX may be changed by print)

    call newline
    print 'Factorial = '

    mov ax, res            ; ? restore result
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
    jne F1
    mov dl, '0'
    mov ah, 02h
    int 21h
    jmp F3

F1:
    mov dx, 0
F2:
    div bx
    push dx
    inc cx
    mov dx, 0
    cmp ax, 0
    jne F2

FP:
    pop dx
    add dl, 48
    mov ah, 02h
    int 21h
    loop FP

F3:
    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_ax endp

end main
