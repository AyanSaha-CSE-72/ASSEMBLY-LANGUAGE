include 'emu8086.inc'
.model small
.stack 100h
.data
str db 'madam$'
.code

main proc
    mov ax,@data
    mov ds,ax

    ; length
    mov si,offset str
    mov cx,0
L1: mov al,[si]
    cmp al,'$'
    je L2
    inc si
    inc cx
    jmp L1
L2:
    mov di,offset str
    add di,cx
    dec di
    mov si,offset str
    mov bx,cx
    shr bx,1

C1: cmp bx,0
    je yes
    mov al,[si]
    mov dl,[di]
    cmp al,dl
    jne no
    inc si
    dec di
    dec bx
    jmp C1

yes:
    call newline
    print 'Palindrome'
    mov ah,4Ch
    int 21h
no:
    call newline
    print 'Not Palindrome'
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
