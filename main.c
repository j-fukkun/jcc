#include "jcc.h"

//input program
char* user_input;

//current token
Token *token;

//input filename
char* filename;

char* read_file(char* path) {
  // Open and read the file.
  FILE* fp = fopen(path, "r");
  if(!fp){
    error("cannot open %s: %s", path, strerror(errno));
  }

  int filemax = 10 * 1024 * 1024;
  char* buf = malloc(filemax);
  int size = fread(buf, 1, filemax - 2, fp);
  if(!feof(fp)){
    error("%s: file too large");
  }

  // Make sure that the string ends with "\n\0".
  if(size == 0 || buf[size - 1] != '\n'){
    buf[size++] = '\n';
  }
  buf[size] = '\0';
  return buf;
} //read_file()

int main(int argc, char **argv){
  if(argc != 2){
    error("%s: invalid number of argument", argv[0]);
    //return 1;
  }

  //tokenize and parse
  filename = argv[1];
  user_input = read_file(filename);
  token = tokenize();
  Program* prog = program();

  //スタックサイズを計算
  Function* fn = prog->fns;
  for(fn; fn; fn = fn->next){
    //printf("function name = %s", fn->name);
    //fflush(stdout);
    int offset = fn->has_varargs ? 56 : 0;
    //Var* lvar = fn->locals;
    
    Var* param = fn->params;
    for(param; param; param = param->next){
      offset = align_to(offset, param->type->align);
      offset += param->type->size;
      param->offset = offset;
    } //for param
    
    Var* lvar = fn->locals;
    for(lvar; lvar; lvar = lvar->next){
      offset = align_to(offset, lvar->type->align);
      offset += lvar->type->size;
      lvar->offset = offset;
    } //for
    fn->stack_size = align_to(offset, 8); //offset;
  } //for

  //printf("test3");
  //fflush(stdout);
  //emit assembly code
  codegen(prog);
  
  return 0;
} //main
