#include  <cuda.h>

int main(int argc, char ** argv) {
    int deviceCount;

    cudaGetDeviceCount(&deviceCount);

    for (int dev = 0; dev < deviceCount; dev++) {
        cudaDeviceProp deviceProp;

        cudaGetDeviceProperties(&deviceProp, dev);

        if (dev == 0) {
            if (deviceProp.major == 9999 && deviceProp.minor == 9999) {
               // Ne detecte pas CUDA
                return -1;
            } else {
              // Afficher le nombre de device
            }
        }

        // Afficher le nom de la device
        // Donner le numero de version majeur et mineur
        // Donner la taille de la memoire globale
        // Donner la taille de la memoire constante
        // Donner la taille de la memoire partagee par bloc
        // Donner le nombre de thread max dans chacune des directions
        // Donner le taille maximum de la grille pour chaque direction
        // Donner la taille du warp
    }

    return 0;
}
