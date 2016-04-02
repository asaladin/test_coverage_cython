
all: demangle clean coverage 

demangle: misc/demangle.cpp
	g++ misc/demangle.cpp -o demangle


coverage:
	g++ --shared -fPIC -fkeep-inline-functions -fno-inline -fno-inline-small-functions -fno-default-inline -fprofile-arcs -ftest-coverage --coverage -O0 src/foo.cpp -I headers/ -o libfoo.so
	g++ src/main.cpp -lfoo -I headers/ -L .
	LD_LIBRARY_PATH=. ./a.out
	bash coverage.sh
clean:
	rm -f *.gcov
	rm -f lst
	rm -f uncoveredfuncs_*
	rm -f lstcov*
	rm -f demangle
	rm -f *.so
	rm -f *.gcda

