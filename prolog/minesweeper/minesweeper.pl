constrain(X) :- X in 0..1.
constrain_nums(X) :- X in 0..3.

board_to_num([], []).
board_to_num([o | Board], [0 | Nums]) :- board_to_num(Board, Nums).
board_to_num([x | Board], [1 | Nums]) :- board_to_num(Board, Nums).
    
check_adjacent([], [_]).
check_adjacent([X], [Y1, Y2]) :- X #= Y1 + Y2.
check_adjacent([X | Nums], [Y1, Y2, Y3 | Board]) :- X #= Y1 + Y2 + Y3, check_adjacent(Nums, [Y2, Y3 | Board]).

mines(Nums, Board) :-
    same_length(Nums, Board),
    same_length(Board, Nums2),
    maplist(constrain_nums, Nums),
    maplist(constrain, Nums2),
    check_adjacent(Nums, [0 | Nums2]),
    board_to_num(Board, Nums2).
