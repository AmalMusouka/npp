member(X, L) :- append(_, [X | _], L).

select(X, L, M) :- append(A, [X | B], L), append(A, B, M).

% +, ? are mode indictors, + means parameters is only input, ? is bidirectional, if all para are ?, the predicate is pure.
% use_module(clpr) - for real arithmetic

triangle(X, Y, Z) :-
    { X > 0, Y > 0, Z > 0, X^2 + Y^2 = Z^2 }.

currency(Kc, Eur, Usd) :-
    { Eur = 0.85 * Usd, 20.69 * Usd = Kc}.

factorial(0.0, 1.0).
factorial(X, F) :-
    { X > 0, F >= X, X1 = X - 1, F = X * F1},
    factorial(X1, F1).

flatten([], []).

flatten([L | LL], M) :-
    append(L, M1, M), flatten(LL, M1).

repeat(0, _, []).
repeat(N, X, [X | L]) :-
    N #> 0, N1 #= N - 1, repeat(N1, X, L).

zero_mat(N, M) :-
    repeat(N, 0, Row),
    repeat(Nl Row, M).

subset([], []).
subset([X | L], [X | M]) :- subset(L, M).
subset([_ | L], M) :- subset(L, M).

% OR

subset(_, []).
subset(L, [X | M]) :- 
    append(_, [X | L1], L), subset(L1, M).

% P = (functor)point(3, 4).(structure)

convert(time(H, M, S), N) :-
    H in 0..23, M in 0..59, S in 0..59,
    N #= 3600 * H + 60 * M + S.

add(T1, N, T2) :-
    convert(T1, N1), N2 #= N1 + N,
    convert(T2, N2).