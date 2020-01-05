

//line comment
/*
  block 
  comment
*/
int xg;
int g = 10;
//int* y2 = &y;
char gz[6] = "Hello";
//char* z2 = z + 1;
char gzz[] = "World";
int z3[4] = {1,2};
int z4[] = {10,20,30};
int g2[4];
char g3 = 3;


int assert(int expected, int actual, char* code) {
  if (expected == actual) {
    printf("%s => %ld\n", code, actual);
  } else {
    printf("%s => %ld expected but got %ld\n", code, expected, actual);
    abort();
  }
  return;
}

/*
int check(int lhs, int rhs){
  if(lhs == 10){
    return 1;
  } else {
    return 0;
  }  
}
*/

int add2(int a, int b){
  return a+b;
}

int add6(int a, int b, int c, int d, int e, int f){
  return a+b+c+d+e+f;
}

int kaijo(int x){
  if(x == 1){
    return 1;
  }else{
    return x*kaijo(x-1);
  }
}

void void_test(){
  printf("void_test OK\n");
}

void void_test2(void){
  printf("void_test2 OK\n");
}


int main(){

  assert(5,2+3,"2+3");
  assert(-1,2-3,"2-3");
  assert(6,2*3,"2*3");
  assert(2,10/5,"10/5");
  assert(41, 12+34-5, "12+34-5");
  assert(15, 5*(9-6), "5*(9-6)");
  assert(4, (3+5)/2, "(3+5)/2");
  assert(-10, -10, "0");
  assert(10, - -10, "- -10");
  assert(10, - - +10, "- - +10");

  assert(0, 0==1, "0==1");
  assert(1, 42==42, "42==42");
  assert(1, 0!=1, "0!=1");
  assert(0, 42!=42, "42!=42");

  assert(1, 0<1, "0<1");
  assert(0, 1<1, "1<1");
  assert(0, 2<1, "2<1");
  assert(1, 0<=1, "0<=1");
  assert(1, 1<=1, "1<=1");
  assert(0, 2<=1, "2<=1");

  assert(1, 1>0, "1>0");
  assert(0, 1>1, "1>1");
  assert(0, 1>2, "1>2");
  assert(1, 1>=0, "1>=0");
  assert(1, 1>=1, "1>=1");
  assert(0, 1>=2, "1>=2");

  int a;
  a = 3;
  assert(3, a, "int a; a=3; a;");

  int z;
  z = 5;
  assert(8, a+z, "int a; int z; a=3; z=5; a+z;");
  
  int a2 = 3;
  int z2 = 5;
  assert(3, a, "int a=3; a;");
  assert(8, a+z, "int a=3; int z=5; a+z;");

  int foo = 3;
  assert(3, foo, "int foo=3; foo;");

  int foo123 = 3;
  int bar = 5;
  assert(8, foo123+bar, "int foo123=3; int bar=5; foo123+bar;");

  int x = 0;
  if (0) x=2; else x=3;
  assert(3, x, "int x=0; if (0) x=2; else x=3; x;");
  if (1-1) x=2; else x=3;
  assert(3, x, "int x=0; if (1-1) x=2; else x=3; x;");
  if (1) x=2; else x=3;
  assert(2, x, "int x=0; if (1) x=2; else x=3; x;");
  if (2-1) x=2; else x=3;
  assert(2, x, "int x=0; if (2-1) x=2; else x=3; x;");
  
  int i = 0;
  while(i<10) i=i+1;
  assert(10, i, "int i=0; i=0; while(i<10) i=i+1; i;");
  i = 0;
  int j = 0;
  while(i<=10) {j=i+j; i=i+1;}
  assert(55, j, "int i=0; int j=0; while(i<=10) {j=i+j; i=i+1;} j;");
  i = 0; j = 0;
  for (i=0; i<=10; i=i+1) j=i+j;
  assert(55, j, "int i=0; int j=0; for (i=0; i<=10; i=i+1) j=i+j; j;");

  assert(8, add2(3, 5), "add(3, 5)");
  //assert(2, sub2(5, 3), "sub(5, 3)");
  assert(21, add6(1,2,3,4,5,6), "add6(1,2,3,4,5,6)");
  assert(120, kaijo(5), "kaijo(5)");

  int x2 = 3;
  assert(3, *&x2, "int x=3; *&x;");
  int *y2=&x2; int **z2=&y2;
  assert(3, **z2, "int x=3; int *y=&x; int **z=&y; **z;");
  /*
  int y3 = 5;
  assert(5, *(&x2+1), "int x=3; int y=5; *(&x+1);");
  assert(5, *(1+&x2), "int x=3; int y=5; *(1+&x);");
  assert(3, *(&y3-1), "int x=3; int y=5; *(&y-1);");
  assert(2, (&x2+2)-&x2, "int x=3; (&x+2)-&x;");
  */  
 
  int x3[3];
  *x3=3; *(x3+1)=4; *(x3+2)=5;
  assert(3, *x3, "int x[3]; *x=3; *(x+1)=4; *(x+2)=5; *x;");
  assert(4, *(x3+1), "int x[3]; *x=3; *(x+1)=4; *(x+2)=5; *(x+1);");
  assert(5, *(x3+2), "int x[3]; *x=3; *(x+1)=4; *(x+2)=5; *(x+2);");

  *x3=3; x3[1]=4; x3[2]=5;
  assert(3, *x3, "int x[3]; *x=3; x[1]=4; x[2]=5; *x;");
  assert(4, *(x3+1), "int x[3]; *x=3; x[1]=4; x[2]=5; *(x+1);");
  assert(5, *(x3+2), "int x[3]; *x=3; x[1]=4; x[2]=5; *(x+2);");
  2[x3] = 6;
  assert(6, *(x3+2), "int x[3]; *x=3; x[1]=4; 2[x]=6; *(x+2);");

  int x4;
  assert(4, sizeof(x4), "int x; sizeof(x);");
  assert(4, sizeof x4, "int x; sizeof x;");
  int* x5;
  assert(8, sizeof(x5), "int *x; sizeof(x);");
  int x6[4];
  assert(16, sizeof(x6), "int x[4]; sizeof(x);");
  
  
  assert(0,xg,"xg");
  xg = 5;
  assert(5,xg,"xg");

  g2[0]=0; g2[1]=1; g2[2]=2; g2[3]=3;
  assert(0, g2[0], "g2[0]");
  assert(1, g2[1], "g2[1]");
  assert(2, g2[2], "g2[2]");
  assert(3, g2[3], "g2[3]");

  assert(4, sizeof(x), "sizeof(x)");
  assert(16, sizeof(g2), "sizeof(g2)");

  char xc = 1;
  assert(1, xc, "char x=1; x;");
  char yc = 2;
  assert(1, xc, "char x=1; char y=2; x;");
  assert(2, yc, "char x=1; char y=2; y;");

  assert(1, sizeof(xc), "char x; sizeof(x);");
  char xc2[10];
  assert(10, sizeof(xc2), "char x[10]; sizeof(x);");

  assert(97, "abc"[0], "abc[0]");
  assert(98, "abc"[1], "abc[1]");
  assert(99, "abc"[2], "abc[2]");
  assert(0, "abc"[3], "abc[3]");
  assert(4, sizeof("abc"), "sizeof(abc)");

  /*
  assert(7, ({ int x; char y; int a=&x; int b=&y; b-a; }), "int x; char y; int a=&x; int b=&y; b-a;");
  assert(1, ({ char x; int y; int a=&x; int b=&y; b-a; }), "char x; int y; int a=&x; int b=&y; b-a;");
  */

  //assert('a', ({ char x[4]="abc"; x[0]; }), "char x[4]=\"abc\"; x[0]; }");
  //assert('c', ({ char x[4]="abc"; x[2]; }), "char x[4]=\"abc\"; x[2]; }");
  //assert(0, ({ char x[4]="abc"; x[3]; }), "char x[4]=\"abc\"; x[3]; }");
  
  assert(10,g,"g");
  
  printf("%s, %s\n", gz, gzz);

  int local = 10;
  assert(10,local,"local");
  
  int xa[4] = {1,2,3,4};
  assert(3, xa[2], "int x[4]={1,2,3,4}; x[2];");
  int xa2[] = {1,2,3,4};
  assert(4, xa2[3], "int x[]={1,2,3,4}; x[3];");
  assert(16, sizeof(xa2), "int x[]={1,2,3,4}; sizeof(x);");
  char xc3[]="foo";
  assert(4, sizeof(xc3), "char x[]=foo; sizeof(x); }");

  int array[3] = {100};
  assert(100, array[0], "int array[3] = {100}; array[0];");
  assert(0, array[1], "int array[3] = {100}; array[1];");
  assert(0, array[2], "int array[3] = {100}; array[2];");


  char array_c[] = "Hello Under World";
  printf("array_c = %s\n", array_c);

  char array_c2[6] = "hello";
  printf("array_c2 = %s\n", array_c2);


  assert(3, g3, "g3");

  void_test();
  void_test2();

  int l = 100;
  assert(101,++l,"int local = 0; ++local;");
  l = 0;
  assert(0,l++,"local = 0;local++;");
  /*
  int la[] = {1,2,3};
  int* p = la;
  assert(2,++p,"la={1,2,3};++la;");
  assert(1,p++,"la={1,2,3};la++;");
  */
  return 0;
} //main

