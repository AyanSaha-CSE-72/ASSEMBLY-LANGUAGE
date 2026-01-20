include 'emu8086.inc'
.model small
.stack 100h
.data
a db 3
b db 7
c db 5
.code

main proc

    mov ax, @data
    mov ds, ax

    ; ---- find greatest in AL ----
    mov al, a
    mov dl, b
    cmp al, dl
    jge ab_ok
    mov al, dl

ab_ok:
    mov dl, c
    cmp al, dl
    jge done
    mov al, dl

done:
    mov bl, al          ; ? save answer in BL

    call newline

    push bx             ; ? protect BL from print macro
    print 'Greatest = '
    pop bx              ; ? restore BL

    mov dl, bl
    add dl, 48          ; convert to ASCII
    mov ah, 02h
    int 21h

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

end main
