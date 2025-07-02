include 'emu8086.inc'
.model small
.stack 100h
.data
array1 db 2,3,4,5
array2 db 2,3,4,7
.code



main proc
    
       mov ax, @data
       mov ds,ax
       
       mov si, offset array1   ;1st value array 1
       mov di, offset array2   ;2nd value array 2
       
       
       mov cx,4
       
       loopx:
        mov al,[si]
        mov bl,[di]
        
        cmp al,bl 
        jne show
        
        inc si
        inc di
       
       loop loopx  
       
       
       
 
    print 'Both are equal'
    
    mov ah,04ch
    int 21h
    
    show:
    
    print 'Both are not equal'
    
    mov ah,04ch
    int 21h
    
    
    
    
    
    main endp
end main
