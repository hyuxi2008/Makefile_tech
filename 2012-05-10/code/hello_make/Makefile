.PHONY:clean

hello:hello.o welcome.o
	gcc -o hello hello.o welcome.o

hello.o:hello.c hello.h welcome.h
	gcc -c hello.c -o hello.o

welcome.o:welcome.c welcome.h
	gcc -c welcome.c -o welcome.o
clean:
	rm hello hello.o welcome.o
