#include <iostream>
#include <cxxabi.h>
#include <string>
#include <cstdlib>

std::string demangle(const std::string& in)
{
  int     status;
  char   *realname;

  realname = abi::__cxa_demangle(in.c_str(), 0, 0, &status);
  //  std::cout <<  realname << "\t: " << status << '\n';
 
  std::string out(realname);
  free(realname);

  return out;
}


int main()
{
   std::cout << demangle("_ZN3Foo3twoEv") << std::endl;
}
