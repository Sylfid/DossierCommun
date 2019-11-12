
# Specify the compiler
CC=gcc

# Compilation options
OMP_FLAGS= -fopenmp

# Directory with common headers
COMMON_DIR=./

# Compile all executable
all: hello pi mandel

hello: hello.c
	$(CC) $^ $(CCFLAGS) $(OMP_FLAGS) $(LIBS) -I $(COMMON_DIR) -o $@

pi: pi.c
	$(CC) $^ $(CCFLAGS)  $(OMP_FLAGS) $(LIBS) -I $(COMMON_DIR) -o $@

mandel: mandel.c
	$(CC) $^ $(CCFLAGS)  $(OMP_FLAGS) $(LIBS) -I $(COMMON_DIR) -o $@

# Remove non sources files
clean:
	rm -f hello pi mandel
	rm -f *.o *~
