include "emu8086.inc"

.stack 100h
.model small
.data
.code

main proc 
    print 'Enter 1st Number:' 
    mov ah, 1h
   int 21h  
   sub al, 48
   
   mov bl,al
   
   mov dl,10
   mov ah,2h
   int 21h 
   
   mov dl,13
   mov ah,2h
   int 21h    
   
   print 'Enter 2nd Number:' 
    mov ah, 1h
   int 21h  
   sub al, 48 
   
   ;add bl,al; bl=bl+al
   
   sub bl,al ;bl=bl-al
   add bl,48
           
      
   mov dl,10
   mov ah,2h
   int 21h
   
      
   mov dl,10
   mov ah,2h
   int 21h
   
   print 'The sum is:'
   mov dl,bl 
   
   mov ah,2h
   int 21h       
           
   ;Exit program  
   mov ah, 4ch
   int 21h
                                                        
main  endp
end main          

