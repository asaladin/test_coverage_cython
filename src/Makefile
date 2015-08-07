main: main.cpp foo.cpp ../headers/foo.h
	g++ -I ../headers -Wl,-O0 -g -fno-inline -fno-inline-small-functions -fno-default-inline --coverage -O0 foo.cpp main.cpp -o main

clean:
	rm -f main *.gcov *.gcda *.gcno

coverage: clean main
	./main
	gcov -a -b  -f -m main.gcda
