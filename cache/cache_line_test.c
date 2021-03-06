#include "stdio.h"
#include "time.h"
#include <stdlib.h>
#include <sys/time.h>
 
long  timediff(clock_t  t1, clock_t  t2) {
    long  elapsed;
    elapsed = ((double)t2 - t1) / CLOCKS_PER_SEC * 1000;
    return  elapsed;
}
 
int  main(int  argc, char  *argv[])
{
	//printf("%d",sizeof(long));
    int  array_size=atoi(argv[1]);
    int  repeat_times = 1000000000;
    int  array[array_size];
    for(int  i=0; i<array_size; i++){
        array[i] = 0;
    }
    int  j=0;
    int  k=0;
    int  c=0;
    clock_t  start=clock();
    while(j++<repeat_times){
        if(k==array_size){
            k=0;
        }
        c = array[k++];
    }
    clock_t  end =clock();
    printf("%d\t%lu\n", array_size, timediff(start,end));
    return  0;
}
