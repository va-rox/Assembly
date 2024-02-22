.model small
.data
    bin_ip db 7fh
    bcd_op db ?
.code
    mov ax, @data
    mov ds, ax
    xor bl, bl
    xor cl, cl

    mov al, bin_ip
L2: 
    sub al, 64h
    jnc L4
    add al, 64h

L3: 
    sub al, 0ah
    jnc L5
    add al, 0ah

    lea si, bcd_op
    mov [si], cl
    inc si
    mov [si], bl
    inc si
    mov [si], al

L1: 
    mov ah, 4ch
    int 21h

L4: 
    inc cl
    jmp L2

L5: 
    inc bl
    jmp L3

end
