
CC = g++

CFLAGS = -std=c++11 -O3 -o

OUTPUT = resnet34_mkl

# https://software.intel.com/en-us/articles/intel-mkl-link-line-advisor
MKL = -Wl,--start-group ${MKLROOT}/lib/intel64/libmkl_intel_ilp64.a ${MKLROOT}/lib/intel64/libmkl_sequential.a ${MKLROOT}/lib/intel64/libmkl_core.a -Wl,--end-group -lpthread -lm -ldl  -DMKL_ILP64 -m64 -I${MKLROOT}/includeC 

OPENCV = `pkg-config --cflags --libs opencv`


all: main.cpp resnet.cpp resnet.hpp
	$(CC) $(CFLAGS) $(OUTPUT) main.cpp resnet.cpp resnet.hpp -lcnpy $(MKL) $(OPENCV) 

clean:
	rm -f $(OUTPUT)
