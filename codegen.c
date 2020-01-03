#include "9cc.h"

//
// code generator
//

//ラベルの番号
static int labelseq = 1;

static char* argreg1[] = {"dil", "sil", "dl", "cl", "r8b", "r9b"};
static char* argreg4[] = {"edi", "esi", "edx", "ecx", "r8d", "r9d"};

//関数呼び出しの引数の順番
static char* argreg8[] = {"rdi", "rsi", "rdx", "rcx", "r8", "r9"};

//現在の関数名
static char* funcname;

void gen(Node* node);


void gen_address(Node* node){

  switch(node->kind){
  case ND_VAR:{
    Var* var = node->var;

    if(var->is_local){
      printf("  mov rax, rbp\n");
      printf("  sub rax, %d\n", node->var->offset);
      printf("  push rax\n");
    } else {
      printf("  push offset %s\n", var->name);
    } //if
    return;
  }
  case ND_DEREF:
    gen(node->lhs);
    return;
  } //switch

  error("not an left value");
  
} //gen_address()

void gen_lval(Node* node){
  
  if(node->type->kind == TY_ARRAY){
    error("not a lvalue");
  }
  gen_address(node);

} //gen_lval()

void load(Type* t){
  printf("  pop rax\n");
  
  //型のサイズによって処理を分ける必要がある
  if(t->size == 1){
    printf("  movsx rax, byte ptr [rax]\n");
  } else if(t->size == 4){
    printf("  movsxd rax, dword ptr [rax]\n");
  } else {
    assert(t->size == 8);
    printf("  mov rax, [rax]\n");
  } //if
  
  printf("  push rax\n");
} //load()

void store(Type* t){
  printf("  pop rdi\n");
  printf("  pop rax\n");

  //型のサイズによって処理を分ける必要がある
  if(t->size == 1){
    printf("  mov [rax], dil\n");
  } else if(t->size == 4){
    printf("  mov [rax], edi\n");
  } else {
    assert(t->size == 8);
    printf("  mov [rax], rdi\n");
  } //if
  
  printf("  push rdi\n");
} //store()

void gen(Node* node){
    
  switch(node->kind) {
  case ND_NULL:
    return;
  case ND_NUM:
    printf("  push %d\n", node->val);
    return;
  case ND_EXPR_STMT:
    gen(node->lhs);
    printf("  add rsp, 8\n"); //is this necessary?
    return;
  case ND_VAR:
    gen_address(node);
    //配列はアドレスを計算するだけで良い
    if(node->type->kind != TY_ARRAY){
      load(node->type);
    }
    return;
  case ND_ASSIGN:
    gen_lval(node->lhs);
    gen(node->rhs);
    store(node->type);
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
    //rax is set to 0 for variadic function
    printf("  mov rax, 0\n");
    printf("  call %s\n", node->funcname);
    printf("  add rsp, 8\n");
    printf(".L.end.%d:\n", seq);
    printf("  push rax\n");
    return;
  } //case ND_FUNCALL

  case ND_ADDR: { //address &
    gen_address(node->lhs);
    return;
  } //case ND_ADDR

  case ND_DEREF: { //dereferrence *
    gen(node->lhs);
    //配列はloadしない
    if(node->type->kind != TY_ARRAY){
      load(node->type);
    }
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
  case ND_PTR_ADD:
    printf("  imul rdi, %d\n", node->type->base->size);
    printf("  add rax, rdi\n");
    break;
  case ND_SUB:
    printf("  sub rax, rdi\n");
    break;
  case ND_PTR_SUB:
    printf("  imul rdi, %d\n", node->type->base->size);
    printf("  sub rax, rdi\n");
    break;
  case ND_PTR_DIFF:
    printf("  sub rax, rdi\n");
    printf("  cqo\n");
    printf("  mov rdi, %d\n", node->type->base->size);
    printf("  idiv rdi\n");
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

void emit_data(Program* prog){

  printf(".bss\n");

  Var* gvar = prog->globals;
  for(gvar; gvar; gvar = gvar->next){
    if(gvar->is_literal || gvar->initializer){
      continue;
    }
    printf(".align %d\n", gvar->type->align);
    printf("%s:\n", gvar->name);
    printf("  .zero %d\n", gvar->type->size);
  } //for

  printf(".data\n");

  gvar = prog->globals;
  for(gvar; gvar; gvar = gvar->next){
    if(gvar->is_literal){
      printf(".align %d\n", gvar->type->align);
      printf("%s:\n", gvar->name);
      printf("  .string \"%s\"\n", gvar->literal);
    } //if

    if(gvar->initializer){
      printf(".align %d\n", gvar->type->align);
      printf("%s:\n", gvar->name);

      Initializer* init = gvar->initializer;
      for(init; init; init = init->next){
	if(init->sz == 1){
	  printf("  .byte %d\n", init->val);
	} else {
	  printf("  .%dbyte %d\n", init->sz, init->val);
	}
      } //for
    } //if
  } //for

} //emit_data()

void load_arg(Var* lvar, int index){

  int size = lvar->type->size;
  if(size == 1){
    printf("  mov [rbp-%d], %s\n", lvar->offset, argreg1[index]);
  } else if(size == 4){
    printf("  mov [rbp-%d], %s\n", lvar->offset, argreg4[index]);
  } else {
    assert(size == 8);
    printf("  mov [rbp-%d], %s\n", lvar->offset, argreg8[index]);
  }
  
} //load_arg()

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

    if(fn->has_varargs){
      int n = 0;
      Var* lvar = fn->params;
      for(lvar; lvar; lvar = lvar->next){
	n++;
      } //for

      printf("mov dword ptr [rbp-8], %d\n", n * 8);
      printf("mov [rbp-16], r9\n");
      printf("mov [rbp-24], r8\n");
      printf("mov [rbp-32], rcx\n");
      printf("mov [rbp-40], rdx\n");
      printf("mov [rbp-48], rsi\n");
      printf("mov [rbp-56], rdi\n");
    } //if(fn->has_varargs)

    //関数の引数をスタック領域に格納
    int i = 0;
    Var* lvar = fn->params;
    for(lvar; lvar; lvar = lvar->next){
      //printf("  mov [rbp-%d], %s\n", lvar->offset, argreg8[i]);
      load_arg(lvar, i);
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
  emit_data(prog);
  emit_text(prog);

} //codegen()
