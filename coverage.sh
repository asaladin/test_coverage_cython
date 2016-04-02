#!/bin/bash

rm tmpcoverage_*
rm zerocov_raw.txt

find . -type f -name "*.gcda" > lst
cat lst
for i in `cat lst`; do 
    gcov -m -a -p -b $i # -> creates src#foo.cpp.gcov
    find . -type f -name "*.gcov" > lstcov
    while read i ; do
       egrep -e "function .* called [0-9]+" $i  >> zerocov_raw.txt 
       rm $i
    done < lstcov
done

#get a summary of functions never called:
python coverage_summary.py zerocov_raw.txt | sort -n -k2 | egrep -v -e "^std::" | egrep -v -i -e "^__pyx" \
    | grep -v pthread | grep -v gthread | grep -v gnu_cxx | grep -v bswap


echo done
