Z = zeros(16,3);

for k=1:4
    for p=1:4
        x = k*0.6666;
        y = p*0.6666;
        Z(4*k-4+p,1) = x;
        Z(4*k-4+p,2) = y;
        Z(4*k-4+p,3) = cos(4*(x+y));
        %save('surface5', 'result', '-ascii');
        %save('surface5', 'x', 'y', 'z', '-ascii');
    end
end

for k=1:4
    for p=1:4
        x = (k+3)*0.6666;
        y = (p)*0.6666;
        if k==1
            Z(16+4*k-4+p,1) = Z(16+4*k-4+p-4,1);
            Z(16+4*k-4+p,2) = Z(16+4*k-4+p-4,2);
            Z(16+4*k-4+p,3) = Z(16+4*k-4+p-4,3);
        else
            Z(16+4*k-4+p,1) = x;
            Z(16+4*k-4+p,2) = y;
            Z(16+4*k-4+p,3) = cos(4*(x+y));
        end
        %save('surface5', 'result', '-ascii');
        %save('surface5', 'x', 'y', 'z', '-ascii');
    end
    end

save('surface8', 'Z', '-ascii');