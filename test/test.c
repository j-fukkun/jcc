
int x;
int y = 10;
char z[6] = "Hello";
char zz[] = "World";

int kaijo(int x){
  if(x == 1){
    return 1;
  }else{
    return x*kaijo(x-1);
  }
}

int main(){

  int hoge;
  hoge = 10;
  if(hoge == 10){
    printf("hoge = %d\n", hoge); //10
  } else {
    printf("error local variable\n");
    abort();
  }

  hoge = 0;
  int a;
  for(a = 0; a < 10; a = a+1){hoge = hoge + 1;}
  if(hoge == 10){
    printf("hoge = %d\n", hoge); //10
  } else {
    printf("error for\n");
    abort();
  }

  hoge = 0;
  while(hoge < 10){hoge = hoge+1;}
  if(hoge == 10){
    printf("hoge = %d\n", hoge); //10
  } else {
    printf("error while\n");
    abort();
  }

  a = 5;
  hoge = kaijo(a);
  if(hoge == 120){
    printf("hoge = %d\n", hoge); //120
  } else {
    printf("error kaijo\n");
    abort();
  }

  int* b;
  a = 5;
  b = &a;
  if(*b == 5){
    printf("*b = %d\n", *b); //5
  } else {
    printf("error pointer\n");
    abort();
  }

  *b = 10;
  if(a == 10){
    printf("a = %d\n", a); //10
  } else {
    printf("error address");
    abort();
  }

  int s;
  s = sizeof(a);
  if(s == 4){
    printf("s = %d\n", s); //4
  } else {
    printf("error sizeof int");
    abort();
  }

  s = sizeof(a+1);
  if(s == 4){
    printf("s = %d\n", s); //4
  } else {
    printf("error sizeof int 2");
    abort();
  }

  s = sizeof(1);
  if(s == 4){
    printf("s = %d\n", s); //4
  } else {
    printf("error sizeof number");
    abort();
  }

  s = sizeof(b);
  if(s == 8){
    printf("s = %d\n", s); //8
  } else {
    printf("error sizeof pointer");
    abort();
  }

  int c[1+1];
  c[0] = 1;
  *(c + 1) = 2;
  if(c[0] == 1){
    printf("c[0] = %d\n", c[0]); //1
  } else {
    printf("error array");
    abort();
  }

  if(c[1] == 2){
    printf("c[1] = %d\n", c[1]); //2
  } else {
    printf("error array 2");
    abort();
  }

  x = 5;
  if(x == 5){
    printf("x = %d\n", x); //5
  } else {
    printf("error global value");
    abort();
  }

  char d[1 * 2];
  d[0] = 1;
  d[1] = 2;
  printf("d[0] = %d\n", d[0]);
  
  printf("y(global init) = %d\n", y);
  printf("%s, %s\n", z, zz);
  
  return 0;
} //main

