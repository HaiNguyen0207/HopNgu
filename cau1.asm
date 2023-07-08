                                                   .model small
.data
    id db '101'
    len db $-id
    s_id db 100 dup('$')
    msg_id db 'Nhap sbd sinh vien : $'
    msg_student_id db 10,13,'Ma sinh vien : AT170415$'
    msg_invalid db 10,13,'So bao danh khong hop le !!$'
    
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,[msg_id]
    int 21h
    
    mov ah,10
    lea dx,[s_id]
    int 21h
    
    mov ah,0
    mov al,[s_id+1]
    cmp al,len
    jne invalid
    
    mov cx,ax
    
    mov si,2
    mov di,0
    
check:
    mov al,s_id[si]
    mov bl,id[di]
    
    cmp al,bl
    jne invalid
    inc si
    inc di    
    loop check
    
    mov ah,9
    lea dx,[msg_student_id]
    int 21h   
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
end
    
    