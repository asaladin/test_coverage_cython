# -*- coding: utf-8 -*-
from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

import os
import sys

os.environ['CPPFLAGS']= "-fkeep-inline-functions -fno-inline -fno-inline-small-functions -fno-default-inline -fprofile-arcs -ftest-coverage --coverage -O0"
os.environ['LDFLAGS']= "-fprofile-arcs --coverage"

sources =   [
           "foo.cpp",   
             ]
             
sources = [os.path.join('src', i) for i in sources ]  #append the 'src' prefix to all files

sources.append("bindings/foo.pyx")


setup(ext_modules=[Extension(
                   "foo",                 # name of extension
                   sources = sources,
                   language="c++",   # causes Cython to create C++ source
                   library_dirs = [],
                   extra_objects = [],
                   include_dirs = ['headers'],
                   )

                     ], 
      cmdclass={'build_ext': build_ext},

      packages = ['.'],
      name="foo",
      version = "0.1"
      )
