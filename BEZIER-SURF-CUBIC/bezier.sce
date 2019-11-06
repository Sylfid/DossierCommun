function affichageCourbe()
  
  BezierSurf = load("surface1");  // read control points

  num_p=20;
  num_n=20;


  nb = size(BezierSurf) 
  np = floor(nb/16) 

  for k=1:np
    for i=1:4
      for j=1:4
        B(i,j,1,k) = BezierSurf((i-1)*4+j+(k-1)*16,1);
        B(i,j,2,k) = BezierSurf((i-1)*4+j+(k-1)*16,2);
        B(i,j,3,k) = BezierSurf((i-1)*4+j+(k-1)*16,3);
      end
    end
  end
  B

  u = linspace(0,1,num_p); 
  v = u; 


  // Cubic Bezier patches 
  for k=1:np
      S(:,:,:,k)=bezierPatchEval(B(:,:,:,k),u,v); //evaluation du patch k en (num_p+1) x (num_p+1) points
  end


  plotBezierSurface3D(B,S)

endfunction

function S = bezierpatchinterp(B,u,v)

  S=[];

  // Matrice de changement de base
  M = [
      1   0   0  0;
     -3   3   0  0;
      3  -6   3  0;
     -1   3  -3  1
      ];

  MT = M'; // transpose de M

  for i = 1:length(u)
      for j = 1:length(v)
          U  = [1 u(i) u(i)^2 u(i)^3];
          VT = [1 v(j) v(j)^2 v(j)^3]'; 
          for k = 1:3 // evaluation en (u,v) pour les 3 dimensions
              S(i,j,k) = U * M * B(:,:,k) * MT * VT;
          end         
      end    
  end
endfunction

affichageCourbe();
