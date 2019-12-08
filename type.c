#include "9cc.h"

Type* int_type = &(Type){ TY_INT };

Type* pointer_to(Type* base){
  
  Type* type = calloc(1, sizeof(Type));
  type->kind = TY_PTR;
  type->base = base;
  return type;
  
} //pointer_to()
