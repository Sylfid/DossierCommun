#include <fstream>
#include <iostream>
#include <string>

#include <cuda.h>

#define TILE_WIDTH 16

// Charge une matrice disponible dans les repertoires exemples
bool load_matrix(char * filename, double * &matrix, int &nx, int &ny){
  std::string line;
  std::ifstream infile(filename);

  if (!infile.is_open()) {
    std::cout << "Fichier introuvable: "<< filename << std::endl;
    return 0;
  }

  // Charge la taile de la matrice
  infile >> nx >> ny;

  // Alloue le tableau correspondant
  matrix = new double[nx*ny];

  // Charge la matrice
  for (int i=0; i< nx*ny; i++){
    infile >> matrix[i];
  }

  infile.close();

  return 1;
}

// Calcul C = A * B
__global__ void matrixMultiply(float * A, float * B, float * C,
             int numARows, int numAColumns,
             int numBRows, int numBColumns,
             int numCRows, int numCColumns) {
  const int TILE_WIDTH = 32;
  __shared__ float sharedA[TILE_WIDTH][TILE_WIDTH];
  __shared__ float sharedB[TILE_WIDTH][TILE_WIDTH];
  int bx = blockIdx.x;
  int by = blockIdx.y;
  int tx = threadIdx.x;
  int ty = threadIdx.y;
  int Row = by*TILE_WIDTH + ty;
  int Col = bx*TILE_WIDTH + tx;
  float Cvalue = 0.0;
  if (numAColumns != numBRows) return ;
  for (int i = 0; i < (int)(ceil((float)numAColumns/TILE_WIDTH)); i++)
  {

    if (i*TILE_WIDTH + tx < numAColumns && Row < numARows){
      sharedA[ty][tx] = A[Row*numAColumns + i*TILE_WIDTH + tx];
    }else{
      sharedA[ty][tx] = 0.0;
    }

    if (i*TILE_WIDTH + ty < numBRows && Col < numBColumns){
      sharedB[ty][tx] = B[(i*TILE_WIDTH + ty)*numBColumns + Col];
    }else{
      sharedB[ty][tx] = 0.0;
    }
    __syncthreads();
    if(Row < numARows && Col < numBColumns){

      for(int j = 0; j < TILE_WIDTH; j++)
        Cvalue += sharedA[ty][j] * sharedB[j][tx];
    }

    __syncthreads();
  }

  if (Row < numCRows && Col < numCColumns)
    C[Row*numCColumns + Col] = Cvalue;
}

int main(int argc, char ** argv) {
    float * hostA;
    float * hostB;
    float * hostC;
    float * deviceA;
    float * deviceB;
    float * deviceC;
    int numARows;
    int numAColumns;
    int numBRows;
    int numBColumns;
    int numCRows;
    int numCColumns;


    hostA = (float *) wbImport(wbArg_getInputFile(args, 0), &numARows, &numAColumns);
    hostB = (float *) wbImport(wbArg_getInputFile(args, 1), &numBRows, &numBColumns);
    /// Charger le fichier d'entree
    /// Initialiser numCRows et numCColumns
    numCRows = 0;
    numCColumns = 0;
    numCRows = numARows;
    numCColumns = numBColumns;
    /// Allouer hostC
    hostC = (float*) malloc(sizeof(float)*numCRows*numCColumns);

    /// Allouer la memoire sur GPU
    cudaMalloc((void**)&deviceA , sizeof(float)*numARows*numAColumns );
    cudaMalloc((void**)&deviceB , sizeof(float)*numBRows*numBColumns);
    cudaMalloc((void**)&deviceC , sizeof(float)*numCRows*numCColumns);

    /// Copier la memoire sur le GPU
    cudaMemcpy(deviceA, hostA, sizeof(float)*numARows*numAColumns, cudaMemcpyHostToDevice);
    cudaMemcpy(deviceB, hostB, sizeof(float)*numBRows*numBColumns, cudaMemcpyHostToDevice);

    /// Initialise la grille et les dimensions de chaque bloc
    int dimX = (int)(ceil((float)numCColumns / TILE_WIDTH));
    int dimY = (int)(ceil((float)numCRows / TILE_WIDTH));
    dim3 DimGrid(dimX, dimY);
    dim3 DimBlock(TILE_WIDTH, TILE_WIDTH);

    /// Execute le kernel
    matrixMultiplyShared<<<DimGrid , DimBlock>>>(deviceA , deviceB , deviceC , numARows , numAColumns, numBRows ,numBColumns , numCRows , numCColumns);

    cudaThreadSynchronize();

    /// Charge le resultat en memoire CPU
    cudaMemcpy(hostC, deviceC, sizeof(float)*numCRows*numCColumns , cudaMemcpyDeviceToHost);

    /// Libere la memoire
    cudaFree(deviceA);
    cudaFree(deviceB);
    cudaFree(deviceC);

    free(hostA);
    free(hostB);
    free(hostC);

   :1
     return 0;
}

