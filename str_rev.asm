.model small
.data
    x db 'UVCE'
    z dw (z - x)
    y db 4 dup (?), '$'

.code

    mov ax, @data
    mov ds, ax
    lea si, x
    lea di, y
    mov cl, 4
    add si, 3
    
    L1:

        mov al, [si]
        mov [di], al
        dec si
        inc di
        loop L1
    
    mov ah, 09h
    lea dx, y
    int 21h
    
    mov ah, 4ch
    int 21h

end