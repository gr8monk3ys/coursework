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
CFLAGS = -Iinc -Idep -w -std=c++11 -lboost_system -lboost_filesystem -lpthread

# Specify folder structure of project
IDIR = inc
ODIR = obj
BDIR = bin
SDIR = src
TDIR = test
PDIR = scratchpad

# Specify header files project depends on
_DEPS = myLib.h

# Specify object files needed to build executable
_OBJ = app.o  myLib.o

# Specify object files needed to build test suite
TESTOBJ = $(TDIR)/$(ODIR)/test.o $(ODIR)/myLib.o

SCRATCHOBJ = $(PDIR)/$(ODIR)/scratchpad.o $(ODIR)/myLib.o

# Specify name of app executable
PROGRAM = server

# Specify name of test suite executable
TEST = test


# Do not edit below this line (unless you want to)


DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(PDIR)/$(ODIR)/%.o: $(PDIR)/%.cpp $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

$(TDIR)/$(ODIR)/%.o: $(TDIR)/%.cpp $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

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
	$(RM) $(TDIR)/$(ODIR)/*.o
	$(RM) $(PDIR)/$(ODIR)/*.o
