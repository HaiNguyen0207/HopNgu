.model small
.data
    str db 100 dup('$')
    char db ?
    msg_input db 'Nhap mot chuoi : $'
    msg_char db 10,13,'Nhap ki tu can tim : $'
    msg_ko_xuathien db 10,13,'Ky tu can tim khong tim thay !! $'
    msg_xuathien db 10,13,'Ky tu can tim co xuat hien !! $'

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
    lea dx,[msg_char]
    int 21h
    
    mov ah,1
    int 21h
    
    mov char,al
    
    mov ah,0
    mov al,[str+1]
    mov cx,ax
    mov si,2
    mov bl,[char]
    
for_find:
    mov dl,str[si]
    cmp dl,bl  
    je xuathien
    inc si
    loop for_find
    
    mov ah,9
    lea dx,[msg_ko_xuathien]
    int 21h
    jmp endf
    
xuathien:
    mov ah,9
    lea dx,[msg_xuathien]
    int 21h
    jmp endf
    
endf:
    mov ah,4ch
    int 21h   
    main endp
end
    
    
    
    