TARGET		:= elementum
COMPILER    := elementium
SOURCES		:= ./

LIBS = -lfl -Wno-implicit

MFILES := $(foreach dir,$(SOURCES), $(wildcard $(dir)*.element))
LFILES := $(foreach dir,$(SOURCES), $(wildcard $(dir)*.l))
YFILES := $(foreach dir,$(SOURCES), $(wildcard $(dir)*.y))

CC      = $-gcc
CFLAGS  = -o
FLEX    = $-flex
FFLAGS  = -o
BISON   = $-bison
BFLAGS  = -d -o

all: $(YFILES) $(LFILES) $(MFILES)
	$(BISON) $(BFLAGS) file_b.c $(YFILES)
	$(FLEX) $(FFLAGS) file_f.c $(LFILES)
	$(CC) $(CFLAGS) $(COMPILER) file_b.c file_f.c $(LIBS)
	./$(COMPILER) <$(MFILES)> $(TARGET).c
	$(CC) -O0 -pg $(CFLAGS) ./element ./$(TARGET).c
	./element
	gprof ./element gmon.out > analysis.txt

clean:
	@rm -rf *.c *.h element $(COMPILER) *.out analysis.txt
