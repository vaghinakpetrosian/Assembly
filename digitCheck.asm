.model small 
.stack 64
.data
arr db 20, 21 dup(?)
tiv db 20 dup(?), '$'
.code
main proc far
  mov ax, @data
  mov ds, ax
  xor di, di
  xor si, si
  lea dx, arr
  mov ah, 10
  int 21h
loop
