#include <stdio.h>

extern void my_asm(int *address);
int main(int argc, char *argv[])
{
    int a = 50;
    int *p = &a;
    printf("The value of a before modification is %i\n", a);
    my_asm(p);
    printf("The value of a after modification is %i", a);
    return 0;
}