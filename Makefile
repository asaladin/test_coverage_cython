
all: clean-all cython coverage 

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

clean-cython:
	rm -rf build

clean-all: clean clean-cython
