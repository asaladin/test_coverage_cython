
all: demangle clean-all cython coverage 

demangle: misc/demangle.cpp
	g++ misc/demangle.cpp -o demangle

cython:
	touch bindings/foo.pyx
	python setup.py build
	python setup.py install

coverage:
	python test.py
	bash coverage.sh
clean:
	rm -f *.gcov
	rm -f lst
	rm -f uncoveredfuncs_*
	rm -f lstcov*
	rm -f demangle

clean-cython:
	rm -rf build

clean-all: clean clean-cython
