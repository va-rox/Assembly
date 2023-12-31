.model small
.data
    src db "City $"
    dst db ($ - src) dup (?)
    cnt db ($ - src)

.code 


    mov ax, @data
    mov ds, ax

    
    lea si, src
    lea di, dst
    mov cx, 0
    mov cl, cnt
    cld
    push ds;}
    pop es; } compulsory instructions dont know why
    rep movsb

    mov ah, 09h
    lea dx, dst
    int 21h

    mov ah, 04ch
    int 21h


end