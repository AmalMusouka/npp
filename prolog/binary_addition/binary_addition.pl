add(X, Y, CIN, COUT, Z) :-
    (X = Y, CIN = X, X = zero, COUT = zero, Z = zero);
    (X = Y, X = zero, CIN = one, COUT = zero, Z = one);
    (X = Y, X = one, CIN = zero, COUT = one, Z = zero);
    (X = Y, X = one, CIN = one, COUT = one, Z = one);
    (X = zero, Y = one, CIN = zero, COUT = zero, Z = one);
    (X = one, Y = zero, CIN = zero, COUT = zero, Z = one);
    (X = zero, Y = one, CIN = one, COUT = one, Z = zero);
    (X = one, Y = zero, CIN = one, COUT = one, Z = zero).

add(X3, X2, X1, X0, Y3, Y2, Y1, Y0, Z4, Z3, Z2, Z1, Z0) :-
    CIN = zero,
    add(X0, Y0, CIN, C0, Z0),
    add(X1, Y1, C0, C1, Z1), 
    add(X2, Y2, C1, C2, Z2), 
    add(X3, Y3, C2, Z4, Z3).


% add(zero, one, zero, one, zero, zero, one, one, Z4, Z3, Z2, Z1, Z0).
% add(X3, X2, X1, X0, zero, zero, one ,one, zero, one, zero, zero, zero).
% add(X3, X2, X1, X0, Y3, Y2, Y1, Y0, one, one, one, one, one).