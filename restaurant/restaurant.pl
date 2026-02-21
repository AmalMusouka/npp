person(stella).
person(emma).
person(david).
person(thomas).


female(stella).
female(emma).
male(david).
male(thomas).


across(X, Y) :-
    person(X), person(Y),
    ((female(X), female(Y)) ; (male(X), male(Y))).

different(P, Q, R, S) :- 
    person(P), person(Q), person(R), person(S),
    dif(P, Q), dif(P, R), dif(P, S), dif(Q, R), dif(Q, S), dif(R, S).


solve(Dumplings, Pasta, Soup, Trout) :-
    different(Dumplings, Pasta, Soup, Trout),
    across(Pasta, Dumplings),
    across(Soup, Trout),
    (dif(david, Trout),  dif(david, Pasta)),
    (dif(emma, Dumplings), dif(emma, Soup)),
    dif(stella, Dumplings).