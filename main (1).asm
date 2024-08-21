; Equipe 05
; Guilherme Rocha Ribeiro, Jean Anderson Hugo Jesus Santos, Vilomar Gomes de Cerqueira Neto
bits 64

global main
extern printf, scanf 


section .bss
n    resb    1

section .data

fmt db " %d",0
fmtSaida db " %d->",0
mudou db "mudou fluxo ",0
msgPar db "par",0
msgImpar db "Impar",0

msg: db "Digite um numero",10,0
impri db "novo n: %d"
seq db 10,"Sequencia de collatz",10,0


section .text

  main:
  push rbp
  mov rbp, rsp

  mov rdi, msg
  mov rax, 0
  call printf


  mov rdi, fmt
  mov rsi, n
  mov rax,0
  call scanf

  ;imprimindo mensagem frequencia
  mov rdi, seq
  mov rax, 0
  call printf

  collatz:

 ;verifica se n eh 1
  mov eax, [n]
  cmp eax, 1
  je fim

 ;verifica se n eh 0
  mov eax, [n]
  cmp eax, 0
  je fim0

  ;printar atual 
  mov rdi, fmtSaida
  mov rsi, [n]
  mov rax, 0
  call printf

  mov eax, [n]

  ;verificar se eh par
  test eax, 1 
  jz casoPar

 ;jmp fim

  casoImpar:
  ; multiplica por 3 e soma 1
  mov rax, [n]
  imul rax, 3
  add rax, 1
  mov [n], rax
  jmp collatz

  casoPar:

  ; div por 2
  mov eax,[n]
  shr eax, 1 ; 
  mov [n], eax

  jmp collatz

  fim:

  mov rdi, fmt
  mov rsi, [n]
  mov rax, 0
  call printf

  fim0:

  leave
  mov rax,0
  ret