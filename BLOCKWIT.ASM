.model small

 .data 

 num db 10h,20h,30h,40h
 dest db 4 dup(?)
 cnt dw 0004h

 .code

 mov ax, 0 
 mov ax, @data 
 mov ds, ax

 lea si, num
 lea di, dest
 mov cx, cnt

 dec cnt
 add si, cnt

 L1:
    mov al, [si]
    mov [di], al
    dec si
    inc di
    Loop L1

 mov ah, 4ch
 int 21h

 end
