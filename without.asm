.model small
 .data 

 num db 10h,20h,30h,40h
 dest db 4 dup(?)
 cnt dw 0004h

 .code

 mov ax, 00000000h

 mov ax, @data 
 mov ds, ax 

 lea si, num 
 lea di, dest
 mov cx, cnt 

 back: 
 
 mov dl,[si] 
 mov [di], dl 
 inc si 
 inc di 
 
 loop back
 
 mov ah, 4ch
 int 21h
 
 end
