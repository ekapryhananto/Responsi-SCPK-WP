x = readtable('Real estate valuation data set.xlsx','Range','C1:H51');
x(:,4:5) = []; %data cleaning
x = x{:,:}; %mengubah tipe tabel menjadi matriks
disp(x);

k = [0,0,1,0]; %atribut dari setiap kriteria, nilai 1, yang berarti atrribut benefit, dan 0 berarti atribut cost
w = [3,5,4,1]; %Nilai bobot dari setiap kriteria
[m,n]=size (x); %inisialisasi ukuran x
w = w./sum(w); %membagi bobot setiap kriteria dengan jumlah(total) dari seluruh bobot

for j=1:n
    if k(j)==0 
        w(j)=-1*w(j);
    end
end
for i=1:m
    S(i) = prod(x(i,:).^w);
    if isinf(S(i)) %biar gaada nilai infinite
        S(i) = 0;
    end
end

V = S/sum(S);

[val, idx] = sort(V, 'descend'); %mencari nilai tertinggi

disp("max value :");
disp(val(1:5));
disp("index :");
disp(idx(1:5));