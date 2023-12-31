.model small
.data
    str db 'LIRIL'
    l dw $-str
    x db 'PALINDROME $'
    y db 'NOT PALINDROME $'

.code

main proc
    mov ax, @data
    mov ds, ax

    lea si, str
    lea di, str
    add di, l
    dec di

    mov cx, l
    shr cx, 1; using this divides the operand by 2^n --> n being the i.e destination place
    ; since we are meeting in the middle
    l1:
        mov al, [si]
        mov bl, [di]
        cmp al, bl
        jne l2
        inc si
        dec di
        loop l1

    mov ah, 09h
    lea dx, x
    int 21h

    jmp l3

    l2:
        mov ah, 09h
        lea dx, y
        int 21h

    l3:
        mov ah, 4ch
        int 21h
        
main endp

end main