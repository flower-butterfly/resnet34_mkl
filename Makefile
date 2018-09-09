# https://software.intel.com/en-us/articles/intel-mkl-link-line-advisor

testmake: main.cpp
	g++ -std=c++11 -O3 -o a.out main.cpp resnet.cpp resnet.hpp -g -lcnpy -Wl,--start-group ${MKLROOT}/lib/intel64/libmkl_intel_ilp64.a ${MKLROOT}/lib/intel64/libmkl_sequential.a ${MKLROOT}/lib/intel64/libmkl_core.a -Wl,--end-group -lpthread -lm -ldl  -DMKL_ILP64 -m64 -I${MKLROOT}/includeC `pkg-config --cflags --libs opencv`

#tmpmake: using_double_precision.cpp
#	g++ -std=c++11 -o a.out using_double_precision.cpp  -lcnpy -g  -Wl,--start-group ${MKLROOT}/lib/intel64/libmkl_intel_ilp64.a ${MKLROOT}/lib/intel64/libmkl_sequential.a ${MKLROOT}/lib/intel64/libmkl_core.a -Wl,--end-group -lpthread -lm -ldl  -DMKL_ILP64 -m64 -I${MKLROOT}/include
