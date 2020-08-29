g++ cache_line_test.c -o cache_line_test
for i in {1..200}
do
	./cache_line_test $i
done
