include 'emu8086.inc'
.model samall
.stack 100h
.data
array db 3,4,5,6,7,8
.code

main proc
     mov ax,@data
     
     mov ds,ax  
     
      
   
          mov si, offset array
         mov cx,6  
         
          print 'Your array is:'
          
          loopx: 
          mov dl,[si]
          add dl, 48
          
         
          mov ah,02h
          int 21h
     
           mov dl, 32
           mov ah,02h
           int 21h  
               
     
         inc si
     
     loop loopx
    
     
     
     main endp
 end main     
 
 
 
  