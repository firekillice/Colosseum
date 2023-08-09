clang sum.c -emit-llvm -c -o sum.bc
clang sum.c -emit-llvm -S -c -o sum.ll
llvm-as-10 sum.ll -o sum.bc
llvm-dis-10 sum.bc -o sum.ll
llvm-extract-10 -func=sum sum.bc -o sum-fn.bc

