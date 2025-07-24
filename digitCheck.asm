.model small 
.stack 64
.data
arr db 20, 21 dup(?)
tiv db 20 dup(?), '$'
mes db "There is no digits$"
.code
main proc far
        mov ax, @data
        mov ds, ax
        xor di, di
        xor si, si
        lea dx, arr
        mov ah, 10
        int 21h
loop1:  mov al, arr[si]
        xor dx, dx
        call tiv_
        jne next_it
        move tiv[di], al
        inc di
next_it:inc si
        loop loop1
        cmp di, 0
        jne print_
        mov ah, 9
        lea dx, mes
        int 21h
        jmp end_m
print_: inc di
        mov tiv[di], '$'
        mov ah, 9
        lea dx, tiv
        int 21h
end_m:  ret
        main endp

tiv_ proc
        cmp al, '0'
        jl end_p
        cmp al, '9'
        jg end_p
        mov dx, 1
end_p:  ret
tiv_ endp
end main
