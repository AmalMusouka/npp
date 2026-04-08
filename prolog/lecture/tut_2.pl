% append and same_length are built in

triple([L, L, L]).

triple_diff([X, Y, Z]) :- dif(X, Y), dif(Y, Z), dif(X, Z).

triple_diff1([X, Y, Z]) :- 
    X #\= Y, Y #\= Z, X #\= Z.

all_same([]).
all_same([_]).
all_same([X, X | L]) :- all_same([X | L]).


second_last(X, [X , _]).
second_last(X, [_ | L]) :-
    second_last(X, L).

second_last_with_append(X, L) :- append(_, [X, _], L).

member(X, L) :- append(_, [X | _], L).

% next_to(c, d, [a, b, c, d, e]).
next_to(X, Y, L) :- append(_, [X, Y | _], L).

is_list([]).
is_list([_ | _]).

same_length([], []).
same_length([_ | L], [_ | M]) :- same_length(L, M).

even_length([]).
even_length([_, _ | L]) :- even_length(L).


longer([_ | _], []).
longer([_ | L], [_ | M]) :- longer(L, M).

double_length([], []).
double_length([_, _ | L], [_ | M]) :- double_length(L, M).

len([], 0).
len([_ | L], N) :-
    N #> 0, N1 #= N - 1, len(L, N1).

non_member(_, []).
non_member(X, [Y | L]) :- dif(X, Y), non_member(X, L).

all_diff([]).
all_diff([X | L]) :- non_member(X, L), all_diff(L).

ordered_list([]).
ordered_list([_]).
ordered_list([X, Y | L]) :- X #=< Y, ordered_list(Y | L).

prefix(L, M) :- append(L, _, M).

reverse([], []).
reverse([X | L], M) :- same_length([X | L], M), 
    append(LR, [A], M), reverse(L, LR).

reduce(add, X, Y, Z) :- X + Y #= Z.
reduce(sub, X, Y, Z) :- X - Y #= Z.
reduce(mul, X, Y, Z) :- X * Y #= Z.
reduce(div, X, Y, Z) :- X div Y #= Z.

reduce_to_n([N], N, []).

reduce_to_n([X | L], N, [Op | Ops]) :-
    reduce_to_n(L, N1, Ops), reduce(Op, X, N1, N).

    