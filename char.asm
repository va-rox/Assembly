.model small
.data
    str db 'uvce', '$'
    char db 'e'
    result db (?)

.code

    mov ax, @data
    mov ds, ax

    lea si, str
    mov al, char
    mov cl, 4

    mov ah, 0
    mov bl, 0
    
    search:
        
        cmp [si], al
        je found
        inc si
        inc bl
        loop search

    found:
        
        mov result, bl

    mov ah, 4ch
    int 21h

end


