
all: clean-all cython demangle coverage 

cython:
	touch bindings/foo.pyx
	python setup.py build
	python setup.py install


demangle: demangle.cpp
	g++ demangle.cpp -o demangle

coverage:
	python test.py
	bash coverage.sh
clean:
	rm -f *.gcov
	rm -f lst
	rm -f tmpcoverage_*

clean-cython:
	rm -rf build

clean-all: clean clean-cython
