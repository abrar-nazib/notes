#include <stdio.h>
struct test
{
    char buf[30];
};
extern int my_asm(struct test t);

int main(int argc, char *argv[])
{
    struct test t;
    t.buf[0] = 'A';
    t.buf[1] = 'B';
    t.buf[2] = 'C';

    int x = my_asm(t);
    printf("%c\n", (char)x);
    return 0;
}