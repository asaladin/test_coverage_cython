from cython.operator cimport dereference as deref
from libcpp.string cimport string


cdef extern from "foo.h":
    cdef cppclass CppFoo  "Foo":  
        Foo()
        int one()        
    

