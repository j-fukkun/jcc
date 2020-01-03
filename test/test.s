.intel_syntax noprefix
.bss
.align 4
g2:
  .zero 16
.align 4
xg:
  .zero 4
.data
.align 1
.L.data.92:
  .string "g3"
.align 1
.L.data.91:
  .string "array_c2 = %s\n"
.align 1
.L.data.90:
  .string "array_c = %s\n"
.align 1
.L.data.89:
  .string "int array[3] = {100}; array[2];"
.align 1
.L.data.88:
  .string "int array[3] = {100}; array[1];"
.align 1
.L.data.87:
  .string "int array[3] = {100}; array[0];"
.align 1
.L.data.86:
  .string "char x[]=foo; sizeof(x); }"
.align 1
.L.data.85:
  .string "int x[]={1,2,3,4}; sizeof(x);"
.align 1
.L.data.84:
  .string "int x[]={1,2,3,4}; x[3];"
.align 1
.L.data.83:
  .string "int x[4]={1,2,3,4}; x[2];"
.align 1
.L.data.82:
  .string "local"
.align 1
.L.data.81:
  .string "%s, %s\n"
.align 1
.L.data.80:
  .string "g"
.align 1
.L.data.79:
  .string "sizeof(abc)"
.align 1
.L.data.78:
  .string "abc"
.align 1
.L.data.77:
  .string "abc[3]"
.align 1
.L.data.76:
  .string "abc"
.align 1
.L.data.75:
  .string "abc[2]"
.align 1
.L.data.74:
  .string "abc"
.align 1
.L.data.73:
  .string "abc[1]"
.align 1
.L.data.72:
  .string "abc"
.align 1
.L.data.71:
  .string "abc[0]"
.align 1
.L.data.70:
  .string "abc"
.align 1
.L.data.69:
  .string "char x[10]; sizeof(x);"
.align 1
.L.data.68:
  .string "char x; sizeof(x);"
.align 1
.L.data.67:
  .string "char x=1; char y=2; y;"
.align 1
.L.data.66:
  .string "char x=1; char y=2; x;"
.align 1
.L.data.65:
  .string "char x=1; x;"
.align 1
.L.data.64:
  .string "sizeof(g2)"
.align 1
.L.data.63:
  .string "sizeof(x)"
.align 1
.L.data.62:
  .string "g2[3]"
.align 1
.L.data.61:
  .string "g2[2]"
.align 1
.L.data.60:
  .string "g2[1]"
.align 1
.L.data.59:
  .string "g2[0]"
.align 1
.L.data.58:
  .string "xg"
.align 1
.L.data.57:
  .string "xg"
.align 1
.L.data.56:
  .string "int x[4]; sizeof(x);"
.align 1
.L.data.55:
  .string "int *x; sizeof(x);"
.align 1
.L.data.54:
  .string "int x; sizeof x;"
.align 1
.L.data.53:
  .string "int x; sizeof(x);"
.align 1
.L.data.52:
  .string "int x[3]; *x=3; x[1]=4; 2[x]=6; *(x+2);"
.align 1
.L.data.51:
  .string "int x[3]; *x=3; x[1]=4; x[2]=5; *(x+2);"
.align 1
.L.data.50:
  .string "int x[3]; *x=3; x[1]=4; x[2]=5; *(x+1);"
.align 1
.L.data.49:
  .string "int x[3]; *x=3; x[1]=4; x[2]=5; *x;"
.align 1
.L.data.48:
  .string "int x[3]; *x=3; *(x+1)=4; *(x+2)=5; *(x+2);"
.align 1
.L.data.47:
  .string "int x[3]; *x=3; *(x+1)=4; *(x+2)=5; *(x+1);"
.align 1
.L.data.46:
  .string "int x[3]; *x=3; *(x+1)=4; *(x+2)=5; *x;"
.align 1
.L.data.45:
  .string "int x=3; int *y=&x; int **z=&y; **z;"
.align 1
.L.data.44:
  .string "int x=3; *&x;"
.align 1
.L.data.43:
  .string "kaijo(5)"
.align 1
.L.data.42:
  .string "add6(1,2,3,4,5,6)"
.align 1
.L.data.41:
  .string "add(3, 5)"
.align 1
.L.data.40:
  .string "int i=0; int j=0; for (i=0; i<=10; i=i+1) j=i+j; j;"
.align 1
.L.data.39:
  .string "int i=0; int j=0; while(i<=10) {j=i+j; i=i+1;} j;"
.align 1
.L.data.38:
  .string "int i=0; i=0; while(i<10) i=i+1; i;"
.align 1
.L.data.37:
  .string "int x=0; if (2-1) x=2; else x=3; x;"
.align 1
.L.data.36:
  .string "int x=0; if (1) x=2; else x=3; x;"
.align 1
.L.data.35:
  .string "int x=0; if (1-1) x=2; else x=3; x;"
.align 1
.L.data.34:
  .string "int x=0; if (0) x=2; else x=3; x;"
.align 1
.L.data.33:
  .string "int foo123=3; int bar=5; foo123+bar;"
.align 1
.L.data.32:
  .string "int foo=3; foo;"
.align 1
.L.data.31:
  .string "int a=3; int z=5; a+z;"
.align 1
.L.data.30:
  .string "int a=3; a;"
.align 1
.L.data.29:
  .string "int a; int z; a=3; z=5; a+z;"
.align 1
.L.data.28:
  .string "int a; a=3; a;"
.align 1
.L.data.27:
  .string "1>=2"
.align 1
.L.data.26:
  .string "1>=1"
.align 1
.L.data.25:
  .string "1>=0"
.align 1
.L.data.24:
  .string "1>2"
.align 1
.L.data.23:
  .string "1>1"
.align 1
.L.data.22:
  .string "1>0"
.align 1
.L.data.21:
  .string "2<=1"
.align 1
.L.data.20:
  .string "1<=1"
.align 1
.L.data.19:
  .string "0<=1"
.align 1
.L.data.18:
  .string "2<1"
.align 1
.L.data.17:
  .string "1<1"
.align 1
.L.data.16:
  .string "0<1"
.align 1
.L.data.15:
  .string "42!=42"
.align 1
.L.data.14:
  .string "0!=1"
.align 1
.L.data.13:
  .string "42==42"
.align 1
.L.data.12:
  .string "0==1"
.align 1
.L.data.11:
  .string "- - +10"
.align 1
.L.data.10:
  .string "- -10"
.align 1
.L.data.9:
  .string "0"
.align 1
.L.data.8:
  .string "(3+5)/2"
.align 1
.L.data.7:
  .string "5*(9-6)"
.align 1
.L.data.6:
  .string "12+34-5"
.align 1
.L.data.5:
  .string "10/5"
.align 1
.L.data.4:
  .string "2*3"
.align 1
.L.data.3:
  .string "2-3"
.align 1
.L.data.2:
  .string "2+3"
.align 1
.L.data.1:
  .string "%s => %ld expected but got %ld\n"
.align 1
.L.data.0:
  .string "%s => %ld\n"
.align 1
g3:
  .byte 3
.align 4
z4:
  .4byte 10
  .4byte 20
  .4byte 30
.align 4
z3:
  .4byte 1
  .4byte 2
  .byte 0
  .byte 0
  .byte 0
  .byte 0
  .byte 0
  .byte 0
  .byte 0
  .byte 0
.align 1
gzz:
  .byte 87
  .byte 111
  .byte 114
  .byte 108
  .byte 100
  .byte 0
.align 1
gz:
  .byte 72
  .byte 101
  .byte 108
  .byte 108
  .byte 111
  .byte 0
.align 4
g:
  .4byte 10
.text
.global assert
assert:
  push rbp
  mov rbp, rsp
  sub rsp, 16
  mov [rbp-4], edi
  mov [rbp-8], esi
  mov [rbp-16], rdx
  mov rax, rbp
  sub rax, 4
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  mov rax, rbp
  sub rax, 8
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  pop rdi
  pop rax
  cmp rax, rdi
  sete al
  movzb rax, al
  push rax
  pop rax
  cmp rax, 0
  je  .L.else.1
  push offset .L.data.0
  mov rax, rbp
  sub rax, 16
  push rax
  pop rax
  mov rax, [rax]
  push rax
  mov rax, rbp
  sub rax, 8
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.2
  mov rax, 0
  call printf
  jmp .L.end.2
.L.call.2:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.2:
  push rax
  pop rax
  jmp .L.end.1
.L.else.1:
  push offset .L.data.1
  mov rax, rbp
  sub rax, 16
  push rax
  pop rax
  mov rax, [rax]
  push rax
  mov rax, rbp
  sub rax, 4
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  mov rax, rbp
  sub rax, 8
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  pop rcx
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.3
  mov rax, 0
  call printf
  jmp .L.end.3
.L.call.3:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.3:
  push rax
  pop rax
  mov rax, rsp
  and rax, 15
  jnz .L.call.4
  mov rax, 0
  call abort
  jmp .L.end.4
.L.call.4:
  sub rsp, 8
  mov rax, 0
  call abort
  add rsp, 8
.L.end.4:
  push rax
  pop rax
.L.end.1:
  jmp .L.return.assert
.L.return.assert:
  mov rsp, rbp
  pop rbp
  ret
.global add2
add2:
  push rbp
  mov rbp, rsp
  sub rsp, 8
  mov [rbp-4], edi
  mov [rbp-8], esi
  mov rax, rbp
  sub rax, 4
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  mov rax, rbp
  sub rax, 8
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  pop rdi
  pop rax
  add rax, rdi
  push rax
  pop rax
  jmp .L.return.add2
.L.return.add2:
  mov rsp, rbp
  pop rbp
  ret
.global add6
add6:
  push rbp
  mov rbp, rsp
  sub rsp, 24
  mov [rbp-4], edi
  mov [rbp-8], esi
  mov [rbp-12], edx
  mov [rbp-16], ecx
  mov [rbp-20], r8d
  mov [rbp-24], r9d
  mov rax, rbp
  sub rax, 4
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  mov rax, rbp
  sub rax, 8
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  pop rdi
  pop rax
  add rax, rdi
  push rax
  mov rax, rbp
  sub rax, 12
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  pop rdi
  pop rax
  add rax, rdi
  push rax
  mov rax, rbp
  sub rax, 16
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  pop rdi
  pop rax
  add rax, rdi
  push rax
  mov rax, rbp
  sub rax, 20
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  pop rdi
  pop rax
  add rax, rdi
  push rax
  mov rax, rbp
  sub rax, 24
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  pop rdi
  pop rax
  add rax, rdi
  push rax
  pop rax
  jmp .L.return.add6
.L.return.add6:
  mov rsp, rbp
  pop rbp
  ret
.global kaijo
kaijo:
  push rbp
  mov rbp, rsp
  sub rsp, 8
  mov [rbp-4], edi
  mov rax, rbp
  sub rax, 4
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push 1
  pop rdi
  pop rax
  cmp rax, rdi
  sete al
  movzb rax, al
  push rax
  pop rax
  cmp rax, 0
  je  .L.else.5
  push 1
  pop rax
  jmp .L.return.kaijo
  pop rax
  jmp .L.end.5
.L.else.5:
  mov rax, rbp
  sub rax, 4
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  mov rax, rbp
  sub rax, 4
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push 1
  pop rdi
  pop rax
  sub rax, rdi
  push rax
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.6
  mov rax, 0
  call kaijo
  jmp .L.end.6
.L.call.6:
  sub rsp, 8
  mov rax, 0
  call kaijo
  add rsp, 8
.L.end.6:
  push rax
  pop rdi
  pop rax
  imul rax, rdi
  push rax
  pop rax
  jmp .L.return.kaijo
  pop rax
.L.end.5:
.L.return.kaijo:
  mov rsp, rbp
  pop rbp
  ret
.global main
main:
  push rbp
  mov rbp, rsp
  sub rsp, 192
  push 5
  push 2
  push 3
  pop rdi
  pop rax
  add rax, rdi
  push rax
  push offset .L.data.2
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.7
  mov rax, 0
  call assert
  jmp .L.end.7
.L.call.7:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.7:
  push rax
  push 0
  push 1
  pop rdi
  pop rax
  sub rax, rdi
  push rax
  push 2
  push 3
  pop rdi
  pop rax
  sub rax, rdi
  push rax
  push offset .L.data.3
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.8
  mov rax, 0
  call assert
  jmp .L.end.8
.L.call.8:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.8:
  push rax
  push 6
  push 2
  push 3
  pop rdi
  pop rax
  imul rax, rdi
  push rax
  push offset .L.data.4
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.9
  mov rax, 0
  call assert
  jmp .L.end.9
.L.call.9:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.9:
  push rax
  push 2
  push 10
  push 5
  pop rdi
  pop rax
  cqo
  idiv rdi
  push rax
  push offset .L.data.5
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.10
  mov rax, 0
  call assert
  jmp .L.end.10
.L.call.10:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.10:
  push rax
  push 41
  push 12
  push 34
  pop rdi
  pop rax
  add rax, rdi
  push rax
  push 5
  pop rdi
  pop rax
  sub rax, rdi
  push rax
  push offset .L.data.6
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.11
  mov rax, 0
  call assert
  jmp .L.end.11
.L.call.11:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.11:
  push rax
  push 15
  push 5
  push 9
  push 6
  pop rdi
  pop rax
  sub rax, rdi
  push rax
  pop rdi
  pop rax
  imul rax, rdi
  push rax
  push offset .L.data.7
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.12
  mov rax, 0
  call assert
  jmp .L.end.12
.L.call.12:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.12:
  push rax
  push 4
  push 3
  push 5
  pop rdi
  pop rax
  add rax, rdi
  push rax
  push 2
  pop rdi
  pop rax
  cqo
  idiv rdi
  push rax
  push offset .L.data.8
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.13
  mov rax, 0
  call assert
  jmp .L.end.13
.L.call.13:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.13:
  push rax
  push 0
  push 10
  pop rdi
  pop rax
  sub rax, rdi
  push rax
  push 0
  push 10
  pop rdi
  pop rax
  sub rax, rdi
  push rax
  push offset .L.data.9
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.14
  mov rax, 0
  call assert
  jmp .L.end.14
.L.call.14:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.14:
  push rax
  push 10
  push 0
  push 0
  push 10
  pop rdi
  pop rax
  sub rax, rdi
  push rax
  pop rdi
  pop rax
  sub rax, rdi
  push rax
  push offset .L.data.10
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.15
  mov rax, 0
  call assert
  jmp .L.end.15
.L.call.15:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.15:
  push rax
  push 10
  push 0
  push 0
  push 10
  pop rdi
  pop rax
  sub rax, rdi
  push rax
  pop rdi
  pop rax
  sub rax, rdi
  push rax
  push offset .L.data.11
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.16
  mov rax, 0
  call assert
  jmp .L.end.16
.L.call.16:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.16:
  push rax
  push 0
  push 0
  push 1
  pop rdi
  pop rax
  cmp rax, rdi
  sete al
  movzb rax, al
  push rax
  push offset .L.data.12
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.17
  mov rax, 0
  call assert
  jmp .L.end.17
.L.call.17:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.17:
  push rax
  push 1
  push 42
  push 42
  pop rdi
  pop rax
  cmp rax, rdi
  sete al
  movzb rax, al
  push rax
  push offset .L.data.13
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.18
  mov rax, 0
  call assert
  jmp .L.end.18
.L.call.18:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.18:
  push rax
  push 1
  push 0
  push 1
  pop rdi
  pop rax
  cmp rax, rdi
  setne al
  movzb rax, al
  push rax
  push offset .L.data.14
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.19
  mov rax, 0
  call assert
  jmp .L.end.19
.L.call.19:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.19:
  push rax
  push 0
  push 42
  push 42
  pop rdi
  pop rax
  cmp rax, rdi
  setne al
  movzb rax, al
  push rax
  push offset .L.data.15
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.20
  mov rax, 0
  call assert
  jmp .L.end.20
.L.call.20:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.20:
  push rax
  push 1
  push 0
  push 1
  pop rdi
  pop rax
  cmp rax, rdi
  setl al
  movzb rax, al
  push rax
  push offset .L.data.16
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.21
  mov rax, 0
  call assert
  jmp .L.end.21
.L.call.21:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.21:
  push rax
  push 0
  push 1
  push 1
  pop rdi
  pop rax
  cmp rax, rdi
  setl al
  movzb rax, al
  push rax
  push offset .L.data.17
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.22
  mov rax, 0
  call assert
  jmp .L.end.22
.L.call.22:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.22:
  push rax
  push 0
  push 2
  push 1
  pop rdi
  pop rax
  cmp rax, rdi
  setl al
  movzb rax, al
  push rax
  push offset .L.data.18
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.23
  mov rax, 0
  call assert
  jmp .L.end.23
.L.call.23:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.23:
  push rax
  push 1
  push 0
  push 1
  pop rdi
  pop rax
  cmp rax, rdi
  setle al
  movzb rax, al
  push rax
  push offset .L.data.19
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.24
  mov rax, 0
  call assert
  jmp .L.end.24
.L.call.24:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.24:
  push rax
  push 1
  push 1
  push 1
  pop rdi
  pop rax
  cmp rax, rdi
  setle al
  movzb rax, al
  push rax
  push offset .L.data.20
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.25
  mov rax, 0
  call assert
  jmp .L.end.25
.L.call.25:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.25:
  push rax
  push 0
  push 2
  push 1
  pop rdi
  pop rax
  cmp rax, rdi
  setle al
  movzb rax, al
  push rax
  push offset .L.data.21
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.26
  mov rax, 0
  call assert
  jmp .L.end.26
.L.call.26:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.26:
  push rax
  push 1
  push 0
  push 1
  pop rdi
  pop rax
  cmp rax, rdi
  setl al
  movzb rax, al
  push rax
  push offset .L.data.22
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.27
  mov rax, 0
  call assert
  jmp .L.end.27
.L.call.27:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.27:
  push rax
  push 0
  push 1
  push 1
  pop rdi
  pop rax
  cmp rax, rdi
  setl al
  movzb rax, al
  push rax
  push offset .L.data.23
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.28
  mov rax, 0
  call assert
  jmp .L.end.28
.L.call.28:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.28:
  push rax
  push 0
  push 2
  push 1
  pop rdi
  pop rax
  cmp rax, rdi
  setl al
  movzb rax, al
  push rax
  push offset .L.data.24
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.29
  mov rax, 0
  call assert
  jmp .L.end.29
.L.call.29:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.29:
  push rax
  push 1
  push 0
  push 1
  pop rdi
  pop rax
  cmp rax, rdi
  setle al
  movzb rax, al
  push rax
  push offset .L.data.25
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.30
  mov rax, 0
  call assert
  jmp .L.end.30
.L.call.30:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.30:
  push rax
  push 1
  push 1
  push 1
  pop rdi
  pop rax
  cmp rax, rdi
  setle al
  movzb rax, al
  push rax
  push offset .L.data.26
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.31
  mov rax, 0
  call assert
  jmp .L.end.31
.L.call.31:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.31:
  push rax
  push 0
  push 2
  push 1
  pop rdi
  pop rax
  cmp rax, rdi
  setle al
  movzb rax, al
  push rax
  push offset .L.data.27
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.32
  mov rax, 0
  call assert
  jmp .L.end.32
.L.call.32:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.32:
  push rax
  mov rax, rbp
  sub rax, 188
  push rax
  push 3
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  push 3
  mov rax, rbp
  sub rax, 188
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push offset .L.data.28
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.33
  mov rax, 0
  call assert
  jmp .L.end.33
.L.call.33:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.33:
  push rax
  mov rax, rbp
  sub rax, 184
  push rax
  push 5
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  push 8
  mov rax, rbp
  sub rax, 188
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  mov rax, rbp
  sub rax, 184
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  pop rdi
  pop rax
  add rax, rdi
  push rax
  push offset .L.data.29
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.34
  mov rax, 0
  call assert
  jmp .L.end.34
.L.call.34:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.34:
  push rax
  mov rax, rbp
  sub rax, 180
  push rax
  push 3
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 176
  push rax
  push 5
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  add rsp, 8
  pop rax
  push 3
  mov rax, rbp
  sub rax, 188
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push offset .L.data.30
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.35
  mov rax, 0
  call assert
  jmp .L.end.35
.L.call.35:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.35:
  push rax
  push 8
  mov rax, rbp
  sub rax, 188
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  mov rax, rbp
  sub rax, 184
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  pop rdi
  pop rax
  add rax, rdi
  push rax
  push offset .L.data.31
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.36
  mov rax, 0
  call assert
  jmp .L.end.36
.L.call.36:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.36:
  push rax
  mov rax, rbp
  sub rax, 172
  push rax
  push 3
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  add rsp, 8
  pop rax
  push 3
  mov rax, rbp
  sub rax, 172
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push offset .L.data.32
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.37
  mov rax, 0
  call assert
  jmp .L.end.37
.L.call.37:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.37:
  push rax
  mov rax, rbp
  sub rax, 168
  push rax
  push 3
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 164
  push rax
  push 5
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  add rsp, 8
  pop rax
  push 8
  mov rax, rbp
  sub rax, 168
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  mov rax, rbp
  sub rax, 164
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  pop rdi
  pop rax
  add rax, rdi
  push rax
  push offset .L.data.33
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.38
  mov rax, 0
  call assert
  jmp .L.end.38
.L.call.38:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.38:
  push rax
  mov rax, rbp
  sub rax, 160
  push rax
  push 0
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  add rsp, 8
  pop rax
  push 0
  pop rax
  cmp rax, 0
  je  .L.else.39
  mov rax, rbp
  sub rax, 160
  push rax
  push 2
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  jmp .L.end.39
.L.else.39:
  mov rax, rbp
  sub rax, 160
  push rax
  push 3
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
.L.end.39:
  push 3
  mov rax, rbp
  sub rax, 160
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push offset .L.data.34
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.40
  mov rax, 0
  call assert
  jmp .L.end.40
.L.call.40:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.40:
  push rax
  push 1
  push 1
  pop rdi
  pop rax
  sub rax, rdi
  push rax
  pop rax
  cmp rax, 0
  je  .L.else.41
  mov rax, rbp
  sub rax, 160
  push rax
  push 2
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  jmp .L.end.41
.L.else.41:
  mov rax, rbp
  sub rax, 160
  push rax
  push 3
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
.L.end.41:
  push 3
  mov rax, rbp
  sub rax, 160
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push offset .L.data.35
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.42
  mov rax, 0
  call assert
  jmp .L.end.42
.L.call.42:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.42:
  push rax
  push 1
  pop rax
  cmp rax, 0
  je  .L.else.43
  mov rax, rbp
  sub rax, 160
  push rax
  push 2
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  jmp .L.end.43
.L.else.43:
  mov rax, rbp
  sub rax, 160
  push rax
  push 3
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
.L.end.43:
  push 2
  mov rax, rbp
  sub rax, 160
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push offset .L.data.36
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.44
  mov rax, 0
  call assert
  jmp .L.end.44
.L.call.44:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.44:
  push rax
  push 2
  push 1
  pop rdi
  pop rax
  sub rax, rdi
  push rax
  pop rax
  cmp rax, 0
  je  .L.else.45
  mov rax, rbp
  sub rax, 160
  push rax
  push 2
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  jmp .L.end.45
.L.else.45:
  mov rax, rbp
  sub rax, 160
  push rax
  push 3
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
.L.end.45:
  push 2
  mov rax, rbp
  sub rax, 160
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push offset .L.data.37
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.46
  mov rax, 0
  call assert
  jmp .L.end.46
.L.call.46:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.46:
  push rax
  mov rax, rbp
  sub rax, 156
  push rax
  push 0
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  add rsp, 8
  pop rax
.L.begin.47:
  mov rax, rbp
  sub rax, 156
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push 10
  pop rdi
  pop rax
  cmp rax, rdi
  setl al
  movzb rax, al
  push rax
  pop rax
  cmp rax, 0
  je  .L.end.47
  mov rax, rbp
  sub rax, 156
  push rax
  mov rax, rbp
  sub rax, 156
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push 1
  pop rdi
  pop rax
  add rax, rdi
  push rax
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  jmp .L.begin.47
.L.end.47:
  push 10
  mov rax, rbp
  sub rax, 156
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push offset .L.data.38
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.48
  mov rax, 0
  call assert
  jmp .L.end.48
.L.call.48:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.48:
  push rax
  mov rax, rbp
  sub rax, 156
  push rax
  push 0
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  mov rax, rbp
  sub rax, 152
  push rax
  push 0
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  add rsp, 8
  pop rax
.L.begin.49:
  mov rax, rbp
  sub rax, 156
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push 10
  pop rdi
  pop rax
  cmp rax, rdi
  setle al
  movzb rax, al
  push rax
  pop rax
  cmp rax, 0
  je  .L.end.49
  mov rax, rbp
  sub rax, 152
  push rax
  mov rax, rbp
  sub rax, 156
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  mov rax, rbp
  sub rax, 152
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  pop rdi
  pop rax
  add rax, rdi
  push rax
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  pop rax
  mov rax, rbp
  sub rax, 156
  push rax
  mov rax, rbp
  sub rax, 156
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push 1
  pop rdi
  pop rax
  add rax, rdi
  push rax
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  pop rax
  jmp .L.begin.49
.L.end.49:
  push 55
  mov rax, rbp
  sub rax, 152
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push offset .L.data.39
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.50
  mov rax, 0
  call assert
  jmp .L.end.50
.L.call.50:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.50:
  push rax
  mov rax, rbp
  sub rax, 156
  push rax
  push 0
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  mov rax, rbp
  sub rax, 152
  push rax
  push 0
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  mov rax, rbp
  sub rax, 156
  push rax
  push 0
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
.L.begin.51:
  mov rax, rbp
  sub rax, 156
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push 10
  pop rdi
  pop rax
  cmp rax, rdi
  setle al
  movzb rax, al
  push rax
  pop rax
  cmp rax, 0
  je  .L.end.51
  mov rax, rbp
  sub rax, 152
  push rax
  mov rax, rbp
  sub rax, 156
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  mov rax, rbp
  sub rax, 152
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  pop rdi
  pop rax
  add rax, rdi
  push rax
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  mov rax, rbp
  sub rax, 156
  push rax
  mov rax, rbp
  sub rax, 156
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push 1
  pop rdi
  pop rax
  add rax, rdi
  push rax
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  jmp .L.begin.51
.L.end.51:
  push 55
  mov rax, rbp
  sub rax, 152
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push offset .L.data.40
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.52
  mov rax, 0
  call assert
  jmp .L.end.52
.L.call.52:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.52:
  push rax
  push 8
  push 3
  push 5
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.53
  mov rax, 0
  call add2
  jmp .L.end.53
.L.call.53:
  sub rsp, 8
  mov rax, 0
  call add2
  add rsp, 8
.L.end.53:
  push rax
  push offset .L.data.41
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.54
  mov rax, 0
  call assert
  jmp .L.end.54
.L.call.54:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.54:
  push rax
  push 21
  push 1
  push 2
  push 3
  push 4
  push 5
  push 6
  pop r9
  pop r8
  pop rcx
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.55
  mov rax, 0
  call add6
  jmp .L.end.55
.L.call.55:
  sub rsp, 8
  mov rax, 0
  call add6
  add rsp, 8
.L.end.55:
  push rax
  push offset .L.data.42
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.56
  mov rax, 0
  call assert
  jmp .L.end.56
.L.call.56:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.56:
  push rax
  push 120
  push 5
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.57
  mov rax, 0
  call kaijo
  jmp .L.end.57
.L.call.57:
  sub rsp, 8
  mov rax, 0
  call kaijo
  add rsp, 8
.L.end.57:
  push rax
  push offset .L.data.43
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.58
  mov rax, 0
  call assert
  jmp .L.end.58
.L.call.58:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.58:
  push rax
  mov rax, rbp
  sub rax, 148
  push rax
  push 3
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  add rsp, 8
  pop rax
  push 3
  mov rax, rbp
  sub rax, 148
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push offset .L.data.44
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.59
  mov rax, 0
  call assert
  jmp .L.end.59
.L.call.59:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.59:
  push rax
  mov rax, rbp
  sub rax, 144
  push rax
  mov rax, rbp
  sub rax, 148
  push rax
  pop rdi
  pop rax
  mov [rax], rdi
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 136
  push rax
  mov rax, rbp
  sub rax, 144
  push rax
  pop rdi
  pop rax
  mov [rax], rdi
  push rdi
  add rsp, 8
  pop rax
  push 3
  mov rax, rbp
  sub rax, 136
  push rax
  pop rax
  mov rax, [rax]
  push rax
  pop rax
  mov rax, [rax]
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push offset .L.data.45
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.60
  mov rax, 0
  call assert
  jmp .L.end.60
.L.call.60:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.60:
  push rax
  mov rax, rbp
  sub rax, 128
  push rax
  push 3
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  mov rax, rbp
  sub rax, 128
  push rax
  push 1
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  push 4
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  mov rax, rbp
  sub rax, 128
  push rax
  push 2
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  push 5
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  push 3
  mov rax, rbp
  sub rax, 128
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push offset .L.data.46
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.61
  mov rax, 0
  call assert
  jmp .L.end.61
.L.call.61:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.61:
  push rax
  push 4
  mov rax, rbp
  sub rax, 128
  push rax
  push 1
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push offset .L.data.47
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.62
  mov rax, 0
  call assert
  jmp .L.end.62
.L.call.62:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.62:
  push rax
  push 5
  mov rax, rbp
  sub rax, 128
  push rax
  push 2
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push offset .L.data.48
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.63
  mov rax, 0
  call assert
  jmp .L.end.63
.L.call.63:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.63:
  push rax
  mov rax, rbp
  sub rax, 128
  push rax
  push 3
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  mov rax, rbp
  sub rax, 128
  push rax
  push 1
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  push 4
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  mov rax, rbp
  sub rax, 128
  push rax
  push 2
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  push 5
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  push 3
  mov rax, rbp
  sub rax, 128
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push offset .L.data.49
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.64
  mov rax, 0
  call assert
  jmp .L.end.64
.L.call.64:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.64:
  push rax
  push 4
  mov rax, rbp
  sub rax, 128
  push rax
  push 1
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push offset .L.data.50
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.65
  mov rax, 0
  call assert
  jmp .L.end.65
.L.call.65:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.65:
  push rax
  push 5
  mov rax, rbp
  sub rax, 128
  push rax
  push 2
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push offset .L.data.51
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.66
  mov rax, 0
  call assert
  jmp .L.end.66
.L.call.66:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.66:
  push rax
  mov rax, rbp
  sub rax, 128
  push rax
  push 2
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  push 6
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  push 6
  mov rax, rbp
  sub rax, 128
  push rax
  push 2
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push offset .L.data.52
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.67
  mov rax, 0
  call assert
  jmp .L.end.67
.L.call.67:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.67:
  push rax
  push 4
  push 4
  push offset .L.data.53
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.68
  mov rax, 0
  call assert
  jmp .L.end.68
.L.call.68:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.68:
  push rax
  push 4
  push 4
  push offset .L.data.54
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.69
  mov rax, 0
  call assert
  jmp .L.end.69
.L.call.69:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.69:
  push rax
  push 8
  push 8
  push offset .L.data.55
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.70
  mov rax, 0
  call assert
  jmp .L.end.70
.L.call.70:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.70:
  push rax
  push 16
  push 16
  push offset .L.data.56
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.71
  mov rax, 0
  call assert
  jmp .L.end.71
.L.call.71:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.71:
  push rax
  push 0
  push offset xg
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push offset .L.data.57
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.72
  mov rax, 0
  call assert
  jmp .L.end.72
.L.call.72:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.72:
  push rax
  push offset xg
  push 5
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  push 5
  push offset xg
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push offset .L.data.58
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.73
  mov rax, 0
  call assert
  jmp .L.end.73
.L.call.73:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.73:
  push rax
  push offset g2
  push 0
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  push 0
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  push offset g2
  push 1
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  push 1
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  push offset g2
  push 2
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  push 2
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  push offset g2
  push 3
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  push 3
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  push 0
  push offset g2
  push 0
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push offset .L.data.59
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.74
  mov rax, 0
  call assert
  jmp .L.end.74
.L.call.74:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.74:
  push rax
  push 1
  push offset g2
  push 1
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push offset .L.data.60
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.75
  mov rax, 0
  call assert
  jmp .L.end.75
.L.call.75:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.75:
  push rax
  push 2
  push offset g2
  push 2
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push offset .L.data.61
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.76
  mov rax, 0
  call assert
  jmp .L.end.76
.L.call.76:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.76:
  push rax
  push 3
  push offset g2
  push 3
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push offset .L.data.62
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.77
  mov rax, 0
  call assert
  jmp .L.end.77
.L.call.77:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.77:
  push rax
  push 4
  push 4
  push offset .L.data.63
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.78
  mov rax, 0
  call assert
  jmp .L.end.78
.L.call.78:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.78:
  push rax
  push 16
  push 16
  push offset .L.data.64
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.79
  mov rax, 0
  call assert
  jmp .L.end.79
.L.call.79:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.79:
  push rax
  mov rax, rbp
  sub rax, 88
  push rax
  push 1
  pop rdi
  pop rax
  mov [rax], dil
  push rdi
  add rsp, 8
  pop rax
  push 1
  mov rax, rbp
  sub rax, 88
  push rax
  pop rax
  movsx rax, byte ptr [rax]
  push rax
  push offset .L.data.65
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.80
  mov rax, 0
  call assert
  jmp .L.end.80
.L.call.80:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.80:
  push rax
  mov rax, rbp
  sub rax, 87
  push rax
  push 2
  pop rdi
  pop rax
  mov [rax], dil
  push rdi
  add rsp, 8
  pop rax
  push 1
  mov rax, rbp
  sub rax, 88
  push rax
  pop rax
  movsx rax, byte ptr [rax]
  push rax
  push offset .L.data.66
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.81
  mov rax, 0
  call assert
  jmp .L.end.81
.L.call.81:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.81:
  push rax
  push 2
  mov rax, rbp
  sub rax, 87
  push rax
  pop rax
  movsx rax, byte ptr [rax]
  push rax
  push offset .L.data.67
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.82
  mov rax, 0
  call assert
  jmp .L.end.82
.L.call.82:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.82:
  push rax
  push 1
  push 1
  push offset .L.data.68
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.83
  mov rax, 0
  call assert
  jmp .L.end.83
.L.call.83:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.83:
  push rax
  push 10
  push 10
  push offset .L.data.69
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.84
  mov rax, 0
  call assert
  jmp .L.end.84
.L.call.84:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.84:
  push rax
  push 97
  push offset .L.data.70
  push 0
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  pop rax
  movsx rax, byte ptr [rax]
  push rax
  push offset .L.data.71
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.85
  mov rax, 0
  call assert
  jmp .L.end.85
.L.call.85:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.85:
  push rax
  push 98
  push offset .L.data.72
  push 1
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  pop rax
  movsx rax, byte ptr [rax]
  push rax
  push offset .L.data.73
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.86
  mov rax, 0
  call assert
  jmp .L.end.86
.L.call.86:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.86:
  push rax
  push 99
  push offset .L.data.74
  push 2
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  pop rax
  movsx rax, byte ptr [rax]
  push rax
  push offset .L.data.75
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.87
  mov rax, 0
  call assert
  jmp .L.end.87
.L.call.87:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.87:
  push rax
  push 0
  push offset .L.data.76
  push 3
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  pop rax
  movsx rax, byte ptr [rax]
  push rax
  push offset .L.data.77
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.88
  mov rax, 0
  call assert
  jmp .L.end.88
.L.call.88:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.88:
  push rax
  push 4
  push 4
  push offset .L.data.79
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.89
  mov rax, 0
  call assert
  jmp .L.end.89
.L.call.89:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.89:
  push rax
  push 10
  push offset g
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push offset .L.data.80
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.90
  mov rax, 0
  call assert
  jmp .L.end.90
.L.call.90:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.90:
  push rax
  push offset .L.data.81
  push offset gz
  push offset gzz
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.91
  mov rax, 0
  call printf
  jmp .L.end.91
.L.call.91:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.91:
  push rax
  mov rax, rbp
  sub rax, 76
  push rax
  push 10
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  add rsp, 8
  pop rax
  push 10
  mov rax, rbp
  sub rax, 76
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push offset .L.data.82
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.92
  mov rax, 0
  call assert
  jmp .L.end.92
.L.call.92:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.92:
  push rax
  mov rax, rbp
  sub rax, 72
  push rax
  push 0
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  push 1
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 72
  push rax
  push 1
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  push 2
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 72
  push rax
  push 2
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  push 3
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 72
  push rax
  push 3
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  push 4
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  add rsp, 8
  pop rax
  push 3
  mov rax, rbp
  sub rax, 72
  push rax
  push 2
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push offset .L.data.83
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.93
  mov rax, 0
  call assert
  jmp .L.end.93
.L.call.93:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.93:
  push rax
  mov rax, rbp
  sub rax, 56
  push rax
  push 0
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  push 1
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 56
  push rax
  push 1
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  push 2
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 56
  push rax
  push 2
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  push 3
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 56
  push rax
  push 3
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  push 4
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  add rsp, 8
  pop rax
  push 4
  mov rax, rbp
  sub rax, 56
  push rax
  push 3
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push offset .L.data.84
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.94
  mov rax, 0
  call assert
  jmp .L.end.94
.L.call.94:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.94:
  push rax
  push 16
  push 16
  push offset .L.data.85
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.95
  mov rax, 0
  call assert
  jmp .L.end.95
.L.call.95:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.95:
  push rax
  mov rax, rbp
  sub rax, 40
  push rax
  push 0
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  push 102
  pop rdi
  pop rax
  mov [rax], dil
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 40
  push rax
  push 1
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  push 111
  pop rdi
  pop rax
  mov [rax], dil
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 40
  push rax
  push 2
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  push 111
  pop rdi
  pop rax
  mov [rax], dil
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 40
  push rax
  push 3
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  push 0
  pop rdi
  pop rax
  mov [rax], dil
  push rdi
  add rsp, 8
  pop rax
  push 4
  push 4
  push offset .L.data.86
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.96
  mov rax, 0
  call assert
  jmp .L.end.96
.L.call.96:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.96:
  push rax
  mov rax, rbp
  sub rax, 36
  push rax
  push 0
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  push 100
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 36
  push rax
  push 1
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  push 0
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 36
  push rax
  push 2
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  push 0
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  add rsp, 8
  pop rax
  push 100
  mov rax, rbp
  sub rax, 36
  push rax
  push 0
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push offset .L.data.87
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.97
  mov rax, 0
  call assert
  jmp .L.end.97
.L.call.97:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.97:
  push rax
  push 0
  mov rax, rbp
  sub rax, 36
  push rax
  push 1
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push offset .L.data.88
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.98
  mov rax, 0
  call assert
  jmp .L.end.98
.L.call.98:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.98:
  push rax
  push 0
  mov rax, rbp
  sub rax, 36
  push rax
  push 2
  pop rdi
  pop rax
  imul rdi, 4
  add rax, rdi
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push offset .L.data.89
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.99
  mov rax, 0
  call assert
  jmp .L.end.99
.L.call.99:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.99:
  push rax
  mov rax, rbp
  sub rax, 24
  push rax
  push 0
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  push 72
  pop rdi
  pop rax
  mov [rax], dil
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 24
  push rax
  push 1
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  push 101
  pop rdi
  pop rax
  mov [rax], dil
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 24
  push rax
  push 2
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  push 108
  pop rdi
  pop rax
  mov [rax], dil
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 24
  push rax
  push 3
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  push 108
  pop rdi
  pop rax
  mov [rax], dil
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 24
  push rax
  push 4
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  push 111
  pop rdi
  pop rax
  mov [rax], dil
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 24
  push rax
  push 5
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  push 32
  pop rdi
  pop rax
  mov [rax], dil
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 24
  push rax
  push 6
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  push 85
  pop rdi
  pop rax
  mov [rax], dil
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 24
  push rax
  push 7
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  push 110
  pop rdi
  pop rax
  mov [rax], dil
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 24
  push rax
  push 8
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  push 100
  pop rdi
  pop rax
  mov [rax], dil
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 24
  push rax
  push 9
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  push 101
  pop rdi
  pop rax
  mov [rax], dil
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 24
  push rax
  push 10
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  push 114
  pop rdi
  pop rax
  mov [rax], dil
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 24
  push rax
  push 11
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  push 32
  pop rdi
  pop rax
  mov [rax], dil
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 24
  push rax
  push 12
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  push 87
  pop rdi
  pop rax
  mov [rax], dil
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 24
  push rax
  push 13
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  push 111
  pop rdi
  pop rax
  mov [rax], dil
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 24
  push rax
  push 14
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  push 114
  pop rdi
  pop rax
  mov [rax], dil
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 24
  push rax
  push 15
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  push 108
  pop rdi
  pop rax
  mov [rax], dil
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 24
  push rax
  push 16
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  push 100
  pop rdi
  pop rax
  mov [rax], dil
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 24
  push rax
  push 17
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  push 0
  pop rdi
  pop rax
  mov [rax], dil
  push rdi
  add rsp, 8
  pop rax
  push offset .L.data.90
  mov rax, rbp
  sub rax, 24
  push rax
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.100
  mov rax, 0
  call printf
  jmp .L.end.100
.L.call.100:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.100:
  push rax
  mov rax, rbp
  sub rax, 6
  push rax
  push 0
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  push 104
  pop rdi
  pop rax
  mov [rax], dil
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 6
  push rax
  push 1
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  push 101
  pop rdi
  pop rax
  mov [rax], dil
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 6
  push rax
  push 2
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  push 108
  pop rdi
  pop rax
  mov [rax], dil
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 6
  push rax
  push 3
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  push 108
  pop rdi
  pop rax
  mov [rax], dil
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 6
  push rax
  push 4
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  push 111
  pop rdi
  pop rax
  mov [rax], dil
  push rdi
  add rsp, 8
  pop rax
  mov rax, rbp
  sub rax, 6
  push rax
  push 5
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  push 0
  pop rdi
  pop rax
  mov [rax], dil
  push rdi
  add rsp, 8
  pop rax
  push offset .L.data.91
  mov rax, rbp
  sub rax, 6
  push rax
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.101
  mov rax, 0
  call printf
  jmp .L.end.101
.L.call.101:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.101:
  push rax
  push 3
  push offset g3
  pop rax
  movsx rax, byte ptr [rax]
  push rax
  push offset .L.data.92
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.102
  mov rax, 0
  call assert
  jmp .L.end.102
.L.call.102:
  sub rsp, 8
  mov rax, 0
  call assert
  add rsp, 8
.L.end.102:
  push rax
  push 0
  pop rax
  jmp .L.return.main
.L.return.main:
  mov rsp, rbp
  pop rbp
  ret
