#include "test_so.h"
 
int main(void)
{
    int *sa=0x0804c010;  //桩的地址
    int *sb=0x0804c01c;  //桩的地址
    int *sc=0x0804c014;  //桩的地址
	printf("The address of first call function test_a is %p\n", *sa); //第1次调用时的地址
	printf("The address of first call function test_b is %p\n", *sb); //第1次调用时的地址
    printf("The address of first call function test_c is %p\n", *sc); //第1次调用时的地址
    test_a();
    test_b();
    test_c();
	printf("The address of second call function test_a is %p\n", *sa); //第2次调用时的地址
	printf("The address of second call function test_b is %p\n", *sb); //第2次调用时的地址
    printf("The address of second call function test_c is %p\n", *sc); //第2次调用时的地址
    while(1);
    return 0;
}