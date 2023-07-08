.model small
.data
    str db 100 dup('$')
    count1 db ?
    thuong db ?
    du db ?
    msg_input db 'Nhap 1 chuoi : $'
    msg_output db 10,13,'So luong ky tu = $'
    
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
    lea dx,[msg_output]
    int 21h
    
    mov al,0
    mov si,2
count:
    mov bl,str[si]
    cmp bl,13
    je endf
    inc al
    inc si
    jmp count
    
endf:
    
    mov ah,0
    mov bl,10
    div bl
    mov thuong,al
    mov du,ah
    
    mov ah,2
    mov dl,thuong
    add dl,48
    int 21h
    mov dl,du
    add dl,48
    int 21h
    mov ah,4ch
    int 21h
    main endp
end
    
    
    