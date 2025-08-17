
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

   
    mov al, 25      
    mov bl, 37      

    add al, bl      
    mov ah, 0       

    mov bl, 10
    div bl          

    
    add al, 30h     
    mov dl, al
    mov ah, 02h
    int 21h

    mov al, ah      
    add al, 30h    
    mov dl, al
    mov ah, 02h
    int 21h

    
    mov ah, 4Ch
    int 21h
main endp
end main
