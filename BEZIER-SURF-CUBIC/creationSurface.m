fichier = fopen('surface2');
result = zeros(3);

for k=0:3
    for p=0:3
        x = k*0.6666;
        y = p*0.6666;
        z = (1-x)*(1-x) + (1-y)*(1-y);
        save('surface5', 'z');
    end
end
