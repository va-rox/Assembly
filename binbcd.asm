.model small
.data
    bin dw 0FFh ; binary value to convert
    bcd dw 0000h ; BCD result

.code
    mov ax, @data
    mov ds, ax

    mov ax, bin ; load binary value into ax
    mov cx, 16  ; set loop counter to 16 (for 16-bit binary)

convert:
    shl ax, 1   ; shift left ax (binary value)
    rcl dx, 1   ; rotate left dx (BCD value)
    cmp dl, 50 ; if lower byte of dx >= 50
    jb next     ; jump if below
    add dl, 03 ; else add 3
next:
    cmp dh, 50 ; if higher byte of dx >= 50
    jb loop1     ; jump if below
    add dh, 03 ; else add 3
loop1:
    loop convert ; repeat for all bits

    mov bcd, dx ; store result in bcd

    mov ah, 04ch
    ret
    int 21h
end

