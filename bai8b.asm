.model small
.data
    str db 100 dup('$')
    msg_input db 'Enter a string : $'
    msg_upper db 10,13,'Lowercase ==> $'

.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,[msg_input]
    int 21h
    
    mov ah,10
    lea dx,[str]
    int 21h
    
    mov ah,9
    lea dx,[msg_upper]
    int 21h
    
    mov ah,0
    mov al,[str+1]
    mov cx,ax
    
    mov si,2
lowercase:
    mov dl,str[si]
    cmp dl,'A'
    jb  next_lower
    cmp dl,'Z'
    ja next_lower
    
    add dl,32
    
next_lower:
    mov ah,2
    int 21h
    
    inc si
    loop lowercase
    
    
    mov ah,4ch
    int 21h
    main endp
end