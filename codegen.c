#include "9cc.h"

//
// code generator
//

static int labelseq = 1;

void gen_lval(Node* node){
  if(node->kind != ND_LVAR){
    error("代入の左辺値が変数ではありません");
  }

  printf("  mov rax, rbp\n");
  printf("  sub rax, %d\n", node->offset);
  printf("  push rax\n");
  
} //gen_lval()

void gen(Node* node){
    
  switch(node->kind) {
  case ND_NUM:
    printf("  push %d\n", node->val);
    return;
  case ND_LVAR:
    gen_lval(node);
    printf("  pop rax\n");
    printf("  mov rax, [rax]\n");
    printf("  push rax\n");;
    return;
  case ND_ASSIGN:
    gen_lval(node->lhs);
    gen(node->rhs);

    printf("  pop rdi\n");
    printf("  pop rax\n");
    printf("  mov [rax], rdi\n");
    printf("  push rdi\n");
    return;
  case ND_RETURN:
    if(node->lhs){
      gen(node->lhs);
      printf("  pop rax\n");
    } //if
    printf("  mov rsp, rbp\n");
    printf("  pop rbp\n");
    printf("  ret\n");
    return;
  case ND_IF: {
    int seq = labelseq++;
    if(node->els){
      //"if" (cond) stmt "else" stmtのとき
      gen(node->cond);
      printf("  pop rax\n"); //スタックトップの計算結果をraxにpop
      printf("  cmp rax, 0\n");
      printf("  je  .L.else.%d\n", seq);
      gen(node->then);
      printf("  jmp .L.end.%d\n", seq);
      printf(".L.else.%d:\n", seq);
      gen(node->els);
      printf(".L.end.%d:\n", seq);
    } else {
      //"if" (cond) stmtのとき
      gen(node->cond);
      printf("  pop rax\n"); //スタックトップの計算結果をraxにpop
      printf("  cmp rax, 0\n");
      printf("  je  .L.end.%d\n",seq);
      gen(node->then);
      printf(".L.end.%d:\n",seq);
    } //if
    return;
  } //case ND_IF
  case ND_WHILE: {
    int seq = labelseq++;
    printf(".L.begin.%d:\n", seq);
    gen(node->cond);
    printf("  pop rax\n"); //スタックトップの計算結果をraxにpop
    printf("  cmp rax, 0\n");
    printf("  je  .L.end.%d\n", seq);
    gen(node->then);
    printf("  jmp .L.begin.%d\n", seq);
    printf(".L.end.%d:\n", seq);
    return;
  } //case ND_WHILE
  case ND_FOR: {
    int seq = labelseq++;
    if(node->init){
      gen(node->init);
    } //if
    printf(".L.begin.%d:\n", seq);
    if(node->cond){
      gen(node->cond);
      printf("  pop rax\n");
      printf("  cmp rax, 0\n");
      printf("  je  .L.end.%d\n", seq);
    } //if
    
    gen(node->then);
    
    if(node->inc){
      gen(node->inc);
    } //if
    printf("  jmp .L.begin.%d\n", seq);
    printf(".L.end.%d:\n", seq);
    return;
  } //case ND_FOR

  case ND_BLOCK: {
    Node* n = node->body;

    while(n){
      gen(n);
      printf("  pop rax\n");
      n = n->next;
    } //while
    return;
  } //case ND_BLOCK
    
  }  //switch

  gen(node->lhs);
  gen(node->rhs);
  

  printf("  pop rdi\n");
  printf("  pop rax\n");

  switch(node->kind){
  case ND_ADD:
    printf("  add rax, rdi\n");
    break;
  case ND_SUB:
    printf("  sub rax, rdi\n");
    break;
  case ND_MUL:
    printf("  imul rax, rdi\n");
    break;
  case ND_DIV:
    printf("  cqo\n");
    printf("  idiv rdi\n");
    break;
  case ND_EQ:
    printf("  cmp rax, rdi\n");
    printf("  sete al\n");
    printf("  movzb rax, al\n");
    break;
  case ND_NE:
    printf("  cmp rax, rdi\n");
    printf("  setne al\n");
    printf("  movzb rax, al\n");
    break;
  case ND_LT:
    printf("  cmp rax, rdi\n");
    printf("  setl al\n");
    printf("  movzb rax, al\n");
    break;
  case ND_LE:
    printf("  cmp rax, rdi\n");
    printf("  setle al\n");
    printf("  movzb rax, al\n");
    break;
  } //switch(node->kind)

  printf("  push rax\n");
} //gen()
