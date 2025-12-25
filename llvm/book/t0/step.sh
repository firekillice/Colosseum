clang -emit-llvm -S t0.c -o t0.ll

llvm-as-10 t0.ll -o t0.bc    <------------------->  llvm-dis-10 t0.bc -o t0.ll 

llc-10 t0.bc -o t0.s   |    clang -S t0.bc -o t0.s -fomit-frame-pointer

opt-10 -mem2reg -S t0.ll -o t0-opt-01.ll

### opt options
adce
bb-vectorize
constprop
dce
deadargelim
globaldce
globalopt
gvn
inline
instcombine
licm
loop-unswitch
loweratomic
lowerinvoke
lowerswitch
mem2reg
memcpyopt
simplifycfg
sink
tailcallelim
###
