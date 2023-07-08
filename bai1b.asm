.model small
.data
   n db ?
   result dw ?
   du db ?
   thuong db ?
   msg_input db 'Nhap n = $'
   msg_invalid db 10,13,'Vui long nhap n tu 0-8 $'
   msg_show db 10,13,'n! = $'
   
.code
main proc
    mov ax,@data
    mov ds,ax
    mov es,ax
    
    mov ax,13
    mov bl,10
    div bl
    
    mov ah,9
    lea dx,[msg_input]
    int 21h
    
    mov ah,1
    int 21h
    cmp al,'0'
    jb invalid
    cmp al,'8'
    ja invalid
    
   
    
    mov cx,0
    sub al,'0'
    mov cl,al
    mov ax,1
    mov bx,1
    
giaithua:
    mul bx
    inc bx
    loop giaithua
    
    mov result,ax  
    mov ah,9
    lea dx,[msg_show]
    int 21h
    mov ax,result
    
    call intToString
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
 
 
intToString proc
    mov cx, 0
    mov bx, 10 
    
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
    intToString endp
end 
end