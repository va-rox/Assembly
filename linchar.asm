.model small
.data
    str db 'uvce', '$'
    char db 'x'
    result db (?)
    y db 'Key Found $'
    z db 'Key not Found $'

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
        jmp notfound
        
    notfound:

        mov ah, 09h
        lea dx, z
        int 21h
        jmp exit

    found:
        
        mov ah, 09h
        lea dx, y
        int 21h
        
    exit:
        mov ah, 4ch
        int 21h

end