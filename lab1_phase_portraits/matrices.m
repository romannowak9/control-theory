poles = [-1, -0.5];  % Zadane wartości własne
[num, den] = tfdata(zpk(0, poles, 8, 1));
A = tf2ss(num{1}, den{1})

eigvals = eig(A)   % Sprawdzenie

Ak = jordan(eA)  % Postać kanoniczna