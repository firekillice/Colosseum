docker run --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --rm -it -v `pwd`:/app  -p 61374:61374 nasm:v0 /bin/bash 
