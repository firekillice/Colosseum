#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
int main(void)
{
   int i;
   for(i=0; i<2; i++){
      fork();
      int x = 20;
   }
   wait(NULL);
   wait(NULL);
   return 0;
}
