UNAME := $(shell uname)

RTFLAGS="-lrt"
ifeq ($(UNAME), Darwin)
RTFLAGS=-framework Carbon -framework CoreServices
endif

client: client.c libuv/libuv.a
	gcc -I libuv/include client.c libuv/libuv.a $(RTFLAGS) -lpthread -lm -o client

libuv/libuv.a: libuv/Makefile
	$(MAKE) -C libuv
	cp libuv/.libs/libuv.a libuv/libuv.a

libuv/Makefile: libuv/configure
	(cd libuv && ./configure)

libuv/configure: libuv/autogen.sh
	(cd libuv && ./autogen.sh)

clean:
	$(MAKE) -C libuv clean
	-rm libuv/libuv.a
	-rm client
