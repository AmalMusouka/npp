:- use_module(library(clpfd)).

len([], 0).
len([_ | L], N) :-
    N #> 0, N1 #= N - 1, len(L, N1).

digits([X], B, N) :- B in 2..10, X #>= 0, X #< B, N #= X. 

digits(L, B, N) :-
    B in 2..10, reverse(L, RL), len(RL, C), append(XL, [X], RL), X #>= 0, X #< B, reverse(XL, RXL), digits(RXL, B, NN), N #= X * (B ^ (C - 1)) + NN.

convert(L1, B1, L2, B2) :-
    digits(L1, B1, N1), digits(L2, B2, N2), N2 #= N1.