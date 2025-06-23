include 'emu8086.inc'
.model small
.stack 100h                        
.data                    ;mov ah, 01h
                         ;int 21h           
.code                    ;input function           
                                    
main proc
    
    print 'Hello Asembly Programming'                ;AH input
                                                     ;AL temp store
                                                     
                     
    mov ah, 04ch      ;exit function        
    int 21h          
    
    main endp                                       ;DL must store output value
end main
                                                    ;mov ah, 02h
                                                    ;int 21h
                                                    ;output funtion
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 