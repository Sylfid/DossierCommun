#include <it/vec.h>
#include <it/mat.h>
#include <it/source.h>
#include <it/random.h>
#include <it/linalg.h>

#include "utils.h"
#include "constants.h"
#include "upsampling.h"


mat make_carriers( int Nc, int Nv, unsigned long int key, uint ups )
{

  mat temp; 
  mat u; 
  vec v;

  int i= 0; 

  Nv /= ups*ups;
  
  temp = mat_new_zeros( (size_t)Nv, (size_t)Nc );

  it_seed( key );

  for ( i= 0; i< Nc; i++ ) 
    {
      v = source_gaussian( (size_t)Nv, 0.0, 1.0 ); 
      vec_decr( v, vec_mean( v ) ); 
      mat_set_col( temp, (size_t)i, v );
      vec_delete(v);
    }  

  mat_gs( temp );

  for ( i= 0; i< Nc; i++ ) 
    {
      v = mat_get_col( temp, i ); 
      vec_div_by( v, sqrt(vec_variance(v)) );

      mat_set_col( temp, i, v );
      vec_delete(v);
    }

  u = mat_upsample_carriers( temp, ups );

  mat_delete( temp );

  return( u );

}

vec get_correlations( mat y, uint key, uint sz, uint Nc, bvec mest, uint ups )
{

    uint Nv = sz*sz;
    mat U = make_carriers( Nc,Nv,key, ups );
    mat tuile = mat_new(sz, sz);
    for(int i=0; i+sz<mat_height(y); i=i+sz){
        for(int j=0; j+sz<mat_width(y); j=j+sz){
            mat_add(tuile, mat_get_submatrix(y, i, j, i+sz-1, j+sz-1));
        }
    }
    vec ui;
    vec vecTuile = mat_to_vec(tuile);
    vec corrs = vec_new_zeros( Nc );
    for(int i=0; i<Nc; i++){
        ui = mat_get_col(U, i);
        for(int j=0; j<Nv; j++){
            corrs[i] = corrs[i] + ui[j]*vecTuile[j];
        }
        vec_delete(ui);
    }

    vec_delete(vecTuile);
    mat_delete( U );

    return corrs; 
}
