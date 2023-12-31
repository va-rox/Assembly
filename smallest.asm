.model small 
.stack

.data
    
    array db 01h, 02h, 03h, 04h, 05h
    num db (?)
    
.code 

    mov ax, @data
    mov ds, ax
    
    mov cx, 5
    lea si, array
    mov al, [si]
    
    L1:
        cmp al, [si]
        jc L2
        mov al, [si]
        
    L2:
        inc si
        dec cl
        jnz L1
        
    mov num, al

    mov ah, 04ch
    int 21h
    
end