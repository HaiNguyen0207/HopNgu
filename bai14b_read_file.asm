.model small
.data
    filename db 100 dup('$')
    buffer db 250 dup('$')
  
    thefile dw ?
    msg_input db 'Nhap ten file : $'
    msg_output db 10,13,'Noi dung file : $'
    msg_error db 10,13,'Da xay ra loi . Vui long xem lai !! $'
    
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,[msg_input]
    int 21h
    
    mov ah,10
    lea dx,[filename]
    int 21h
    
    lea si,[filename+2] 
    mov cx,0
    mov cl,[filename+1]
    add si,cx
    mov [si],0
    
    mov ah,3dh
    jp error
    lea dx,[filename+2] 
    mov al,2  
    int 21h
        
    mov thefile,ax
    
    mov ah,3fh
    mov bx,[thefile]
    lea dx,[buffer]
    mov cx,250
    int 21h
   
    
    mov ah,3eh
    mov bx,[thefile]
    int 21h
    
    mov ah,9
    lea dx,[msg_output]
    int 21h
    
    lea dx,[buffer]
    int 21h
    jmp endf
error:
    mov ah,9
    lea dx,[msg_error]
    int 21h
    jmp endf
endf: 
    mov ah,4ch
    int 21h
    main endp
end
      
    
    
   