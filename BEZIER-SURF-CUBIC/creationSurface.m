Z = zeros(16,3);
for k=1:4
    for p=1:4
        x = k*0.6666;
        y = p*0.6666;
        Z(4*k-4+p,1) = x;
        Z(4*k-4+p,2) = y;
        Z(4*k-4+p,3) = cos(3*(x+y));
        %save('surface5', 'result', '-ascii');
        %save('surface5', 'x', 'y', 'z', '-ascii');
    end
end
save('surface6', 'Z', '-ascii');