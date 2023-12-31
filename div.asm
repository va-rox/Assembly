.model small

.data

    dividend dw 1234h
    divisor dw 0ah
    quotient db ?
    remainder db ?

.code

    mov ax, 0
    mov ax, @data
    mov ds, ax
    
    mov ax, dividend
    idiv divisor
    mov quotient, al
    mov remainder, ah

    mov ah, 04ch
    int 21h
    
end