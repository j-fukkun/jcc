#include "9cc.h"

//input program
char* user_input;

/*current token*/
Token *token;

int main(int argc, char **argv){
  if(argc != 2){
    error("%s: invalid number of argument", argv[0]);
    //return 1;
  }

  /*tokenize*/
  user_input = argv[1];
  token = tokenize();
  Node* node = expr();

  /*アセンブリの前半部分を出力*/
  printf(".intel_syntax noprefix\n");
  printf(".global main\n");
  printf("main:\n");

  gen(node);

  printf("  pop rax\n");
  printf("  ret\n");
  return 0;

} //main
