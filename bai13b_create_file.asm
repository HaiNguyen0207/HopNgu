.model small
.data
    filename db 100 dup('$')
    thefile dw ?
    content db 100 dup('$')
    msg_input db 'Nhap ten file : $'
    msg_content db 10,13,'Nhap noi dung : $'
    
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
    
    mov ah,9
    lea dx,[msg_content]
    int 21h
    
    mov ah,10
    lea dx,[content]
    int 21h
    
    lea si,[filename+2]
    mov cx,0
    mov cl,[filename+1]
    add si,cx
    mov [si],0
    
    mov ah,3ch
    mov cx,0
    lea dx,[filename+2]
    int 21h
    
    mov thefile,ax
    
    mov ah,40h
    mov bx,[thefile]
    mov cx,0
    mov cl,[content+1]
    lea dx,[content+2]
    int 21h
    
    mov ah,3eh
    mov bx,[thefile]
    mov cx,0
    int 21h
    
    mov ah,4ch
    int 21h
    
    main endp
end
    
    