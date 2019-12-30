.intel_syntax noprefix
.bss
.align 4
x:
  .zero 4
.data
.align 1
.L.data.28:
  .string "%s, %s\n"
.align 1
.L.data.27:
  .string "y(global init) = %d\n"
.align 1
.L.data.26:
  .string "d[0] = %d\n"
.align 1
.L.data.25:
  .string "error global value"
.align 1
.L.data.24:
  .string "x = %d\n"
.align 1
.L.data.23:
  .string "error array 2"
.align 1
.L.data.22:
  .string "c[1] = %d\n"
.align 1
.L.data.21:
  .string "error array"
.align 1
.L.data.20:
  .string "c[0] = %d\n"
.align 1
.L.data.19:
  .string "error sizeof pointer"
.align 1
.L.data.18:
  .string "s = %d\n"
.align 1
.L.data.17:
  .string "error sizeof number"
.align 1
.L.data.16:
  .string "s = %d\n"
.align 1
.L.data.15:
  .string "error sizeof int 2"
.align 1
.L.data.14:
  .string "s = %d\n"
.align 1
.L.data.13:
  .string "error sizeof int"
.align 1
.L.data.12:
  .string "s = %d\n"
.align 1
.L.data.11:
  .string "error address"
.align 1
.L.data.10:
  .string "a = %d\n"
.align 1
.L.data.9:
  .string "error pointer\n"
.align 1
.L.data.8:
  .string "*b = %d\n"
.align 1
.L.data.7:
  .string "error kaijo\n"
.align 1
.L.data.6:
  .string "hoge = %d\n"
.align 1
.L.data.5:
  .string "error while\n"
.align 1
.L.data.4:
  .string "hoge = %d\n"
.align 1
.L.data.3:
  .string "error for\n"
.align 1
.L.data.2:
  .string "hoge = %d\n"
.align 1
.L.data.1:
  .string "error local variable\n"
.align 1
.L.data.0:
  .string "hoge = %d\n"
.align 1
zz:
  .byte 87
  .byte 111
  .byte 114
  .byte 108
  .byte 100
  .byte 0
.align 1
z:
  .byte 72
  .byte 101
  .byte 108
  .byte 108
  .byte 111
  .byte 0
.align 4
y:
  .4byte 10
.text
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
  je  .L.else.1
  push 1
  pop rax
  jmp .L.return.kaijo
  pop rax
  jmp .L.end.1
.L.else.1:
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
  jnz .L.call.2
  mov rax, 0
  call kaijo
  jmp .L.end.2
.L.call.2:
  sub rsp, 8
  mov rax, 0
  call kaijo
  add rsp, 8
.L.end.2:
  push rax
  pop rdi
  pop rax
  imul rax, rdi
  push rax
  pop rax
  jmp .L.return.kaijo
  pop rax
.L.end.1:
.L.return.kaijo:
  mov rsp, rbp
  pop rbp
  ret
.global main
main:
  push rbp
  mov rbp, rsp
  sub rsp, 32
  mov rax, rbp
  sub rax, 32
  push rax
  push 10
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  mov rax, rbp
  sub rax, 32
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push 10
  pop rdi
  pop rax
  cmp rax, rdi
  sete al
  movzb rax, al
  push rax
  pop rax
  cmp rax, 0
  je  .L.else.3
  push offset .L.data.0
  mov rax, rbp
  sub rax, 32
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.4
  mov rax, 0
  call printf
  jmp .L.end.4
.L.call.4:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.4:
  push rax
  pop rax
  jmp .L.end.3
.L.else.3:
  push offset .L.data.1
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.5
  mov rax, 0
  call printf
  jmp .L.end.5
.L.call.5:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.5:
  push rax
  pop rax
  mov rax, rsp
  and rax, 15
  jnz .L.call.6
  mov rax, 0
  call abort
  jmp .L.end.6
.L.call.6:
  sub rsp, 8
  mov rax, 0
  call abort
  add rsp, 8
.L.end.6:
  push rax
  pop rax
.L.end.3:
  mov rax, rbp
  sub rax, 32
  push rax
  push 0
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  mov rax, rbp
  sub rax, 28
  push rax
  push 0
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
.L.begin.7:
  mov rax, rbp
  sub rax, 28
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
  je  .L.end.7
  mov rax, rbp
  sub rax, 32
  push rax
  mov rax, rbp
  sub rax, 32
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
  mov rax, rbp
  sub rax, 28
  push rax
  mov rax, rbp
  sub rax, 28
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
  jmp .L.begin.7
.L.end.7:
  mov rax, rbp
  sub rax, 32
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push 10
  pop rdi
  pop rax
  cmp rax, rdi
  sete al
  movzb rax, al
  push rax
  pop rax
  cmp rax, 0
  je  .L.else.8
  push offset .L.data.2
  mov rax, rbp
  sub rax, 32
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.9
  mov rax, 0
  call printf
  jmp .L.end.9
.L.call.9:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.9:
  push rax
  pop rax
  jmp .L.end.8
.L.else.8:
  push offset .L.data.3
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.10
  mov rax, 0
  call printf
  jmp .L.end.10
.L.call.10:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.10:
  push rax
  pop rax
  mov rax, rsp
  and rax, 15
  jnz .L.call.11
  mov rax, 0
  call abort
  jmp .L.end.11
.L.call.11:
  sub rsp, 8
  mov rax, 0
  call abort
  add rsp, 8
.L.end.11:
  push rax
  pop rax
.L.end.8:
  mov rax, rbp
  sub rax, 32
  push rax
  push 0
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
.L.begin.12:
  mov rax, rbp
  sub rax, 32
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
  je  .L.end.12
  mov rax, rbp
  sub rax, 32
  push rax
  mov rax, rbp
  sub rax, 32
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
  jmp .L.begin.12
.L.end.12:
  mov rax, rbp
  sub rax, 32
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push 10
  pop rdi
  pop rax
  cmp rax, rdi
  sete al
  movzb rax, al
  push rax
  pop rax
  cmp rax, 0
  je  .L.else.13
  push offset .L.data.4
  mov rax, rbp
  sub rax, 32
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.14
  mov rax, 0
  call printf
  jmp .L.end.14
.L.call.14:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.14:
  push rax
  pop rax
  jmp .L.end.13
.L.else.13:
  push offset .L.data.5
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.15
  mov rax, 0
  call printf
  jmp .L.end.15
.L.call.15:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.15:
  push rax
  pop rax
  mov rax, rsp
  and rax, 15
  jnz .L.call.16
  mov rax, 0
  call abort
  jmp .L.end.16
.L.call.16:
  sub rsp, 8
  mov rax, 0
  call abort
  add rsp, 8
.L.end.16:
  push rax
  pop rax
.L.end.13:
  mov rax, rbp
  sub rax, 28
  push rax
  push 5
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  mov rax, rbp
  sub rax, 32
  push rax
  mov rax, rbp
  sub rax, 28
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.17
  mov rax, 0
  call kaijo
  jmp .L.end.17
.L.call.17:
  sub rsp, 8
  mov rax, 0
  call kaijo
  add rsp, 8
.L.end.17:
  push rax
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  mov rax, rbp
  sub rax, 32
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push 120
  pop rdi
  pop rax
  cmp rax, rdi
  sete al
  movzb rax, al
  push rax
  pop rax
  cmp rax, 0
  je  .L.else.18
  push offset .L.data.6
  mov rax, rbp
  sub rax, 32
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.19
  mov rax, 0
  call printf
  jmp .L.end.19
.L.call.19:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.19:
  push rax
  pop rax
  jmp .L.end.18
.L.else.18:
  push offset .L.data.7
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.20
  mov rax, 0
  call printf
  jmp .L.end.20
.L.call.20:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.20:
  push rax
  pop rax
  mov rax, rsp
  and rax, 15
  jnz .L.call.21
  mov rax, 0
  call abort
  jmp .L.end.21
.L.call.21:
  sub rsp, 8
  mov rax, 0
  call abort
  add rsp, 8
.L.end.21:
  push rax
  pop rax
.L.end.18:
  mov rax, rbp
  sub rax, 28
  push rax
  push 5
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  mov rax, rbp
  sub rax, 24
  push rax
  mov rax, rbp
  sub rax, 28
  push rax
  pop rdi
  pop rax
  mov [rax], rdi
  push rdi
  mov rax, rbp
  sub rax, 24
  push rax
  pop rax
  mov rax, [rax]
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push 5
  pop rdi
  pop rax
  cmp rax, rdi
  sete al
  movzb rax, al
  push rax
  pop rax
  cmp rax, 0
  je  .L.else.22
  push offset .L.data.8
  mov rax, rbp
  sub rax, 24
  push rax
  pop rax
  mov rax, [rax]
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.23
  mov rax, 0
  call printf
  jmp .L.end.23
.L.call.23:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.23:
  push rax
  pop rax
  jmp .L.end.22
.L.else.22:
  push offset .L.data.9
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.24
  mov rax, 0
  call printf
  jmp .L.end.24
.L.call.24:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.24:
  push rax
  pop rax
  mov rax, rsp
  and rax, 15
  jnz .L.call.25
  mov rax, 0
  call abort
  jmp .L.end.25
.L.call.25:
  sub rsp, 8
  mov rax, 0
  call abort
  add rsp, 8
.L.end.25:
  push rax
  pop rax
.L.end.22:
  mov rax, rbp
  sub rax, 24
  push rax
  pop rax
  mov rax, [rax]
  push rax
  push 10
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  mov rax, rbp
  sub rax, 28
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push 10
  pop rdi
  pop rax
  cmp rax, rdi
  sete al
  movzb rax, al
  push rax
  pop rax
  cmp rax, 0
  je  .L.else.26
  push offset .L.data.10
  mov rax, rbp
  sub rax, 28
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.27
  mov rax, 0
  call printf
  jmp .L.end.27
.L.call.27:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.27:
  push rax
  pop rax
  jmp .L.end.26
.L.else.26:
  push offset .L.data.11
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.28
  mov rax, 0
  call printf
  jmp .L.end.28
.L.call.28:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.28:
  push rax
  pop rax
  mov rax, rsp
  and rax, 15
  jnz .L.call.29
  mov rax, 0
  call abort
  jmp .L.end.29
.L.call.29:
  sub rsp, 8
  mov rax, 0
  call abort
  add rsp, 8
.L.end.29:
  push rax
  pop rax
.L.end.26:
  mov rax, rbp
  sub rax, 16
  push rax
  push 4
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  mov rax, rbp
  sub rax, 16
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push 4
  pop rdi
  pop rax
  cmp rax, rdi
  sete al
  movzb rax, al
  push rax
  pop rax
  cmp rax, 0
  je  .L.else.30
  push offset .L.data.12
  mov rax, rbp
  sub rax, 16
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.31
  mov rax, 0
  call printf
  jmp .L.end.31
.L.call.31:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.31:
  push rax
  pop rax
  jmp .L.end.30
.L.else.30:
  push offset .L.data.13
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.32
  mov rax, 0
  call printf
  jmp .L.end.32
.L.call.32:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.32:
  push rax
  pop rax
  mov rax, rsp
  and rax, 15
  jnz .L.call.33
  mov rax, 0
  call abort
  jmp .L.end.33
.L.call.33:
  sub rsp, 8
  mov rax, 0
  call abort
  add rsp, 8
.L.end.33:
  push rax
  pop rax
.L.end.30:
  mov rax, rbp
  sub rax, 16
  push rax
  push 4
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  mov rax, rbp
  sub rax, 16
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push 4
  pop rdi
  pop rax
  cmp rax, rdi
  sete al
  movzb rax, al
  push rax
  pop rax
  cmp rax, 0
  je  .L.else.34
  push offset .L.data.14
  mov rax, rbp
  sub rax, 16
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.35
  mov rax, 0
  call printf
  jmp .L.end.35
.L.call.35:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.35:
  push rax
  pop rax
  jmp .L.end.34
.L.else.34:
  push offset .L.data.15
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.36
  mov rax, 0
  call printf
  jmp .L.end.36
.L.call.36:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.36:
  push rax
  pop rax
  mov rax, rsp
  and rax, 15
  jnz .L.call.37
  mov rax, 0
  call abort
  jmp .L.end.37
.L.call.37:
  sub rsp, 8
  mov rax, 0
  call abort
  add rsp, 8
.L.end.37:
  push rax
  pop rax
.L.end.34:
  mov rax, rbp
  sub rax, 16
  push rax
  push 4
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  mov rax, rbp
  sub rax, 16
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push 4
  pop rdi
  pop rax
  cmp rax, rdi
  sete al
  movzb rax, al
  push rax
  pop rax
  cmp rax, 0
  je  .L.else.38
  push offset .L.data.16
  mov rax, rbp
  sub rax, 16
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.39
  mov rax, 0
  call printf
  jmp .L.end.39
.L.call.39:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.39:
  push rax
  pop rax
  jmp .L.end.38
.L.else.38:
  push offset .L.data.17
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.40
  mov rax, 0
  call printf
  jmp .L.end.40
.L.call.40:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.40:
  push rax
  pop rax
  mov rax, rsp
  and rax, 15
  jnz .L.call.41
  mov rax, 0
  call abort
  jmp .L.end.41
.L.call.41:
  sub rsp, 8
  mov rax, 0
  call abort
  add rsp, 8
.L.end.41:
  push rax
  pop rax
.L.end.38:
  mov rax, rbp
  sub rax, 16
  push rax
  push 8
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  mov rax, rbp
  sub rax, 16
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push 8
  pop rdi
  pop rax
  cmp rax, rdi
  sete al
  movzb rax, al
  push rax
  pop rax
  cmp rax, 0
  je  .L.else.42
  push offset .L.data.18
  mov rax, rbp
  sub rax, 16
  push rax
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.43
  mov rax, 0
  call printf
  jmp .L.end.43
.L.call.43:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.43:
  push rax
  pop rax
  jmp .L.end.42
.L.else.42:
  push offset .L.data.19
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.44
  mov rax, 0
  call printf
  jmp .L.end.44
.L.call.44:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.44:
  push rax
  pop rax
  mov rax, rsp
  and rax, 15
  jnz .L.call.45
  mov rax, 0
  call abort
  jmp .L.end.45
.L.call.45:
  sub rsp, 8
  mov rax, 0
  call abort
  add rsp, 8
.L.end.45:
  push rax
  pop rax
.L.end.42:
  mov rax, rbp
  sub rax, 12
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
  mov rax, rbp
  sub rax, 12
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
  mov rax, rbp
  sub rax, 12
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
  push 1
  pop rdi
  pop rax
  cmp rax, rdi
  sete al
  movzb rax, al
  push rax
  pop rax
  cmp rax, 0
  je  .L.else.46
  push offset .L.data.20
  mov rax, rbp
  sub rax, 12
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
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.47
  mov rax, 0
  call printf
  jmp .L.end.47
.L.call.47:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.47:
  push rax
  pop rax
  jmp .L.end.46
.L.else.46:
  push offset .L.data.21
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.48
  mov rax, 0
  call printf
  jmp .L.end.48
.L.call.48:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.48:
  push rax
  pop rax
  mov rax, rsp
  and rax, 15
  jnz .L.call.49
  mov rax, 0
  call abort
  jmp .L.end.49
.L.call.49:
  sub rsp, 8
  mov rax, 0
  call abort
  add rsp, 8
.L.end.49:
  push rax
  pop rax
.L.end.46:
  mov rax, rbp
  sub rax, 12
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
  push 2
  pop rdi
  pop rax
  cmp rax, rdi
  sete al
  movzb rax, al
  push rax
  pop rax
  cmp rax, 0
  je  .L.else.50
  push offset .L.data.22
  mov rax, rbp
  sub rax, 12
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
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.51
  mov rax, 0
  call printf
  jmp .L.end.51
.L.call.51:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.51:
  push rax
  pop rax
  jmp .L.end.50
.L.else.50:
  push offset .L.data.23
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.52
  mov rax, 0
  call printf
  jmp .L.end.52
.L.call.52:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.52:
  push rax
  pop rax
  mov rax, rsp
  and rax, 15
  jnz .L.call.53
  mov rax, 0
  call abort
  jmp .L.end.53
.L.call.53:
  sub rsp, 8
  mov rax, 0
  call abort
  add rsp, 8
.L.end.53:
  push rax
  pop rax
.L.end.50:
  push offset x
  push 5
  pop rdi
  pop rax
  mov [rax], edi
  push rdi
  push offset x
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  push 5
  pop rdi
  pop rax
  cmp rax, rdi
  sete al
  movzb rax, al
  push rax
  pop rax
  cmp rax, 0
  je  .L.else.54
  push offset .L.data.24
  push offset x
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.55
  mov rax, 0
  call printf
  jmp .L.end.55
.L.call.55:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.55:
  push rax
  pop rax
  jmp .L.end.54
.L.else.54:
  push offset .L.data.25
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.56
  mov rax, 0
  call printf
  jmp .L.end.56
.L.call.56:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.56:
  push rax
  pop rax
  mov rax, rsp
  and rax, 15
  jnz .L.call.57
  mov rax, 0
  call abort
  jmp .L.end.57
.L.call.57:
  sub rsp, 8
  mov rax, 0
  call abort
  add rsp, 8
.L.end.57:
  push rax
  pop rax
.L.end.54:
  mov rax, rbp
  sub rax, 2
  push rax
  push 0
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  push 1
  pop rdi
  pop rax
  mov [rax], dil
  push rdi
  mov rax, rbp
  sub rax, 2
  push rax
  push 1
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  push 2
  pop rdi
  pop rax
  mov [rax], dil
  push rdi
  push offset .L.data.26
  mov rax, rbp
  sub rax, 2
  push rax
  push 0
  pop rdi
  pop rax
  imul rdi, 1
  add rax, rdi
  push rax
  pop rax
  movsx rax, byte ptr [rax]
  push rax
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.58
  mov rax, 0
  call printf
  jmp .L.end.58
.L.call.58:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.58:
  push rax
  push offset .L.data.27
  push offset y
  pop rax
  movsxd rax, dword ptr [rax]
  push rax
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.59
  mov rax, 0
  call printf
  jmp .L.end.59
.L.call.59:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.59:
  push rax
  push offset .L.data.28
  push offset z
  push offset zz
  pop rdx
  pop rsi
  pop rdi
  mov rax, rsp
  and rax, 15
  jnz .L.call.60
  mov rax, 0
  call printf
  jmp .L.end.60
.L.call.60:
  sub rsp, 8
  mov rax, 0
  call printf
  add rsp, 8
.L.end.60:
  push rax
  push 0
  pop rax
  jmp .L.return.main
.L.return.main:
  mov rsp, rbp
  pop rbp
  ret
