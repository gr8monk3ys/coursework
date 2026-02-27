# ================================== #
#  Web Server Makefile               #
#  Written by Angelo Kyrilov         #
#                                    #
#  Computer Science and Engineering  #
#  University of California, Merced  #
#                                    #
# ================================== #

# Specify the compiler
CC = g++

# Specify compiler flags
CFLAGS = -Iinc -w -std=c++11 -lboost_system -lboost_filesystem -lpthread

# Specify folder structure of project
IDIR = inc
ODIR = obj
BDIR = bin
SDIR = src

# Specify header files project depends on
_DEPS = myLib.h server.h

# Specify object files needed to build executable
_OBJ = app.o server.o myLib.o

# Specify object files needed to build test suite
_TESTOBJ = test.o myLib.o

_SCRATCHOBJ = scratchpad.o myLib.o

# Specify name of app executable
PROGRAM = server

# Specify name of test suite executable
TEST = test


# Do not edit below this line (unless you want to)


DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))
TESTOBJ = $(patsubst %,$(ODIR)/%,$(_TESTOBJ))
SCRATCHOBJ = $(patsubst %,$(ODIR)/%,$(_SCRATCHOBJ))

$(ODIR)/%.o: $(SDIR)/%.cpp $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

$(PROGRAM): $(OBJ) 
	$(CC) $^ -o $(BDIR)/$@ $(CFLAGS)

$(TEST): $(TESTOBJ) 
	$(CC) $^ -o $(BDIR)/$@ $(CFLAGS)

scratch: $(SCRATCHOBJ)
	$(CC) $^ -o $(BDIR)/$@ $(CFLAGS)

clean:
	$(RM) $(BDIR)/*
	$(RM) $(ODIR)/*.o
