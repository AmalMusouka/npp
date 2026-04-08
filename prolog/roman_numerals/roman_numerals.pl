:- use_module(library(clpfd)).

table(T) :- T =
    [ 1000:[m], 
       900:[c,m], 500:[d],
       400:[c,d], 100:[c],  
       90:[x,c],  50:[l],  
       40:[x,l],  10:[x],   
       9:[i,x],   5:[v],   
       4:[i,v],   1:[i] ].


roman(N, R) :-
    between(0, 3999, N),
    table(T),
    convert(N, T, R).

convert(0, _, []).
convert(N, [V : S | X], R) :-
    N #> 0, N #>= V,
    Q #= N - V, append(S, S1, R), convert(Q, [V : S | X], S1).

convert(N, [V : _| X], R) :-
    N #> 0, N #< V,
    convert(N, X, R).