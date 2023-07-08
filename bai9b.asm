.model small
.stack 100h
.data   
    str db 100 dup('$')
    msg_input db 'Nhap mot chuoi : $'
    msg_reverse db 10,13,'Chuoi dao nguoc : $'
    
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
    lea dx,[msg_reverse]
    int 21h
    
    call push_stack
    call pop_stack
    
    mov ah,4ch
    int 21h
    main endp

push_stack proc
    mov ah,0
    mov al,[str+1]
    mov cx,ax
    
    mov si,2
    mov bh,0
for_push:
    mov bl,str[si]
    push bx
    inc si
    loop for_push   
    push_stack endp

pop_stack proc
    mov ah,0
    mov al,[str+1]
    mov cx,ax
    mov ah,2
    
for_pop:
    pop bx
    mov dl,bl
    int 21h
    loop for_pop
    pop_stack endp
end
