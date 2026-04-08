:- use_module(library(clpfd)).

same(X, Y) :-
    (X = 1, Y = one) ; (X = 2, Y = two) ;
    (X = 3, Y = three) ; (X = 4, Y = four) ; (X = 5, Y = five).

numerals([], []).
numerals([X], [Y]) :-
    same(X, Y).

numerals(L, M) :-
    same_length(L, M), append(L1, [X], L), append(M1, [Y], M), same(X, Y), numerals(L1, M1).

pref([], _).
pref([X | L], [X | M]) :- 
    pref(L, M).

dup([], []).
dup([X | L], [X, X | M]) :- dup(L, M).

nums(I, I, [I]).
nums(I, J, []) :- J #< I.
nums(I, J, [I | L]) :- 
    I1 #= I + 1, I1 #=< J, nums(I1, J, L).

rotate([], []).
rotate(L, [X | M]) :-
    append(M, [X], L).

from_index([X | _], 0, X).
from_index([X | L], I, Y) :-
    I #> 0, I1 #= I - 1, from_index(L, I1, Y).

slice(L, I, I, [X]) :-
    from_index(L, I, X).

slice(L, I, J, [X | M]) :-
    I #=< J, from_index(L, I, X), I1 #= I + 1, slice(L, I1, J, M).

asc([_]).
asc([X, Y | L]) :- 
    X #< Y , asc( [Y | L]).

desc([_]).
desc([X, Y | L]) :- 
    X #> Y, desc([Y | L]).

asc_desc([_]).
asc_desc([X, Y | L]) :-
    (X #> Y, desc([Y | L])) ; (X #< Y, asc_desc([Y | L])).

