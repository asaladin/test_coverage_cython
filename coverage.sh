#!/bin/bash

rm tmpcoverage_*

find . -type f -name "*.gcda" > lst
for i in `cat lst`; do 
    gcov -a -p -b $i # -> creates src#foo.cpp.gcov
done

find . -type f -name "*.gcov" > lstcov

echo "listing uncovered functions"
for i in `cat lstcov`; do
   egrep -e "function .* called 0" $i  >> tmpcoverage_${i#./}  #parameter expansion
done

echo done
