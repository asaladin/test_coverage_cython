from cython.operator cimport dereference as deref
from libcpp.string cimport string


cdef extern from "foo.h":
    cdef cppclass CppFoo  "Foo":  
        Foo()
        int one()        
    
cdef class Foo:
    cdef CppFoo * thisptr
    def __cinit__(self):
        self.thisptr = new CppFoo()
    def __dealloc__(self):
        if self.thisptr:
           del self.thisptr
    def one(self):
        return self.thisptr.one()
