% = in prolog is structural equality, meaning 2 + 2 = 4 is false
% to evaluate and arithmetic we use "is", eg: X is 2 + 2. (old style)
% is only evaluates from right to left
% new style #= 
% X + 1 #= 1 + X. -> X in inf..sup. where inf is -infinity and sup is +infinity
% limitations - no quadratcs, cant solve system of linear equations

max(A, B, C, M) :- 
    M #= max(max(A, B), C).

right_triangle(X, Y, Z) :-
    X #>0, Y #>0, Z #>0, X^2 + Y^2 #= Z^2.


factorial(0, 1).
factorial(X, N) :-
    X #> 0, X1 #= X - 1, 
    N #= X * N1, factorial(X1, N1).

% to search for a solution use label([X] <- in a list where X is in a finite range).

%Lists
% [A | L] means A prepended to list L
% [_] a list with 1 element
% [_, _] 2
% [_ | _] at least 1 element

non_empty([_ | _]).

first_elem([X, [X | _]]).

last_elem(X, [X]).
last_elem(X, [_ | Z]) :- last_elem(X, Z).
 
member(X, [X | _]).
member(X, [_ | Z]) :- member(X, Z).

append([], L, L).
append([X | L], M, [X | N]) :- append(L, M, N).
