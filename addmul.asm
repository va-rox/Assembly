.model small

.data

    num1 dq 1111111111111111h
    num2 dq 9222222222222222h
    sum dt ?
    
.code

        mov ax, @data
        mov ds, ax
        mov cl, 04h
        lea si, num1
        lea di, num2
        lea bx, sum

        back:
            mov ax, [si]
            adc ax, [di]
            mov [bx], ax
            add si, 2
            add di, 2
            add bx, 2
            loop back
            jnc over
            mov ax, 0001h
            mov [bx], ax
        
        over:
            mov ah, 04ch
            int 21h
    
end 


