#include <stdio.h>
int g_i;
extern int extern_var;
int print(int x) {
	extern_var = 40;
}
