#include <it/mat.h>
#include <math.h>

vec encode_ss( vec x, bvec m, mat u, double wcr ) 
{
    idx_t tailleMessage = bvec_length(m);
    idx_t tailleX = vec_length(x);
    vec w = vec_new_zeros(tailleX); 
    double alpha = 2;
    vec y = vec_new_zeros(tailleX);
    vec ui;
    for(int i=0; i<tailleMessage; i++){
        ui=mat_get_col(u,i);
        for(int j=0; j<tailleX; j++){
            y[j] = y[j] + pow(-1,m[i])*ui[j];
        }
        vec_delete(ui);
    }
    /*for(int i=0; i<tailleX; i++){
        for(int j=0; j<tailleMessage; j++){
            if(j>mat_width(u)-1){
                printf("ptin");
                exit(0);
            }
            ui = mat_get_col(u, j);
            y[i] = y[i] + pow(-1,m[j]); 
            vec_delete(ui);
        }
    }*/
    for(int i=0; i<tailleX; i++){
        w[i] = x[i] + alpha*y[i]; 
    }
    return( w ); 
}
