include 'emu8086.inc'
.model samall
.stack 100h
.data
.code

main proc
     print 'CSE'
     
     mov dl, 10
     mov ah,02h
     int 21h  
               
     
     mov dl, 13
     mov ah,02h
     int 21h
     
     print 'CSE'
     
     mov dl, 10
     mov ah,02h
     int 21h  
               
     
     mov dl, 13
     mov ah,02h
     int 21h
     
    print 'CSE'
     
     mov dl, 10
     mov ah,02h
     int 21h  
               
     
     mov dl, 13
     mov ah,02h
     int 21h
                 
    print 'CSE'
     
     mov dl, 10
     mov ah,02h
     int 21h  
               
     
     mov dl, 13
     mov ah,02h
     int 21h
     
     print 'CSE'
     
     mov dl, 10
     mov ah,02h
     int 21h  
               
     
     mov dl, 13
     mov ah,02h
     int 21h
     
     
     main endp
 end main