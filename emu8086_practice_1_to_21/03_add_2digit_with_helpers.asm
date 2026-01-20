include 'emu8086.inc'
.model small
.stack 100h
.data
.code

main proc
    call read2
    mov bl, al         ; first
    call newline
    call read2
    mov bh, al         ; second

    mov al, bl
    add al, bh         ; sum in AL (0..198)

    call newline
    print 'Sum = '
    mov ah,0
    call print_ax

    ; --- AAA idea (unpacked BCD) normally used with BCD digits ---
    ; add al, bl
    ; aaa

    mov ah,4Ch
    int 21h
main endp

; ---- read two digits (00-99) -> AL ----
read2 proc
    print 'Enter 2-digit number: '
    mov ah,01h
    int 21h
    sub al,48
    mov bl,al          ; tens
    mov ah,01h
    int 21h
    sub al,48          ; ones
    mov bh,al
    mov al,bl
    mov ah,0
    mov bl,10
    mul bl             ; AX = tens*10
    add al,bh          ; AL = tens*10 + ones
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

; ---- print AX (0..65535) ----
print_ax proc
    push ax
    push bx
    push cx
    push dx

    mov cx,0
    mov bx,10

    cmp ax,0
    jne pa_loop
    mov dl,'0'
    mov ah,02h
    int 21h
    jmp pa_done

pa_loop:
    mov dx,0
    div bx            ; AX=AX/10, DX=remainder
    push dx
    inc cx
    cmp ax,0
    jne pa_loop

pa_print:
    pop dx
    add dl,48
    mov ah,02h
    int 21h
    loop pa_print

pa_done:
    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_ax endp

end main
