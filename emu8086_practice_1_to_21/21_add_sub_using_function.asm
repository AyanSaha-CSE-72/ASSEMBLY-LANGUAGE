include 'emu8086.inc'
.model small
.stack 100h
.data
a db 7
b db 3
.code

main proc
    call add_fun
    call newline
    call sub_fun

    mov ah,4Ch
    int 21h
main endp

add_fun proc
    print 'Add = '
    mov al,a
    add al,b
    add al,48
    mov dl,al
    mov ah,02h
    int 21h
    ret
add_fun endp

sub_fun proc
    print 'Sub = '
    mov al,a
    sub al,b
    add al,48
    mov dl,al
    mov ah,02h
    int 21h
    ret
sub_fun endp

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
