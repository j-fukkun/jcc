#include "9cc.h"

//
//parser
//

Var* locals = NULL;
Var* globals = NULL;


Var* find_lvar(Token* tok){
  Var* var = locals;
  for(var; var; var = var->next){
    if(var->len == tok->len && !strncmp(tok->str, var->name, var->len)){
      return var;
    } //if
  } //for
  return NULL;
} //find_lvar()

Var* find_gvar(Token* tok){
  Var* var = globals;
  for(var; var; var = var->next){
    if(var->len == tok->len && !strncmp(tok->str, var->name, var->len)){
      return var;
    } //if
  } //for
  return NULL;
} //find_gvar()

Node* new_node(NodeKind kind){
  Node *node = calloc(1, sizeof(Node));
  node->kind = kind;
  return node;
}

Node* new_var_node(Var* v){
  Node* node = new_node(ND_VAR);
  node->var = v;
  return node;
}

Node* new_binary(NodeKind kind, Node* lhs, Node* rhs){
  Node *node = new_node(kind);
  node->lhs = lhs;
  node->rhs = rhs;
  return node;
}

Node* new_unary(NodeKind kind, Node* lhs){
  Node* node = new_node(kind);
  node->lhs = lhs;
  return node;
} //new_unary()

Node* new_num(int val){
  Node *node = new_node(ND_NUM);
  node->val = val;
  node->type = int_type;
  return node;
}

Var* new_var(char* name, Type* type, bool is_local){
  Var* var = calloc(1, sizeof(Var));
  var->name = name;
  var->len = strlen(name);
  var->type = type;
  var->is_local = is_local;
  return var;
} //new_var()

//ローカル変数のnew
Var* new_lvar(char* name, Type* type){
  Var* lvar = new_var(name, type, true);
  lvar->next = locals;
  locals = lvar;
  return lvar;
} //new_lvar()

//グローバル変数のnew
Var* new_gvar(char* name, Type* type, bool is_literal, char* literal){
  Var* gvar = new_var(name, type, false);
  gvar->next = globals;
  gvar->is_literal = is_literal;
  gvar->literal = literal;
  globals = gvar;
  return gvar;
} //new_gvar()

Initializer* new_init_val(Initializer* cur, int sz, int val){
  Initializer* init = calloc(1, sizeof(Initializer));
  init->sz = sz;
  init->val = val;
  cur->next = init;
  return init;
} //new_init_val()

Initializer* new_init_zero(Initializer* cur, int nbytes){
  int i = 0;
  for(i; i < nbytes; i++){
    cur = new_init_val(cur, 1, 0);
  } //for
  return cur;
} //new_init_zero()

bool consume_end() {
  Token *tok = token;
  if (consume("}") || (consume(",") && consume("}")))
    return true;
  token = tok;
  return false;
} //consume_end()

bool peek_end() {
  Token *tok = token;
  bool ret = consume("}") || (consume(",") && consume("}"));
  token = tok;
  return ret;
} //peek_end()

void expect_end() {
  if (!consume_end())
    expect("}");
} //expect_end()

void skip_excess_elements2() {
  for (;;) {
    if (consume("{")){
      skip_excess_elements2();
    }
    else {
      assign();
    }

    if (consume_end()){
      return;
    }
    expect(",");
  } //for
  
} //skip_excess_elements2()

void skip_excess_elements() {
  expect(",");
  //warn_tok(token, "excess elements in initializer");
  skip_excess_elements2();
} //skip_excess_elements()


//basetype = builtin-type "*"*
//builtin-type = "int" | "char"
Type* basetype(){
  Type* type = NULL;

  if(consume("int")){
    type = int_type;
  } else if(consume("char")){
    type = char_type;
  }
  
  while(consume("*")){
    type = pointer_to(type);
  }
  return type;
} //basetype()

//determine whether "global_var" or "function"
bool is_function(){
  Token* t = token;
  bool is_func = false;

  Type* type = basetype();
  char* name = expect_ident();
  is_func = consume("(");

  token = t;
  return is_func;  
} //is_function()


//gvar_initializer2 = assign
//                 | "{" (gvar_initializer2 ("," gvar_initializer2)* ","? )? "}"
Initializer* gvar_initializer2(Initializer* cur, Type* type){

  Token* tok = token;
  
  if(type->kind == TY_ARRAY && type->base->kind == TY_CHAR
     && token->kind == TK_STR){
    //in case of char a[]="hoge";
    token = token->next;

    if(type->is_incomplete){
      type->size = tok->str_len;
      type->array_size = tok->str_len;
      type->is_incomplete = false;
    } //if

    //compare array_size with string_length
    int len = (type->array_size < tok->str_len)
      ? type->array_size : tok->str_len;

    int i = 0;
    for(i; i < len; i++){
      cur = new_init_val(cur, 1, tok->strings[i]);
    } //for
    return new_init_zero(cur, type->array_size - len);
  } //if TY_ARRAY && TY_CHAR && TK_STR

  if(type->kind == TY_ARRAY){
    //in case of TYPE a[] = hogehoge;

    bool open = consume("{");
    int i = 0;
    int limit = type->is_incomplete ? INT_MAX : type->array_size;

    if(!peek("}")){
      do{
	cur = gvar_initializer2(cur, type->base);
	i++;
      } while(i < limit && !peek_end() && consume(","));
    } //if

    if(open && !consume_end()){
      skip_excess_elements();
    } //if

    //set excess array elements to zero
    cur = new_init_zero(cur, type->base->size * (type->array_size - i));

    if(type->is_incomplete){
      type->size = type->base->size * i;
      type->array_size = i;
      type->is_incomplete = false;
    } //if
    return cur;    
  } //if(type->kind == TY_ARRAY)

  //if(type->kind == TY_STRUCT)

  bool open = consume("{");
  Node* expression = expr();
  if(open){
    expect_end();
  }

  int constant = eval(expression);
  
  
  return new_init_val(cur, type->size, constant);
} //gvar_initializer2()

Initializer* gvar_initializer(Type *type) {
  Initializer head = {};
  gvar_initializer2(&head, type);
  return head.next;
}


//global_var = basetype ident type_suffix ("=" gvar_initializer)?";"
void global_var(){
  
  Type* type = basetype();

  Token* tok = token;
  char* name = expect_ident();
  type = type_suffix(type);
  //expect(";");
  
  Var* gvar = new_gvar(name, type, false, NULL);

  if(consume("=")){
    gvar->initializer = gvar_initializer(type);
    expect(";");
    return;
  } //if

  if (type->is_incomplete){
    error_tok(tok, "incomplete type");
  }
  expect(";");
  
} //global_var()

// program = (global_var | function)*
Program* program(){
 
  Function head = {};
  Function* curr = &head;

  globals = NULL;

  while(!at_eof()){
    if(is_function()){
      Function* fn = function();
      if(!fn){
	continue;
      }
      curr->next = fn;
      curr = curr->next;
      continue;
    } //if
    global_var();
  } //while()

  Program* prog = calloc(1, sizeof(Program));
  prog->globals = globals;
  prog->fns = head.next;
  return prog;
  
} //program()


//param = basetype ident
Var* read_func_param(){

  Type* type = basetype();
  Token* tok = consume_ident();
  if(tok){
    return new_lvar(strndup(tok->str, tok->len), type);
  } //if(tok)
  
  return NULL;
} //read_func_param()

//params = param ("," param)*
void read_func_params(Function* fn){

  if(consume(")")){
    //引数なしのとき
    return;
  }

  fn->params = read_func_param();
  Var* curr = fn->params;

  while(!consume(")")){
    expect(",");

    if(consume("...")){
      fn->has_varargs = true;
      expect(")");
      return;
    } //if

    curr->next = read_func_param();
    curr = curr->next;    
  } //while
    
} //read_func_params()

//function = basetype ident "(" params? ")" "{" stmt* "}"
//params = param ("," param)*
//param = basetype ident
Function* function(){
  
  locals = NULL;

  Type* type = basetype();
  char* name = expect_ident();
  Function* fn = calloc(1, sizeof(Function));
  fn->name = name;
  expect("(");
  
  read_func_params(fn);

  //error("locals = %s\n", locals->name);

  //read function body
  Node head = {};
  Node* curr = &head;
  expect("{");
  while(!consume("}")){
    curr->next = stmt();
    curr = curr->next;
  } //while

  fn->node = head.next;
  fn->locals = locals;
  return fn;  
} //function()


bool is_typename(){

  return peek("int") || peek("char");

} //is_typename()


//declaration = basetype ident type_suffix ";"
Node* declaration(){

  Type* type = basetype();
  char* name = expect_ident();

  //if(expect("[")){
    type = type_suffix(type);
    //} //if
  
  expect(";");

  Var* lvar = new_lvar(name, type);
  return new_node(ND_NULL); //変数宣言では、コード生成はしない
    
} //declaration()

//type_suffix = ("[" const_expr "]" type_suffix)?
Type* type_suffix(Type* type){
  if(!consume("[")){
    return type;
  }

  int size = 0;
  bool is_incomplete = true; //index is omitted? 
  if(!consume("]")){
    size = const_expr();
    is_incomplete = false;
    expect("]");
  } //if

  type = type_suffix(type);
  if(type->is_incomplete){
    error("incomplete type");
  }

  type = array_of(type, size);
  type->is_incomplete = is_incomplete;
  return type;
} //type_suffix()

int const_expr(){
  return eval(add());
} //const_expr()

int eval(Node* node){
  switch(node->kind){
  case ND_ADD:
    return eval(node->lhs) + eval(node->rhs);
  case ND_SUB:
    return eval(node->lhs) - eval(node->rhs);
  case ND_MUL:
    return eval(node->lhs) * eval(node->rhs);
  case ND_DIV:
    return eval(node->lhs) / eval(node->rhs);
  case ND_NUM:
    return node->val;
    
  } //switch()
  error("not a constant expression");
}

Node* stmt(){
  Node* node = stmt2();
  add_type(node);
  return node;
} //stmt()

//stmt2 = expr ";"
//      | "{" stmt* "}"
//      | "return" expr? ";"
//      | "if" "(" expr ")" stmt ("else" stmt)?
//      | "while" "(" expr ")" stmt
//      | "for" "(" expr? ";" expr? ";" expr? ")" stmt
//      | declaration
Node* stmt2(){
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

  
  if(is_typename()){
    //変数宣言
    return declaration();
  } 

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

Node* new_add(Node* lhs, Node* rhs){
  add_type(lhs);
  add_type(rhs);
  
  if(is_integer(lhs->type) && is_integer(rhs->type)){
    return new_binary(ND_ADD, lhs, rhs);
  }
  if(lhs->type->base && is_integer(rhs->type)){
    //左辺がポインタ 右辺がint
    return new_binary(ND_PTR_ADD, lhs, rhs);
  }
  if(is_integer(lhs->type) && rhs->type->base){
    //左辺がint 右辺がポインタ
    return new_binary(ND_PTR_ADD, rhs, lhs);
  }
  error("invalid operands");
  
} //new_add()

Node* new_sub(Node* lhs, Node* rhs){
  add_type(lhs);
  add_type(rhs);
  
  if(is_integer(lhs->type) && is_integer(rhs->type)){
    return new_binary(ND_SUB, lhs, rhs);
  }
  if(lhs->type->base && is_integer(rhs->type)){
    //左辺がポインタ 右辺がint
    return new_binary(ND_PTR_SUB, lhs, rhs);
  }
  if(lhs->type->base && rhs->type->base){
    //左辺がポインタ 右辺がポインタ
    return new_binary(ND_PTR_DIFF, rhs, lhs);
  }
  error("invalid operands");
  
} //new_sub()


//add = mul ("+" mul | "-" mul)*
Node* add(){
  Node* node = mul();

  for(;;){
    if(consume("+")){
      //node = new_binary(ND_ADD, node, mul());
      node = new_add(node, mul());
    } else if(consume("-")){
      //node = new_binary(ND_SUB, node, mul());
      node = new_sub(node, mul());
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

//unary = ("+" | "-" | "*" | "&")? unary
//        | "sizeof" unary
//        | postfix
Node* unary(){
  if(consume("+")){
    return unary();
  }
  if(consume("-")){
    return new_binary(ND_SUB, new_num(0), unary());
  }
  if(consume("*")){
    Node* node = new_node(ND_DEREF);
    node->lhs = unary();
    return node;
  }
  if(consume("&")){
    Node* node = new_node(ND_ADDR);
    node->lhs = unary();
    return node;
  }

  if(consume("sizeof")){
    Node* node = unary();
    add_type(node);
    return new_num(node->type->size);
  }
  
  return postfix();
  
} //urary()

//postfix = primary ("[" expr "]")*
Node* postfix(){

  Node* node = primary();

  for(;;){
    if(consume("[")){
      //a[b] => *(a + b)
      Node* tmp = new_add(node, expr());
      expect("]");
      node = new_unary(ND_DEREF, tmp);
      continue;
    } //if "["

    break;
  } //for
  
  return node;
} //postfix


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

static char* new_label(){
  static int count = 0;
  char buf[20];
  sprintf(buf, ".L.data.%d", count);
  ++count;
  return strndup(buf, 20);
} //new_label()

// primary = "(" expr ")"
//           | ident func_args?
//           | string_literal
//           | num
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
    
    //Node* node = calloc(1, sizeof(Node));
    //node->kind = ND_LVAR;

    Node* node =  new_node(ND_VAR);
    Var* lvar = find_lvar(tok);
    Var* gvar = find_gvar(tok);
    if(lvar){
      node->var = lvar;
    } else if(gvar){
      node->var = gvar;
    } else {
      error_at(tok->str, "undefined variable");
    } //if
    return node;
  } //if(tok) consume_ident()

  tok = consume_str();
  if(tok){
    Type* type = array_of(char_type, tok->str_len);
    Var* gvar = new_gvar(new_label(), type, true, tok->strings);
    return new_var_node(gvar);
  } //if(tok) consume_str()

  return new_num(expect_number());
} //primary()



