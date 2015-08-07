//static program to test inline methods without cython

#include <iostream>

using namespace std;

#include "foo.h"



int main()
{
   Foo foo;
   cout << foo.one() << endl;
   cout << "inline: " << foo.one_inline();
   return 0;  

}
