.model small
.data
    str db 'Hello', '$' ; Initial string
    len equ $ - str ; Length of the initial string

.code
    mov ax, @data
    mov ds, ax

    ; Delete a character at the start of the string
    mov si, offset str
    mov di, si
    mov cx, len - 1 ; Length of the modified string

L1:
    mov al, [si + 1] ; Move the next character to the current position
    mov [di], al
    inc si
    inc di
    loop L1

    ; Null-terminate the modified string
    mov al, '$'
    mov [di], al

    ; Print the modified string
    mov ah, 09h
    lea dx, str
    int 21h

    mov ah, 4ch ; Exit program
    int 21h

end
