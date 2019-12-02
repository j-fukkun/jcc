#include "9cc.h"

//
// code generator
//

//ラベルの番号
static int labelseq = 1;

//関数呼び出しの引数の順番
static char* argreg8[] = {"rdi", "rsi", "rdx", "rcx", "r8", "r9"};

//現在の関数名
static char* funcname;


void gen_lval(Node* node){
  if(node->kind != ND_LVAR){
    error("代入の左辺値が変数ではありません");
  }
  //nodeが表す変数のアドレスを計算し、スタックにプッシュ
  printf("  mov rax, rbp\n");
  printf("  sub rax, %d\n", node->lvar->offset);
  printf("  push rax\n");
  
} //gen_lval()

void gen(Node* node){
    
  switch(node->kind) {
  case ND_NULL:
    return;
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
    printf("  jmp .L.return.%s\n", funcname);
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
      
      //gen(n)では、スタックトップに１つ値を残す
      //それを毎回popした方が良い?
      printf("  pop rax\n");
      n = n->next;
    } //while
    return;
  } //case ND_BLOCK

  case ND_FUNCALL: {
    //関数呼び出しする前に、RSPが16の倍数でなければならない

    int num_args = 0;
    Node* arg = node->args;
    for(arg; arg; arg = arg->next){
      gen(arg);
      num_args++;
    } //for

    int i = num_args - 1;
    for(i; i >= 0; i--){
      //ABIの規定通りに、引数をレジスタに格納する
      //6個より多い引数は、サポートしていない
      printf("  pop %s\n", argreg8[i]);
    } //for
    
    int seq = labelseq++;
    printf("  mov rax, rsp\n");
    printf("  and rax, 15\n"); //15(1111)とand演算
    //16は(0001 0000)なので、15とand演算すると、0になる
    //演算結果が0のとき、ZFには1がセットされる
    printf("  jnz .L.call.%d\n", seq); //ZF(Zero Flag) = 0のときにjump
    printf("  mov rax, 0\n");
    printf("  call %s\n", node->funcname);
    printf("  jmp .L.end.%d\n", seq);
    printf(".L.call.%d:\n", seq); //RSPが16の倍数ではないとき
    printf("  sub rsp, 8\n");
    printf("  mov rax, 0\n");
    printf("  call %s\n", node->funcname);
    printf("  add rsp, 8\n");
    printf(".L.end.%d:\n", seq);
    printf("  push rax\n");
    return;
  } //case ND_FUNCALL

  case ND_ADDR: { //address &
    gen_lval(node->lhs);
    return;
  } //case ND_ADDR

  case ND_DEREF: { //dereferrence *
    gen(node->lhs);
    //node->lhsの結果がスタックトップにあるはずなので
    //raxにpop
    printf("  pop rax\n");
    printf("  mov rax, [rax]\n"); //raxが指すアドレスから値をロード
    printf("  push rax\n");
    return;
  } //case ND_DEREF
    
    
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

void emit_text(Program* prog){

  printf(".text\n");

  Function* fn = prog->fns;
  for(fn; fn; fn = fn->next){
    printf(".global %s\n", fn->name);
    printf("%s:\n", fn->name);
    funcname = fn->name;

    //プロローグ
    printf("  push rbp\n");
    printf("  mov rbp, rsp\n");
    printf("  sub rsp, %d\n", fn->stack_size);

    //関数の引数をスタック領域に格納
    int i = 0;
    LVar* lvar = fn->params;
    for(lvar; lvar; lvar = lvar->next){
      printf("  mov [rbp-%d], %s\n", lvar->offset, argreg8[i]);
      i++;
    } //for

    //generate code from AST
    Node* n = fn->node;
    for(n; n; n = n->next){
      gen(n);
    } //for

    //エピローグ
    printf(".L.return.%s:\n", funcname);
    printf("  mov rsp, rbp\n");
    printf("  pop rbp\n");
    printf("  ret\n");
    
  } //for fn
  

} //emit_text()


void codegen(Program* prog){

  printf(".intel_syntax noprefix\n");

  emit_text(prog);

} //codegen()
