clang++ -S -emit-llvm hello.cpp -o hello.ll

llvm-as hello.ll -o hello.bc

#llvm-dis hello.bc -o hello.ll

