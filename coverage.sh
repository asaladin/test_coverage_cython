#!/bin/bash

rm tmpcoverage_*

find . -type f -name "*.gcda" > lst
for i in `cat lst`; do 
    gcov -a -p -b $i # -> creates src#foo.cpp.gcov
done

find . -type f -name "*.gcov" > lstcov

echo "listing uncovered functions"
while read i ; do
   echo "in file " $i
   zerocoveragename=tmpcoverage_${i#./}   #parameter expansion
   egrep -e "function .* called 0" $i  >> $zerocoveragename 
   while read j ; do 
      fnname=`echo $j | sed -r 's/function (.*) called 0 .*/\1/'`
     ./demangle $fnname
   done < $zerocoveragename
done < lstcov


echo done
