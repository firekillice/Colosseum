int accum = 0;

int sum(int x, int y) 
{
	int t = x + y;
	int s = x - y;
	accum += t;
	return t;
}

int sum_multi(int a, int b, int c, int d, int e, int f, int g)
{
	return a + b + c + d + e + f + g;
}
