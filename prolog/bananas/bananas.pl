position(a). 
position(b). 
position(c). 
position(d).

action(go(P), [M, B1, B2, Ban], [P, B1, B2, Ban]) :- 
    position(M), position(P), dif(M, P).

action(push(box1, P), [M, M, B2, Ban], [P, P, B2, Ban]) :-
    position(M), position(P), dif(M, P).

action(push(box2, P), [M, B1, M, Ban], [P, B1, P, Ban]) :-
    position(M), position(P), dif(M, P), position(B1).

action(push(box2, P), [M, stacked, M, Ban], [P, stacked, P, Ban]) :-
    position(M), position(P), dif(M, P).

action(stack, [M, M, M, Ban], [M, stacked, M, Ban]) :- position(M).

action(unstack, [M, stacked, M, Ban], [M, M, M, Ban]) :- position(M).

action(climb_on_1, [M, M, B2, Ban], [on_box1, M, B2, Ban]) :- position(M), position(B2).

action(climb_on_1, [M, stacked, M, Ban], [on_box1, stacked, M, Ban]) :- position(M).

action(climb_off_1, [on_box1, B1, B2, Ban], [B2, B1, B2, Ban]) :- position(B2).

action(grab, [on_box1, stacked, d, no], [on_box1, stacked, d, yes]).

not_member(_, []).
not_member(X, [H | T]) :- dif(X, H), not_member(X, T).

search(State, _, []) :- State = [_, _, _, yes].
search(State, Visited, [Action | Rest]) :-
    action(Action, State, NewState),
    not_member(NewState, Visited),
    search(NewState, [NewState | Visited], Rest).

solve(P) :-
    InitialState = [a, b, c, no],
    search(InitialState, [InitialState], P).