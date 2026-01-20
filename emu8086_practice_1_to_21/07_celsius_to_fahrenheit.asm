include 'emu8086.inc'
.model small
.stack 100h
.data
.code

main proc

    call read2              ; AL = Celsius (00-99)

    mov ah, 0
    mov bl, 9
    mul bl                  ; AX = C*9

    mov bl, 5
    div bl                  ; AL = (C*9)/5

    add al, 32              ; AL = Fahrenheit
    mov ah, 0               ; AX = Fahrenheit

    mov bx, ax              ; ? SAVE RESULT (very important)

    call newline
    print 'Fahrenheit = '

    mov ax, bx              ; ? RESTORE RESULT
    call print_ax

    mov ah, 4Ch
    int 21h

main endp


; -------- Read 2-digit number (00-99) -> AL --------
read2 proc
    print 'Enter Celsius (2-digit): '

    mov ah, 01h
    int 21h
    sub al, 48
    mov bl, al              ; tens

    mov ah, 01h
    int 21h
    sub al, 48              ; ones
    mov bh, al

    mov al, bl
    mov ah, 0
    mov bl, 10
    mul bl                  ; AX = tens*10

    add al, bh              ; AL = tens*10 + ones
    ret
read2 endp


; -------- New line --------
newline proc
    mov dl, 10
    mov ah, 02h
    int 21h

    mov dl, 13
    mov ah, 02h
    int 21h
    ret
newline endp


; -------- Print AX (0..65535) --------
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
    div bx                  ; DX:AX / 10
    push dx
    inc cx
    mov dx, 0
    cmp ax, 0
    jne L2

LPRINT:
    pop dx
    add dl, 48
    mov ah, 02h
    int 21h
    loop LPRINT

L3:
    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_ax endp

end main
