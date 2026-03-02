:- use_module(library(clpfd)).

len([], 0).
len([_ | L], N) :-
    N #> 0, N1 #= N - 1, len(L, N1).

digits([X], B, N) :- B #> 0, B #=< 10, X #>= 0, X #< B, N #= X. 

digits(L, B, N) :-
    B #> 0, B #=< 10, reverse(L, RL), len(RL, C), append(XL, [X], RL), reverse(XL, RXL), digits(RXL, B, NN), N #= X * (B ^ (C - 1)) + NN.

% digits([1, 2, 3], 5, N).