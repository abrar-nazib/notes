#include <stdio.h>
struct test
{
    char buf[30];
};
extern struct test my_asm();
int main(int argc, char *argv[])
{
    struct test a = my_asm();
    for (int x = 0; x < 5; x++)
    {
        printf("%c", a.buf[x]);
    }
    return 0;
}