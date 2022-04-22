all: semantics.obj

semantics.o: semantics.asm
	nasm -felf64 -o semantics.o semantics.asm

semantics.out: semantics.o
	ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o semantics.out semantics.o -lc

semantics.obj: semantics.out
	objdump -d semantics.out > semantics.obj

clean:
	rm -rf semantics.o semantics.out semantics.obj
