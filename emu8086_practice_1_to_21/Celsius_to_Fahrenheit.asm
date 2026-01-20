include 'emu8086.inc'
.model small
.stack 100h
.data
.code

main proc

    call read3              ; AX = Fahrenheit (000–999)

    sub ax, 32              ; F - 32

    mov bx, 5
    mul bx                  ; DX:AX = (F-32)*5

    mov bx, 9
    div bx                  ; AX = Celsius (integer)

    mov bx, ax              ; save result

    call newline
    print 'Celsius = '

    mov ax, bx              ; restore result
    call print_ax

    mov ah, 4Ch
    int 21h

main endp


; -------- Read 3-digit number (000–999) -> AX --------
read3 proc
    print 'Enter Fahrenheit (3-digit): '

    ; --- hundreds ---
    mov ah, 01h
    int 21h
    sub al, 48
    mov bl, al

    ; --- tens ---
    mov ah, 01h
    int 21h
    sub al, 48
    mov bh, al

    ; --- ones ---
    mov ah, 01h
    int 21h
    sub al, 48
    mov cl, al

    ; AX = hundreds*100
    mov al, bl
    mov ah, 0
    mov dx, 100
    mul dx              ; AX = hundreds*100

    ; AX = AX + tens*10
    mov dl, bh
    mov dh, 0
    push ax
    mov ax, dx
    mov dx, 10
    mul dx              ; AX = tens*10
    mov bx, ax
    pop ax
    add ax, bx

    ; AX = AX + ones
    mov dl, cl
    mov dh, 0
    add ax, dx

    ret
read3 endp


; -------- New line --------
newline proc
    mov dl,10
    mov ah,02h
    int 21h

    mov dl,13
    mov ah,02h
    int 21h
    ret
newline endp


; -------- Print AX (0..65535) --------
print_ax proc
    push ax
    push bx
    push cx
    push dx

    mov cx,0
    mov bx,10

    cmp ax,0
    jne L1
    mov dl,'0'
    mov ah,02h
    int 21h
    jmp L3

L1:
    mov dx,0
L2:
    div bx                  ; DX = remainder
    push dx
    inc cx
    mov dx,0
    cmp ax,0
    jne L2

PRINT:
    pop dx
    add dl,48
    mov ah,02h
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
