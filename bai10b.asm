.model small
.data
    str1 db 100 dup('$')
    str2 db 100 dup('$')
    msg_str1 db 'Nhap chuoi 1 : $'
    msg_str2 db 10,13,'Nhap chuoi 2 : $'
    msg_giong db 10,13,'Hai chuoi giong nhau !$'
    msg_ko_giong db 10,13,'Hai chuoi khong giong nhau !!$'
    
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,[msg_str1]
    int 21h
    
    mov ah,10
    lea dx,[str1]
    int 21h
    
    mov ah,9
    lea dx,[msg_str2]
    int 21h
    
    mov ah,10
    lea dx,[str2]
    int 21h
    
    mov al,[str1+1]
    mov bl,[str2+1]
    cmp al,bl
    jne ko_giong
    
    mov ah,0
    mov al,[str1+1]
    mov cx,ax
    
    mov si,2
check:
    mov al,str1[si]
    mov bl,str2[si]
    cmp al,bl
    jne ko_giong
    inc si
    loop check
    
    mov ah,9
    lea dx,[msg_giong]
    int 21h
    jmp endf  
    
ko_giong:
    mov ah,9
    lea dx,[msg_ko_giong]
    int 21h
    
    jmp endf
    
endf:
    mov ah,4ch
    int 21h
    main endp
end