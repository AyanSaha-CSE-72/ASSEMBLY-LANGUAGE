include 'emu8086.inc'
.model small
.stack 100h
.data
.code



main proc
    
    
    
    mov dl,5
    mov bl,7
    
    cmp dl,bl
    
    je show
    
    print 'Smaller'
    
    mov ah,04ch
    int 21h
    
    show:
    
    print 'greater'
    
    mov ah,04ch
    int 21h
    
    
    
    
    
    main endp
end main
