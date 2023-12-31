.model small
.stack 100
.data

    array db 01h, 05h, 03h, 04h, 02h
    num db (?)
    
.code

    mov ax, @data
    mov ds, ax
    
    mov cx, 5
    lea si, array
    mov al, 0
    
    L1 :

        cmp al, [si]; sets carry flag = 1 when destination is greater than source
        jnc L2
        mov al, [si]
        
    L2 :
    
        inc si
        dec cl
        jnz L1
    
    mov num, al
    mov ah, 04ch
    int 21h
    
end
    
