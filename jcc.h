#ifndef JCC_H
#define JCC_H

#include <ctype.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <errno.h>
#include <limits.h>

//
//tokenizer
//

// token type
typedef enum{
  TK_RESERVED, //記号
  TK_IDENT, //識別子
  TK_NUM, //整数
  TK_STR, //文字列
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

  char* strings; //string literal including '\0'
  int str_len; //string literal length
};

//input program
extern char* user_input;

//current token
extern Token* token;

//input filename
extern char* filename;

void error(char *fmt, ...);
void verror_at(char *loc, char *fmt, va_list ap);
void error_at(char *loc, char *fmt, ...);
void error_tok(Token *tok, char *fmt, ...);
void warn_tok(Token *tok, char *fmt, ...);
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
  ND_VAR, //local/global variant
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
  ND_EXPR_STMT,
  ND_PRE_INC, //++a
  ND_PRE_DEC, //--a
  ND_POST_INC, //a++
  ND_POST_DEC, //a--
  ND_NULL, //コード生成しない
} NodeKind;

typedef struct Type Type;
typedef struct Initializer Initializer;

typedef struct Var Var;
//type for local/global variable
struct Var{
  Var* next; //次の変数 or NULL
  char* name; //変数の名前
  int len; //変数名の長さ
  Type* type;
  bool is_local; //if true then local else global
  bool is_literal; //if true then string literal

  //for local variable
  int offset; //RBPからのオフセット

  //for global variable (string literal)
  char* literal;
  Initializer* initializer;
};

// AST node type
typedef struct Node Node;
struct Node {
  NodeKind kind; // Node kind
  Node* lhs;     // Left-hand side
  Node* rhs;     // Right-hand side
  int val;       // Used if kind == ND_NUM

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

  Var* var; // Used if kind == ND_VAR

  Type* type; //Type
};

struct Initializer{
  Initializer* next;

  //constant expression
  int sz;
  int val;
};

typedef struct Designator Designator;
struct Designator{
  Designator* next;
  int index; //for array
};


typedef struct Function Function;
struct Function{
  Function* next;
  char* name;
  Var* params;

  Node* node; //function body
  Var* locals; //local variables in function
  int stack_size;
  bool has_varargs; //if true then has "..."
};

typedef struct Program Program;
struct Program{
  Function* fns;
  Var* globals;
};


//extern LVar* locals;

Node* new_node(NodeKind kind);
Node* new_binary(NodeKind kind, Node* lhs, Node* rhs);
Node* new_num(int val);
Type* type_suffix(Type* type);
int const_expr();
int eval(Node* node);
Node* stmt();
Node* stmt2();
Node* expr();
Node* assign();
Node* equality();
Node* relational();
Node* new_add(Node* lhs, Node* rhs);
Node* add();
Node* mul();
Node* unary();
Node* postfix();
Node* primary();
Program* program();
Function* function();

//
//type.c
//

extern Type* int_type;
extern Type* char_type;
extern Type* void_type;

typedef enum{
  TY_INT,
  TY_CHAR,
  TY_VOID,
  TY_PTR,
  TY_ARRAY,
} TypeKind;

struct Type{
  TypeKind kind;
  int size;      //sizeof()
  int align;
  Type* base;    //pointer
  int array_size; //size of array
  bool is_incomplete; //index is omitted?
};

bool is_integer(Type* t);
Type* pointer_to(Type* base);
Type* array_of(Type* base, int size);
int align_to(int n, int align);
void add_type(Node* node);


//
//code generator
//
void codegen(Program* prog);




#endif
