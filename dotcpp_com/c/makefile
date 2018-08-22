CC=gcc

WALL=-Wall -g
SrcFiles=$(wildcard *.c)
DestFiles=$(patsubst %.c,%,$(SrcFiles)) #%.cpp -> %

all:$(DestFiles)

$(DestFiles):%:%.c
	$(CC) $(WALL) $< -o $@ -lm

clean:
	-rm $(DestFiles)

test:
	-@echo $(SrcFiles)
	-@echo $(DestFiles)

.PHONY:all clean test
