#include <iostream>
#include <cxxabi.h>
#include <string>
#include <cstdlib>

std::string demangle(const std::string& in)
{
  int     status;
  char   *realname;

  realname = abi::__cxa_demangle(in.c_str(), 0, 0, &status);
 
  std::string out(realname);
  free(realname);

  return out;
}


int main(int argc, char ** argv)
{
     std::string s;

     if (argc > 1)
     {
        s = std::string(argv[1]);
     }
     else std::cin >> s;

     std::cout << demangle(s) << std::endl;

     return 0;
}
