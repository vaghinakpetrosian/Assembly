.model small
.stack 64
.data
arr db 1, 2, 3, 4, 5
    db 6, 7, 8, 9, 10
    db 11, 12, 13, 14, 15
    db 16, 17, 18, 19, 20
col db 5
row db 4
res db 0
.code
main proc far
	mov ax, @data
	mov ds, ax
	xor bx, bx
	mov dx, row
cycle1:	mov cx, col
	xor si, si
cycle2:	mov al, arr[bx + si]
	call is_sym
	cmp ah, 1
	jne next_it
	call sum_of
	add res, ax
	dec dl
	xor cx, cx
next-it:inc si
	loop cycle2
	dec dx
	cmp dx, 0
	jne cycle1
	cmp res, 0
	jne foo1
	mov ah, 10
	int 21h
	jmp end2
foo1:	call print
end2:	ret
main endp



is_sym proc
	push bx dx cx
pol:	mov bl, al
	mov dx, 1
	xor al, al
	imul 10
	idiv 10
	add dl, ah
	cmp al, 0
	jne end1
	cmp bl, dl
	jne end1
	mov ah, 1
end1:	pop cx dx bx
	ret
is_sym endp


sum_of proc
	push dx
	xor dx, dx
	xor ax, ax
	xor si, si
	mov bx, 10
	mov cx, col
foo:	mov dl, arr[bx + si]
	add ax, arr[bx + si]
	inc si
	loop foo
	pop dx

print proc
	xor cx, cx
	mov bx, 10
	mov ax, res
foo3:	xor dx, dx
	idiv bx
	push dx
	inc cx
	test ax, ax
	jnz foo3
foo4:	pop dx
	add dl, '0'
	mov ah, 10
	int 21h
	loop foo4
print endp
end main
