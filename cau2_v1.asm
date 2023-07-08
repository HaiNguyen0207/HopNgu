  .model small
.stack 100
.data
    msg_input db "Nhap chuoi so: $"
    msg_div db 13, 10, "So luong so chia het cho 8 la: $"
    so10 dw 10
    so8 dw 8
    str db 100 dup("$")
    dem dw 0
.code

print macro str
    mov ah, 9
    lea dx, str
    int 21h
endm

scanf macro str
    mov ah, 10
    lea dx, str
    int 21h
endm

main proc
    mov ax, @data
    mov ds, ax
    mov es, ax
   
    print msg_input
    scanf str
    print msg_div
    
    mov cx, 0
    mov cl, [str + 1]
    lea si, [str + 2]
    mov ax, 0
lap:
    mov dx, [si]
    cmp dl, ","
    je kiemTra
    
    mul so10
    mov dx, [si]
    mov dh, 0
    sub dl, 48
    add ax, dx
    jmp next2
kiemTra:
    mov dx, 0
    div so8
    cmp dx, 0
    jne next3
    inc dem
    mov ax, 0
next3:
    mov ax, 0    
next2:
    inc si    
    loop lap
    
    mov ax, dem
    
    call intToStr   
    mov ah, 4ch
    int 21h
main endp

intToStr proc
    mov cx, 0
chia10:
    mov dx, 0
    div so10
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
    ret
intToStr endp

end