#!/usr/bin/env python
#reads agregated gcov function calls result and 
#generates a report of functions called 0 times

import sys
import re
from collections import defaultdict

pattern = re.compile("function (.+) called ([0-9]+)") 

f = sys.argv[1]

dico = defaultdict(lambda: 0)

with open(f) as infile:
   for line in infile:
      line = line.strip()
      matched = pattern.search(line)
      if matched:
         key = matched.groups()[0].replace(' ','_')
         dico[key]+=int(matched.groups()[1])

for k,v in dico.items():
   print k,v
