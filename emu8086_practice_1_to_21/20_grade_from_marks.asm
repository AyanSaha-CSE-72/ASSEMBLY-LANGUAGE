include 'emu8086.inc'
.model small
.stack 100h
.data
marks db 60
.code

main proc

    mov ax, @data
    mov ds, ax

    mov al, marks

    cmp al, 80
    jae Aplus

    cmp al, 70
    jae A

    cmp al, 60
    jae Aminus

    cmp al, 50
    jae B

    cmp al, 40
    jae C

    jmp F

Aplus:
    call newline
    print 'Grade: A+'
    jmp done

A:
    call newline
    print 'Grade: A'
    jmp done

Aminus:
    call newline
    print 'Grade: A-'
    jmp done

B:
    call newline
    print 'Grade: B'
    jmp done

C:
    call newline
    print 'Grade: C'
    jmp done

F:
    call newline
    print 'Grade: F'

done:
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
