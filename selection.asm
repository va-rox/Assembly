.model small
.data
    num dw 05h, 04h, 03h, 02h, 01h
    count dw 5h

.code
    mov ax, @data
    mov ds, ax

    mov cx, count
    dec cx
    mov si, 2

SortLoop:
    push si
InnerLoop:
    mov ax, num[si - 2]
    mov bx, num[si]
    cmp ax, bx
    jnb NextIteration; jb for ascending & jnb for descending

    mov num[si - 2], bx
    mov num[si], ax
    dec si
    dec si
    jnz InnerLoop

NextIteration:
    dec cx
    jz ExitProgram

    pop si
    inc si
    inc si
    jmp SortLoop

ExitProgram:
    mov ah, 4ch
    int 21h

end
