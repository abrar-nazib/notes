#include <stdio.h>
extern int my_asm(int a, int b);
//C will be looking for _my_asm
int main(int argc, char *argv[])
{
    int r = my_asm(5, 10);
    printf("Value: %i\n", r);
    return 0;
}