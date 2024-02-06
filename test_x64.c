#include "test_so.h"
 
int main(void)
{
    long *sa = 0x404018;  //test_a的地址
    long *sb = 0x404020;  //printf的地址
    int sb_fun = *sb;    //之前的值先保存
    printf("The address of first call function test_a is %p\n", *sa); //第1次调用时的地址
    printf("The address of first call function printf is %p\n", sb_fun); //第1次调用时的地址
    test_a();
    printf("The address of second call function test_a is %p\n", *sa); //第2次调用时的地址
    printf("The address of second call function printf is %p\n", *sb); //第2次调用时的地址
    while(1);
    return 0;
}
