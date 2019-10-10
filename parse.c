#include "9cc.h"

//
//Tokenizer
//

//input program
//char* user_input;

/*current token*/
//Token *token;

/*エラーを報告するための関数*/
/*prnitfと同じ引数を取る*/
void error(char *fmt, ...){
  va_list ap;
  va_start(ap, fmt);
  vfprintf(stderr, fmt, ap);
  fprintf(stderr, "\n");
  exit(1);
}

// Reports an error location and exit.
void error_at(char *loc, char *fmt, ...){
  va_list ap;
  va_start(ap, fmt);

  int pos = loc - user_input;
  fprintf(stderr, "%s\n", user_input);
  fprintf(stderr, "%*s", pos, ""); // print pos spaces.
  fprintf(stderr, "^ ");
  vfprintf(stderr, fmt, ap);
  fprintf(stderr, "\n");
  exit(1);
}

//次のトークンが期待している記号のときには、トークンを一つ読み進めて
//真を返す。それ以外の場合は、偽を返す
bool consume(char* op){
  if(token->kind != TK_RESERVED
     || strlen(op) != token->len
     || memcmp(token->str, op, token->len))
    {
      return false;
    }
  token = token->next;
  return true;
}

//次のトークンが期待している記号のときには、トークンを一つ読み進める。
//それ以外の場合には、エラーを報告する
void expect(char* op){
  if (token->kind != TK_RESERVED
      || strlen(op) != token->len
      || memcmp(token->str, op, token->len)){
    //error("'%c'ではありません", op);
    error_at(token->str, "expected '%c'", op);
  }
  token = token->next;
}

//次のトークンが数値の場合、トークンを一つ読み進めて、その数値を返す。
//それ以外の場合には、エラーを報告する
int expect_number(){
  if (token->kind != TK_NUM){
    /*error("数ではありません");*/
    error_at(token->str, "expected a number");
  }
  int val = token->val;
  token = token->next;
  return val;
}

bool at_eof(){
  return token->kind == TK_EOF;
}

/*新しいトークンを作成してcurにつなげる*/
Token* new_token(TokenKind kind, Token *cur, char *str, int len){
  Token *tok = calloc(1, sizeof(Token));
  tok->kind = kind;
  tok->str = str;
  tok->len = len;
  cur->next = tok;
  return tok;
}

bool startswith(char* p, char* q){
  return (memcmp(p, q, strlen(q)) == 0);
}

/*入力文字列pをトークナイズしてそれを返す*/
Token* tokenize(){
  char* p = user_input;
  Token head;
  head.next = NULL;
  Token *cur = &head;

  while (*p) {
    //空白文字をスキップ
    if (isspace(*p)) {
      p++;
      continue;
    }

    //複数文字を区切る
    //multi-letter
    if(startswith(p, "==") || startswith(p, "!=") ||
       startswith(p, "<=") || startswith(p, ">=")){
      cur = new_token(TK_RESERVED, cur, p, 2);
      p += 2;
      continue;
    } //if multi-letter

    //一つの文字を区切る
    //single-letter
    if (strchr("+-*/()<>", *p)){
      cur = new_token(TK_RESERVED, cur, p++, 1);
      continue;
    } //if single-letter

    //整数
    //integer literal
    if (isdigit(*p)){
      cur = new_token(TK_NUM, cur, p, 0);
      char* q = p;
      cur->val = strtol(p, &p, 10);
      cur->len = p - q;
      continue;
    } //if integer

    /*error("invalid token");*/
    error_at(p, "invalid token");
  } //while()

  new_token(TK_EOF, cur, p, 0);
  return head.next;
}


//
//parser
//

Node* new_node(NodeKind kind){
  Node *node = calloc(1, sizeof(Node));
  node->kind = kind;
  return node;
}

Node* new_binary(NodeKind kind, Node* lhs, Node* rhs){
  Node *node = new_node(kind);
  node->lhs = lhs;
  node->rhs = rhs;
  return node;
}

Node* new_num(int val){
  Node *node = new_node(ND_NUM);
  node->val = val;
  return node;
}

/*Node* expr();
Node* equality();
Node* relational();
Node* add();
Node* mul();
Node* unary();
Node* primary();*/

// expr = equality
Node *expr() {
  return equality();
}


//equality = relational ("==" relational | "!=" relational)*
Node* equality(){
  Node* node = relational();

  for(;;){
    if(consume("==")){
      node = new_binary(ND_EQ, node, relational());
    } else if(consume("!=")){
      node = new_binary(ND_NE, node, relational());
    } else {
      return node;
    } //if
  } //for
} //equality()


//relational = add ("<" add | "<=" add | ">" add | ">=" add)*
Node* relational(){
  Node* node = add();

  for(;;){
    if(consume("<")){
      node = new_binary(ND_LT, node, add());
    } else if(consume("<=")){
      node = new_binary(ND_LE, node, add());
    } else if(consume(">")){
      node = new_binary(ND_LT, add(), node);
    } else if(consume(">=")){
      node = new_binary(ND_LE, add(), node);
    } else {
      return node;
    }
  } //for
  
} //relational()


//add = mul ("+" mul | "-" mul)*
Node* add(){
  Node* node = mul();

  for(;;){
    if(consume("+")){
      node = new_binary(ND_ADD, node, mul());
    } else if(consume("-")){
      node = new_binary(ND_SUB, node, mul());
    } else {
      return node;
    } //if
  } //for
  
} //add()

// mul = unary ("*" unary | "/" unary)*
Node *mul() {
  Node *node = unary();

  for (;;) {
    if (consume("*")){
      node = new_binary(ND_MUL, node, unary());
    }else if (consume("/")){
      node = new_binary(ND_DIV, node, unary());
    } else {
      return node;
    } //if
  } //for
} //mul()

//unary = ("+" | "-")? unary
//        | primary
Node* unary(){
  if(consume("+")){
    return unary();
  }
  if(consume("-")){
    return new_binary(ND_SUB, new_num(0), unary());
  }
  return primary();

} //urary()


// primary = "(" expr ")" | num
Node *primary() {
  if (consume("(")) {
    Node *node = expr();
    expect(")");
    return node;
  } //if

  return new_num(expect_number());
} //primary()
