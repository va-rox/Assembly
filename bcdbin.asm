.model small
.data

    bcd db 61h
    bin db (?)

.code

    mov ax, @data
    mov ds, ax
    
    mov al, bcd
    mov bl, al
    and bl, 0Fh;extracting lower bits
    and al, 0F0h;extracting upper bits
    mov cl, 04h
    ror al, cl
    mov bh, 0Ah
    mul bh
    add al, bl
    mov bin, al

    mov ah, 04ch
    int 21h

end
