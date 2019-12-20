#include "9cc.h"

//input program
char* user_input;

//current token
Token *token;

int main(int argc, char **argv){
  if(argc != 2){
    error("%s: invalid number of argument", argv[0]);
    //return 1;
  }

  /*tokenize*/
  user_input = argv[1];
  token = tokenize();
  Program* prog = program();


  //スタックサイズを計算
  Function* fn = prog->fns;
  for(fn; fn; fn = fn->next){
    int offset = 0;
    Var* lvar = fn->locals;
    for(lvar; lvar; lvar = lvar->next){
      //offset = align_to(offset, lvar->type->align);
      offset += lvar->type->size;
      lvar->offset = offset;
    } //for
    fn->stack_size = offset;
  } //for

  //emit assembly code
  codegen(prog);
  
  return 0;
} //main
