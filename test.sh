#!/bin/bash

try(){
    expected="$1"
    input="$2"

    ./9cc "$input" > tmp.s
    gcc -o tmp tmp.s
    ./tmp
    actual="$?"

    if [ "$actual" = "$expected" ]; then
	echo "$input => $actual"
    else
	echo "$input => $expected expected, but got $actual."
	exit 1
    fi   
}

try 10 'int main(){int hoge; hoge = 10; return hoge;}'
try 10 'int main(){int a; int hoge; hoge = 0; for(a = 0; a < 10; a = a+1){hoge = hoge + 1;} return hoge;}'
try 10 'int main(){int a; a = 0; while(a < 10){a = a+1;} return a;}'
try 120 'int kaijo(int x){if(x == 1){return 1;}else{return x*kaijo(x-1);}} 
         int main(){int a; a = 5; int b; b = kaijo(a); return b;}'
try 10 'int main(){int a; a = 10; int* hoge; hoge = &a; return *hoge;}'
try 3 'int main(){int x; int* y; y = &x; *y = 3; return x;}'
try 4 'int main(){int x; return sizeof(x);}'
try 8 'int main(){int* x; return sizeof(x);}'
try 4 'int main(){int x; return sizeof(x+3);}'
try 4 'int main(){return sizeof(1);}'
try 4 'int main(){return sizeof(sizeof(5));}'
try 3 'int main(){int a[1+1]; *a=1; *(a+1)=2; int* p; p=a; return *p + *(p+1);}'


echo OK
