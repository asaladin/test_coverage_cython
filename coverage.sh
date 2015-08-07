#!/bin/bash

rm tmpcoverage_*

find . -type f -name "*.gcda" > lst
for i in `cat lst`; do 
    gcov -m -a -p -b $i # -> creates src#foo.cpp.gcov
done

find . -type f -name "*.gcov" > lstcov

echo "listing uncovered functions"
while read i ; do
   zerocoveragename=uncoveredfuncs_${i#./}   #parameter expansion
   zerocoveragename=${zerocoveragename%.gcov}
   egrep -e "function .* called 0" $i  >> $zerocoveragename 
done < lstcov


echo done
