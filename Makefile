
CC = g++

CFLAGS = -std=c++11 -O3 -o

OUTPUT = resnet34_mkl

OBJS = main.cpp resnet.cpp, resnet.hpp

# https://software.intel.com/en-us/articles/intel-mkl-link-line-advisor
MKL = -Wl,--start-group ${MKLROOT}/lib/intel64/libmkl_intel_ilp64.a ${MKLROOT}/lib/intel64/libmkl_sequential.a ${MKLROOT}/lib/intel64/libmkl_core.a -Wl,--end-group -lpthread -lm -ldl  -DMKL_ILP64 -m64 -I${MKLROOT}/includeC 

OPENCV = `pkg-config --cflags --libs opencv`


all: 
	$(CC) $(CFLAGS) $(OUTPUT) $(OBJS) -lcnpy $(MKL) $(OPENCV) 

clean:
	rm $(OUTPUT)
