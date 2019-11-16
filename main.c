#include "9cc.h"

//input program
char* user_input;

/*current token*/
Token *token;

Node* code[100];

int main(int argc, char **argv){
  if(argc != 2){
    error("%s: invalid number of argument", argv[0]);
    //return 1;
  }

  /*tokenize*/
  user_input = argv[1];
  token = tokenize();
  //Node* node = expr();
  program();
  
  /*アセンブリの前半部分を出力*/
  printf(".intel_syntax noprefix\n");
  printf(".global main\n");
  printf("main:\n");

  //プロローグ
  //変数26個文の領域を確保する
  printf("  push rbp\n");;
  printf("  mov rbp, rsp\n");
  printf("  sub rsp, 208\n");

  int i = 0;
  for(i = 0; code[i]; i++){
    gen(code[i]);

    //式の評価結果としてスタックに一つの値が残っているはず
    //スタックが溢れないように、ポップしておく
    printf("  pop rax\n");
  } //for

  //エピローグ
  //最後の式の結果がRAXに残っているので、それが返り値になる
  printf("  mov rsp, rbp\n");
  printf("  pop rbp\n");
  printf("  ret\n");

  //printf("  pop rax\n");
  //printf("  ret\n");
  return 0;

} //main
