.model small
.data
    str db 'Hello $' ; Initial string
    char_to_insert db '!' 
    s db 5 dup(?)
.code
    mov ax, @data
    mov ds, ax

    lea si, str
    again :
        mov al, [si]
        cmp al, '$'
        je done
        inc si
        jmp again
    done :
        mov al, char_to_insert
        mov [si], al
    
    mov ah, 09h ; Print string
    lea dx, str
    int 21h

    mov ah, 4ch ; Exit program
    int 21h

end
