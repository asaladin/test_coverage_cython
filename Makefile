
all: clean demangle coverage 

demangle: demangle.cpp
	g++ demangle.cpp -o demangle

coverage:
	python test.py
	bash coverage.sh
clean:
	rm -f *.gcov
	rm -f lst
	rm -f tmpcoverage_*
   
