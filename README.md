[![Build Status](https://travis-ci.org/asaladin/test_coverage_cython.svg?branch=master)](https://travis-ci.org/asaladin/test_coverage_cython)

build the cython library:
-------------------------

make cython

run coverage tests:
---------------------
make


notes:
------

use clang to generate ast tree:
clang -Xclang -ast-dump -fsyntax-only -I ../headers foo.cpp 


