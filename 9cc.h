#ifndef NINE_CC_H
#define NINE_CC_H

#include <ctype.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//
//tokenizer
//

// token type
typedef enum{
  TK_RESERVED, //記号
  TK_IDENT, //識別子
  TK_NUM, //整数
  TK_EOF, //入力の終わりを表すトークン
} TokenKind;


typedef struct Token Token;
//token type
struct Token{
  TokenKind kind; //トークンの型
  Token *next; //次の入力トークン
  int val; //kindがTK_NUMの場合、その数値
  char *str; //トークン文字列
  int len; //トークンの長さ
};

//input program
extern char* user_input;

/*current token*/
extern Token *token;

void error(char *fmt, ...);
void error_at(char *loc, char *fmt, ...);
bool consume(char* op);
Token* consume_ident();
void expect(char* op);
int expect_number();
char* expect_ident();
Token* peek(char* s);
bool at_eof();
Token* new_token(TokenKind kind, Token *cur, char *str, int len);
bool is_alphabet(char c);
bool is_alphabet_or_number(char c);
bool startswith(char* p, char* q);
char* startswith_reserved(char* p);
Token* tokenize();


//
//parser
//

typedef enum {
  ND_ADD, // +
  ND_SUB, // -
  ND_MUL, // *
  ND_DIV, // /
  ND_EQ, //==
  ND_NE, //!=
  ND_LT, //<
  ND_LE, //<=
  ND_NUM, // Integer
  ND_ASSIGN, //assignment
  ND_LVAR, //local variant
  ND_RETURN, //return
  ND_IF, //if
  ND_WHILE, //while
  ND_FOR, //for
  ND_BLOCK, //block { ... }
  ND_FUNCALL, //function call
  ND_DEREF, //dereferrence *
  ND_ADDR, //address &
  ND_PTR_ADD, //pointer add
  ND_PTR_SUB, //pointer sub
  ND_PTR_DIFF, //pointer difference
  ND_NULL, //コード生成しない
} NodeKind;

typedef struct Type Type;

typedef struct LVar LVar;
//type for local variable
struct LVar{
  LVar* next; //次の変数 or NULL
  char* name; //変数の名前
  int len; //変数名の長さ
  int offset; //RBPからのオフセット
  Type* type;
};

// AST node type
typedef struct Node Node;
struct Node {
  NodeKind kind; // Node kind
  Node* lhs;     // Left-hand side
  Node* rhs;     // Right-hand side
  int val;       // Used if kind == ND_NUM
  //int offset;    // Used if kind == ND_LVAR

  //"if","while","for"
  Node* cond;
  Node* then;
  Node* els;
  Node* init; //for
  Node* inc; //for

  //block
  Node* body; 
  Node* next;

  //function call
  char* funcname; //function name
  Node* args; //関数呼び出しのときの引数

  LVar* lvar; // Used if kind == ND_LVAR

  Type* type; //Type
};


typedef struct Function Function;
struct Function{
  Function* next;
  char* name;
  LVar* params;

  Node* node; //function body
  LVar* locals; //local variables in function
  int stack_size;
};

typedef struct Program Program;
struct Program{
  Function* fns;
};


extern LVar* locals;

Node* new_node(NodeKind kind);
Node* new_binary(NodeKind kind, Node* lhs, Node* rhs);
Node* new_num(int val);
Node* stmt();
Node* stmt2();
Node* expr();
Node* assign();
Node* equality();
Node* relational();
Node* add();
Node* mul();
Node* unary();
Node* primary();
Program* program();
Function* function();

//
//type.c
//

extern Type* int_type;

typedef enum{
  TY_INT,
  TY_PTR,
} TypeKind;

struct Type{
  TypeKind kind;
  int size;      //sizeof()
  int align;
  Type* base;    //pointer
};

bool is_integer(Type* t);
Type* pointer_to(Type* base);
int align_to(int n, int align);
void add_type(Node* node);


//
//code generator
//
void codegen(Program* prog);




#endif
