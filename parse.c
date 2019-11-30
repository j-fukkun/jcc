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
} //consume()


Token* consume_ident(){
  if(token->kind != TK_IDENT){
    return NULL;
  } //if
  Token* t = token;
  token = token->next;
  return t;
} //consume_ident()


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

char* expect_ident(){
  if(token->kind != TK_IDENT){
    error_at(token->str, "expented an identifier");
  } //if
  char* s = strndup(token->str, token->len);
  token = token->next;
  return s;
} //expect_ident()


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

bool is_alphabet(char c){
  return ('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_';
} //is_alphabet()

bool is_alphabet_or_number(char c){
  return is_alphabet(c) || ('0' <= c && c <= '9');
} //is_alphabet_or_number()

bool startswith(char* p, char* q){
  return (memcmp(p, q, strlen(q)) == 0);
}

char* startswith_reserved(char* p){
  //keyword
  char* kw[] = {"return","if","else","while","for",
                "int","char","short","long","void",
		"break","continue","switch","case","goto",
                "default","do"};
  int i = 0;
  for(i = 0; i < sizeof(kw) / sizeof(*kw); i++){
    int len = strlen(kw[i]);
    if(startswith(p, kw[i]) && !is_alphabet_or_number(p[len])){
      return kw[i];
    } //if
  } //for
  return NULL;
  
} //startswith_reserved()

/*入力文字列pをトークナイズしてそれを返す*/
Token* tokenize(){
  char* p = user_input;
  Token head;
  head.next = NULL;
  Token *cur = &head;

  while (*p) {
    //空白文字と改行をスキップ
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
    if (strchr("+-*/()<>=;{},", *p)){
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

    //for keywords
    char* kw = startswith_reserved(p);
    if(kw){
      int len = strlen(kw);
      cur = new_token(TK_RESERVED, cur, p, len);
      p += len;
      continue;
    } //if

    //identifier
    if(is_alphabet(*p)){
      char* q = p++;
      while(is_alphabet_or_number(*p)){
	p++;
      } //while
      cur = new_token(TK_IDENT, cur, q, p-q);
      continue;
    } //if is_alphabet

    /*error("invalid token");*/
    error_at(p, "invalid token");
  } //while()

  new_token(TK_EOF, cur, p, 0);
  return head.next;
}


//
//parser
//

LVar* locals = NULL;

LVar* find_lvar(Token* tok){
  LVar* var = locals;
  for(var; var; var = var->next){
    if(var->len == tok->len && !memcmp(tok->str, var->name, var->len)){
      return var;
    } //if
  } //for
  return NULL;
} //find_lvar()

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

// program = stmt*
void program(){
  int i = 0;
  while(!at_eof()){
    code[i++] = stmt();
  }
  code[i] = NULL;
} //program()

//stmt = expr ";"
//      | "{" stmt* "}"
//      | "return" expr? ";"
//      | "if" "(" expr ")" stmt ("else" stmt)?
//      | "while" "(" expr ")" stmt
//      | "for" "(" expr? ";" expr? ";" expr? ")" stmt
Node* stmt(){
  Node* node;

  if(consume("return")){
    if(consume(";")){
      //"return" ";"
      node = new_node(ND_RETURN);
      return node;
    }
    //"return" expr ";"
    node = calloc(1, sizeof(Node));
    node->kind = ND_RETURN;
    node->lhs = expr();
    expect(";");
    return node;
  } //if

  if(consume("if")){
    //"if" "(" expr ")" stmt ("else" stmt)?
    node = new_node(ND_IF);
    expect("(");
    node->cond = expr();
    expect(")");
    node->then = stmt();
    if(consume("else")){
      node->els = stmt();
    }
    return node;    
  } //if "if"

  if(consume("while")){
    //"while" "(" expr ")" stmt
    node = new_node(ND_WHILE);
    expect("(");
    node->cond = expr();
    expect(")");
    node->then = stmt();
    return node;
  } //if "while"

  if(consume("for")){
    //"for" "(" expr? ";" expr? ";" expr? ")" stmt
    node = new_node(ND_FOR);
    expect("(");
    //1個目
    if(!consume(";")){
      //先読みして、";"ではなかったとき
      node->init = expr();
      expect(";");
    } //if(!consume(";"))

    //2個目
    if(!consume(";")){
      node->cond = expr();
      expect(";");
    } //if(!consume(";"))

    //3個目
    if(!consume(")")){
      node->inc = expr();
      expect(")");
    } //if(!consume(")"))
    node->then = stmt();
    return node;
  } //if "for"

  if(consume("{")){
    //"{" stmt* "}"
    Node head = {};
    Node* curr = &head;
    
    while(!consume("}")){
      curr->next = stmt();
      curr = curr->next;
    } //while

    node = new_node(ND_BLOCK);
    node->body = head.next;
    return node;    
  } //if(consume("{"))

  //expr ";"
  node = expr();
  expect(";");
  return node;
  
} //stmt()

// expr = assign
Node *expr() {
  return assign();
}

//assign = equality ("=" assign)?
Node* assign(){
  Node* node = equality();
  if(consume("=")){
    node = new_binary(ND_ASSIGN, node, assign());
  } //if
  return node;
} //assign()


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


Node* func_args(){

  if(consume(")")){
    //引数がないとき
    return NULL;
  }

  Node* head = assign();
  Node* curr = head;
  while(consume(",")){
    curr->next = assign();
    curr = curr->next;
  } //while
  expect(")");
  return head;
  
} //func_args()

// primary = "(" expr ")"
//           | num
//           | ident ("(" ")")?
Node *primary() {
  if (consume("(")) {
    Node *node = expr();
    expect(")");
    return node;
  } //if

  Token* tok = consume_ident();
  if(tok){

    if(consume("(")){
      //function call
      
      Node* node = new_node(ND_FUNCALL);
      node->funcname = strndup(tok->str, tok->len); //文字列複製
      node->args = func_args();
      return node;
    } //if(consume("("))
    
    Node* node = calloc(1, sizeof(Node));
    node->kind = ND_LVAR;

    LVar* lvar = find_lvar(tok);
    if(lvar){
      node->offset = lvar->offset;
    } else {
      lvar = calloc(1, sizeof(LVar));
      lvar->next = locals;
      lvar->name = tok->str;
      lvar->len = tok->len;
      //lvar->offset = locals->offset + 8;
      if(locals){
	lvar->offset = locals->offset + 8;
      } else {
	lvar->offset = 8;
      } //if
      node->offset = lvar->offset;
      locals = lvar;
    } //if
    return node;
  } //if

  return new_num(expect_number());
} //primary()



