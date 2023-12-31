.model small

.data

    num1 dq 4444444444444444h
    num2 dq 6666666666666666h
    result dq 0

.code

    mov ax, 0 
    mov ax, @data
    mov ds, ax
    
    lea si, num1
    lea di, num2
    lea bx, result
    mov cx, 04h

    L1 :
    
        mov ax, [si]
        sbb ax, [di]
        mov [bx], ax
        add si, 2
        add di, 2
        add bx, 2
        loop L1
    
    mov ah, 04ch
    int 21h

end