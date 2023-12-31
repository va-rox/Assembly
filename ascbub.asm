.model small

.data
    a db 05h, 04h, 03h, 02h, 01h
    s dw 05

.code

    mov ax, @data
    mov ds, ax
    
    mov bx, s

    outloop:

        mov cx, bx
        mov si, 0h

    inloop:
    
        mov al, a[si]
        inc si
        cmp al, a[si]
        jb next
        xchg al, a[si]
        mov a[si - 1], al
    
    next:
        
        Loop inloop
        dec bx
        jnz outloop
    
    mov ah, 04ch
    int 21h
    
end