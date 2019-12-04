#include <fstream>
#include <iostream>
#include <string>

#include <cuda.h>

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
    /// Insérer le code
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



    /// Charger le fichier d'entree
    /// Initialiser numCRows et numCColumns
    numCRows = 0;
    numCColumns = 0;
    /// Allouer hostC

    /// Afficher les informations sur la matrice
    /// Allouer la memoire sur GPU

    /// Copier la memoire sur le GPU


    /// Initialise la grille et les dimensions de chaque bloc

    /// Execute le kernel

    cudaThreadSynchronize();

    /// Charge le resultat en memoire CPU

    /// Libere la memoire

    free(hostA);
    free(hostB);
    free(hostC);

    return 0;
}

