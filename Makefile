#
# A makefile for compiling the app
# 

#
# Project structure
SRC = src
BUILD = build
OUTPUT = app
INCLUDE = ./include

#
# compiler options
CC = gcc
CFLAGS = -Wall -g -I $(INCLUDE)

# Which libraries to use -lm -lefence 
LDFLAGS = 

# default goal for Make
.DEFAULT_GOAL := $(OUTPUT)

#
# Runs clean and 
all: clean $(OUTPUT)

$(OUTPUT):
	$(CC) $(CFLAGS) $(SRC)/main.c $(SRC)/service.c -o $(BUILD)/$(OUTPUT) $(LDFLAGS)

#
# Compile output to executable
#$(OUTPUT): main.o
#	$(CC) $(CFLAGS) $(BUILD)/main.o $(SRC)/service.c -o $(BUILD)/$(OUTPUT) $(LDFLAGS)

#
# compile main to output
main.o : main.c
	$(CC) -c $(BUILD)/main.o $(BUILD)/service.o -o $(BUILD)/main.o 

#
# Compile main - combining service and main
main.c: service.o
	$(CC) -c $(SRC)/main.c $(BUILD)/service.o -o $(BUILD)/main.o

# Compile service to output
service.o : 
	$(CC) -c $(SRC)/service.c -o $(BUILD)/service.o 

#
# Remvoes comiled code from the build directory
clean: 
	rm -f $(BUILD)/$(OUTPUT)
	rm -rf $(BUILD)/*.o