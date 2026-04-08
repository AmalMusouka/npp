% male(liam). male(noah). male(oliver). male(william).
% male(elijah). male(james). male(ben).

% female(olivia). female(emma). female(ava).
% female(sophia). female(isabella). female(evelyn).

% parent(liam, oliver).
% parent(olivia, oliver).

% parent(liam, emma).
% parent(olivia, emma).

% parent(noah, william).
% parent(olivia, william).

% parent(william, evelyn).

% parent(oliver, ava).
% parent(ava, james).
% parent(james, isabella).

% parent(emma, elijah).
% parent(elijah, sophia).
% parent(sophia, ben).

grandparent(G, X) :- parent(G, Y), parent(Y, X).

great_grandmother(G, X) :- female(G), grandparent(G, Y) , parent(Y, X).

father(F, X) :- male(F) , parent(F, X).
mother(M, X) :- female(M), parent(M, X).

sibling(X, Y) :- dif(X, Y) , ((father(F, X), father(F, Y)) ; (mother(M, X), mother(M, Y))).

full_sibling(X, Y) :- dif(X, Y) , father(F, X), father(F, Y), mother(M, X), mother(M, Y).

first_cousin(X, Y) :- parent(P, X), parent(Q, Y), full_sibling(P, Q).

second_cousin(X, Y) :- parent(P, X), parent(Q, Y), first_cousin(P, Q).

nth_cousin(X, Y) :- first_cousin(X, Y) ; second_cousin(X, Y).
nth_cousin(X, Y) :- parent(P, X), parent(Q, Y), second_cousin(P, Q).