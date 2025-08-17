include 'emu8086.inc'
.model small
.stack 100h
.data
    msg db 'Sum is: $'
.code
main proc
    mov ax, @data
    mov ds, ax

    
    mov ah, 09h
    lea dx, msg
    int 21h

    
    mov al, '5'     
    sub al, 30h     
    mov bl, '8'     
    sub bl, 30h

    add al, bl      
    aaa             
    add ax, 3030h  

    
    mov dl, ah
    mov ah, 02h
    int 21h

    
    mov dl, al
    mov ah, 02h
    int 21h

    
    mov ah, 4Ch
    int 21h
main endp
end main
