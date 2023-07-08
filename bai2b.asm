.model small
.data
    str_number db 100 dup('$')
    s db ?
    msg_input db 'Nhap mot chuoi so: $'
    msg_invalid db 10,13,'Chuoi chua ki tu khong hop le! $'
    msg_output db 10,13,'Tong ket qua trong chuoi: $'
    
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,[msg_input]
    int 21h
    
    mov ah,10
    lea dx,[str_number]
    int 21h
    
    mov si,2
    mov cx,0
    mov cl,[str_number+1]
    mov bl,0
    
check:
    mov al,str_number[si]
    cmp al,'0'
    jb invalid
    cmp al,'9'
    ja invalid
    inc si
    loop check
    
    mov cl,[str_number+1]
    mov si,2
       
sum:
    mov dl,str_number[si]
    sub dl,48
    add bl,dl
    inc si
    loop sum
    
    mov ah,9
    lea dx,[msg_output]
    int 21h
    
    call hienthiketqua
    jmp endf
                  
invalid:
    mov ah,9
    lea dx,[msg_invalid]
    int 21h
    jmp endf
    
endf:
    mov ah,4ch
    int 21h
    main endp

hienthiketqua proc
    mov ah,0
    mov al,bl
    mov cx, 0
    mov bx,10
    
chia10:
    mov dx, 0
    div bx
    push dx
    inc cx
    cmp ax, 0
    je hienthi
    jmp chia10
hienthi:
    pop dx
    add dl, 48
    mov ah, 2
    int 21h
    loop hienthi
    ret
    hienthiketqua endp
end
    
    