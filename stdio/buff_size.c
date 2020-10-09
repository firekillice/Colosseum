
#include <stdio.h>

int stream_attribute(FILE *fp)
{ 
    if(fp->_flags & _IO_UNBUFFERED)
    {
        printf("fd %d unbuff size %d\n", fileno(fp), fp->_IO_buf_end - fp->_IO_buf_base);
    }
    else if(fp->_flags & _IO_LINE_BUF)
    {
       printf("fd %d line buff size %d\n", fileno(fp), fp->_IO_buf_end - fp->_IO_buf_base);
    }
    else
    {
       printf("fd %d full buff size %d\n", fileno(fp), fp->_IO_buf_end - fp->_IO_buf_base );
    }
    return 0;
}

int main()
{
      FILE *fp;
      char buf[16];
           
      printf("input a string:");
      scanf("%s", buf);

      stream_attribute(stdin);

      stream_attribute(stdout);

      stream_attribute(stderr);

      if((fp = fopen("test.txt","w+")) == NULL)
          perror("fail to fopen");

      fputs(buf, fp);
      stream_attribute(fp);
      return 0;
}

