.model small
.data
   tenfile db 100 dup('$')
   thefile dw ?
   msg_tenfile db 'Nhap ten file can xoa: $'
   msg_tc db 10,13,'Da xoa file thanh cong!$'
   msg_tb db 10,13, 'Doi ten file that bai$!'
   
 .code
 main proc
    mov ax,@data
    mov ds,ax
    mov es,ax
    
    mov ah,9
    lea dx,[msg_tenfile]
    int 21h
    
    mov ah,10
    lea dx,[tenfile]
    int 21h
    
    lea si,[tenfile+2]
    mov cx,0
    mov cl,[tenfile+1]
    add si,cx
    mov [si],0
   
    ;mo file 
    mov ah,3dh
    lea dx,[tenfile+2]
    mov al,2 
    int 21h
    jc error
    
    mov thefile,ax
    
    ;dong file
    mov ah,3eh
    mov bx,thefile
    int 21h
    jc error
    
    ;xoa file       
    mov ah,41h
    lea dx,[tenfile+2]
    int 21h
    
    jc error
    
    mov ah,9
    lea dx,msg_tc
    int 21h
    jmp endf 
    
error:
    mov ah,9
    lea dx,msg_tb
    int 21h
    jmp endf
    
endf:        
    mov ah,4ch
    int 21h
    main endp
 end
    
    