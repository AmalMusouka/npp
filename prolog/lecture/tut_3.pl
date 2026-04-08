select(X, [X | L], Y, [Y | L]).
% select(X, [[_], X, [_] | _], Y, [[_], Y, [_] | _]).

% select(X, [A | L], Y, [A | M]) :- select(X, L, Y, M).

select(X, L, Y, M) :-
    same_length(L, M),
    append(A, [X | B], L),
    append(C, [Y | D], M).


lookup(D, K, V) :-
    member(p(K, V), D).

colors(D) :-    
    D = [p(red, 10), p(green, 20), p(blue, 30), p(orange, 40)].  % use colors(_D) to not print it

add(I, z, I).
add(I, s(J), s(K)) :- add(I, J, K).

le(z, _).
le(s(I), s(J)) :- le(I, J).

permutation([], []).
permutation([X | L],  M) :-
    % append(M1, [X | M2], M),
    % append(M1, M2, G),
    same_length([X | L], M),
    select(X, M, G),
    permutation(L, G).


combinations([], 0, []).
combinations([X | L], N, [X | M]) :-N1 #= N - 1, combinations(L, N1, M).
combinations([_ | L], N, M) :- combinations(L, N, M).


stairs(0, []).
stairs(N, [S | L]) :- N #> 0,  between(1, 3, S), 
    N1 #= N - S, stairs(N1, L).

change(0, []).
change(N, [S | L]) :- N #> 0, member(S, [1, 5, 10, 20, 50]),
    N1 #= N - S, change(N1, L).

change2(0, []).
change2(S, [S]) :- member(S, [1, 5, 10, 20, 50]).
change2(N, [S, T | L]) :- N #> 0, member(S, [1, 5, 10, 20, 50]),
    N1 #= N - S, S #>= T, change(N1, [T | L]).

intersect(line(A1, B1, C1), line(A2, B2, C2), p(X, Y)) :-
    { X * A1 + Y * B1 = C1,
      X * A2 + Y * B2 = C2 }.

on_segment(segment(p(X1, Y1), p(X2, Y2)), p(X, Y)) :-
    { T >= 0, T =< 1,
      T * X1 + (1 - T) * X2 = X,
      T * Y1 + (1 - T) * Y2 = Y }.