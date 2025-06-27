include 'emu8086.inc'
.model samall
.stack 100h
.data
.code

main proc
     mov cx,10
     
     mov bl,1  
     
   start:    
   
          mov dl,bl
          add dl,48
          
          mov ah,02h
          int 21h
     
     mov dl, 10
     mov ah,02h
     int 21h  
               
     
     mov dl, 13
     mov ah,02h
     int 21h  
     inc bl
     
     loop start
    
     
     
     main endp
 end main     
 
 
 
  