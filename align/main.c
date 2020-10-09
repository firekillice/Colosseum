#include "stdio.h"

struct S1 {
	int i;
	int j;
	char k;
};

struct S2 {
	int i;
	char j;
	int c;
};

struct S3 {
	int i;
	char j;
	int c;
}__attribute__((packed));

int main()
{
	struct S2 t;
	printf("%x %x %x\n", &t.i, &t.j, &t.c);
	printf("%d %d %d", sizeof(struct S1), sizeof(struct S2), sizeof(struct S3));
}
