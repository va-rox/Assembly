.model small

.data

    num1 dw 1111h
    num2 dw 1111h
    prod dw 2 dup(?)

.code

    mov ax, 0
    mov ax,@data
    mov ds,ax

    mov ax,num1
    mov bx,num2
    imul bx
    mov prod,ax
    mov prod + 2, dx

    mov ax,4c00h
    int 21h

end
