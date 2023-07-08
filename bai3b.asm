.model small
.stack 100
.data
    tb3 db 13, 10, "Nhap chuoi so: $"
    so10 dw 10
    str1 db 100 dup ("$")
    tmp dw ?
    dem dw 0
    tb4 db 13, 10, "So luong SNT la: $"
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
   
    print tb3
    scanf str1
    mov cx, 0
    mov cl, [str1 + 1]
    lea si, [str1 + 2]
    mov ax, 0   
lap:
    mov dx, [si]
    cmp dl, ","
    je kiemtra
    mul so10
    mov dx, [si]
    mov dh, 0
    sub dl, 48
    add ax, dx
    jmp next2
kiemtra:
    mov tmp, ax
    mov bx, 1
chia:
    mov ax, tmp
    mov dx, 0
    inc bx
    div bx
    cmp dx, 0
    jne chia
    cmp bx, tmp
    jne next2
    inc dem
    mov ax, 0               
next2:
    inc si    
    loop lap
    print tb4
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
    loop hienthi
ret
intToStr endp
end    