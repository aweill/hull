# to install executable into $(BINDIR),
# and library into $(LIBDIR),
#	type "make".

CC	= gcc
AR	= ar	#/usr/ccs/bin/ar for Solaris
#CFLAGS	= -fullwarn -g
OBJS	= hull.o ch.o io.o rand.o pointops.o fg.o
HDRS	= hull.h points.h pointsites.h stormacs.h
SRC	= hull.c ch.c io.c rand.c pointops.c fg.c
LIB	= lib$(PROG).a
PROG	= hull

all	: $(PROG) rsites$(EXE)
	$(AR) rcv $(LIB) $(OBJS)


# the following probably needn't be changed

$(OBJS) : $(HDRS)

hullmain.o	: $(HDRS)

$(PROG)	: $(OBJS) hullmain.o
	$(CC) $(CFLAGS) $(OBJS) hullmain.o -o $(PROG) -lm

rsites	: rsites.c rand.o
	$(CC) $(CFLAGS) rand.o -o rsites rsites.c -lm

clean	:
	-rm -f $(OBJS) hullmain.o core a.out $(PROG) hull.ilk rsites.ilk rsites.suo hull.suo rsites ${LIB} example*

