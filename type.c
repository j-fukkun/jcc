#include "9cc.h"

//                        kind, size, align
Type* int_type = &(Type){ TY_INT, 4, 4 };

bool is_integer(Type* t){
  return t->kind == TY_INT;
} //is_integer()

Type* new_type(TypeKind kind, int size, int align){
  Type* type = calloc(1, sizeof(Type));
  type->kind = kind;
  type->size = size;
  type->align = align;
  return type;
} //new_type()

Type* pointer_to(Type* base){
  Type* type = new_type(TY_PTR, 8, 8);
  type->base = base;
  return type;
} //pointer_to()

int align_to(int n, int align){
  return (n + align - 1) & ~(align -1);
} //align_to()

void add_type(Node *node) {
  if (!node || node->type){
    return;
  }

  add_type(node->lhs);
  add_type(node->rhs);
  add_type(node->cond);
  add_type(node->then);
  add_type(node->els);
  add_type(node->init);
  add_type(node->inc);
  
  Node* n = node->body;
  for (n; n; n = n->next){
    add_type(n);
  }
  n = node->args;
  for (n; n; n = n->next){
    add_type(n);
  }

  switch (node->kind) {
  case ND_ADD:
  case ND_SUB:
  case ND_PTR_DIFF:
  case ND_MUL:
  case ND_DIV:
  case ND_EQ:
  case ND_NE:
  case ND_LT:
  case ND_LE:
  case ND_FUNCALL:
  case ND_NUM:
    node->type = int_type;
    return;
  case ND_PTR_ADD:
  case ND_PTR_SUB:
  case ND_ASSIGN:
    node->type = node->lhs->type;
    return;
  case ND_LVAR:
    node->type = node->lvar->type;
    return;
  case ND_ADDR: //address &
    node->type = pointer_to(node->lhs->type);
    return;
  case ND_DEREF: //dereferrence *
    if(!node->lhs->type->base){
      error("invalid pointer dereference");
    } //if

    Type* t = node->lhs->type->base;
    node->type = t;    
    return;
  } //switch()
} //add_type()
