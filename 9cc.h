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
void expect(char* op);
int expect_number();
bool at_eof();
Token* new_token(TokenKind kind, Token *cur, char *str, int len);
bool startswith(char* p, char* q);
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
} NodeKind;

// AST node type
typedef struct Node Node;
struct Node {
  NodeKind kind; // Node kind
  Node *lhs;     // Left-hand side
  Node *rhs;     // Right-hand side
  int val;       // Used if kind == ND_NUM
};

Node* new_node(NodeKind kind);
Node* new_binary(NodeKind kind, Node* lhs, Node* rhs);
Node* new_num(int val);
Node* expr();
Node* equality();
Node* relational();
Node* add();
Node* mul();
Node* unary();
Node* primary();


//
//code generator
//
void gen(Node *node);




#endif
