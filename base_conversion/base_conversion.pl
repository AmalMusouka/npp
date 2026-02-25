:- use_module(library(clpfd)).

len([], 0).
len([_ | L], N) :-
    N #> 0, N1 #= N - 1, len(L, N1).

digits([X], B, N) :- X mod 10 #= X. 

digits(L, B, N) :-
    B #>= 0, N #>= 0, reverse(L, RL), len(RL, C), append(NL, [X], RL), NN #= N - X ^ (C - 1), digits(NL, B, NN).

% digits([1, 2, 3], 5, N).