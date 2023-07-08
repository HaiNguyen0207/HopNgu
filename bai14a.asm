.model small
.data
    fullname db 'nguyen van hai'
    len db  $-fullname
    input_name db 100 dup('$')
    id db 'at170415$'
    msg_input db 'Nhap ho ten : $'
    msg_id db 10,13,'Ma Sinh Vien : $'
    msg_invalid db 10,13,'Ho ten khong hop le !$'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,[msg_input]
    int 21h
    
    mov ah,10
    lea dx,[input_name]
    int 21h
    
    mov al,[input_name+1]
    cmp al,len
    jne invalid
    
    mov ah,0
    mov al,[input_name+1]
    mov cx,ax 
    mov si,2
    mov di,0
check:
    mov al,input_name[si]
    cmp al,fullname[di]
    jne invalid
    
    inc si
    inc di
    loop check
    
    mov ah,9
    lea dx,[msg_id]
    int 21h
    
    lea dx,[id]
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
    
    