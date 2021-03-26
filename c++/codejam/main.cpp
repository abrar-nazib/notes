#include <iostream>
#include <cstring>
#include <stdio.h>

long count(char *mod_string, long X, long Y)
{
    long result = 0;
    long x = 0;
    long y = 0;
    for (int i = 0; mod_string[i + 1] != '\0'; i++)
    {
        if (mod_string[i] == 'C' && mod_string[i + 1] == 'J')
        {
            x++;
            //std::cout << mod_string[i] << mod_string[i + 1] << " " << x << std::endl;
        }
        if (mod_string[i] == 'J' && mod_string[i + 1] == 'C')
        {
            y++;
            //std::cout << mod_string[i] << mod_string[i + 1] << " " << y << std::endl;
        }
    }
    result = x * X + y * Y;
    return result;
}
void replace(char *given_string)
{
    int i, k = 0;

    for (i = 0; given_string[i]; i++)
    {
        given_string[i] = given_string[i + k];

        if (given_string[i] == '?')
        {
            k++;
            i--;
        }
    }
}

int main()
{
    char str[1000];
    long result[100];
    long X, Y;
    int tt;
    scanf("%d", &tt);
    for (int t = 0; t < tt; t++)
    {
        scanf("%ld %ld %s", &X, &Y, &str);
        replace(str);
        result[t] = count(str, X, Y);
    }
    for (int x = 0; x < tt; x++)
    {
        printf("Case #%d: %ld\n", x + 1, result[x]);
    }
    return 0;
}

//1 CJ?CC?  [2,5]
//2 [CC], [CJ], [JC], [J,J]
//3 Boshano lagbe
//3.1 CJ "C" CC "C"
//3.2 CJ "C" CC "J"
//3.3 CJ "J" CC "C"
//3.4 CJ "J" CC "J"
//4 Present value count
//4.1 CJ "C" CC "C"   string= s[0] + s[0+1] = CJ => x++
//4.2 CJ "C" CC "J"   String= s[1] + s[1+1] = JC => y++
//4.3 CJ "J" CC "C"
//4.4 CJ "J" CC "J"

//x*X+y*Y=value

// ?? ??? ???? ?????
