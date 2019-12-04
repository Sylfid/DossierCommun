# Options complémentaires pour l'edition de lien
LDFLAGS =

# Options de compilation CUDA
NVCC=/usr/local/cuda-6.5/bin/nvcc  -ccbin g++ -m64

# Options complémentatires pour l'edition de lien CUDA
NVCCFLAGS= -arch sm_12

# Liste des exécutables à créer
SRC = $(wildcard *.cu)
OBJ = $(SRC:.cu=.o)
EXEC = cuda_info

all : $(EXEC)

cuda_info: cuda_info.o
	$(NVCC) $(LDFLAGS)  -o $@ $+

# Creation des fichiers objets a partir des sources cuda
%.o: %.cu
	$(NVCC) $(NVCCFLAGS) -c $<

clean:
		rm -f *.o

mrproper: clean
		rm $(EXEC)


