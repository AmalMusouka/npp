:- use_module(library(clpfd)).

all_months(Months) :-
    Months = [jan: 31, feb: 28, mar: 31, apr: 30,
              may: 31, jun: 30, jul: 31, aug: 31,
              sep: 30, oct: 31, nov: 30, dec: 31].

days_before_month(_, [], 0).
days_before_month(M, [ M : _ | _], 0).
days_before_month(M, [H : D | R], T) :-
    dif(H, M),
    days_before_month(M, R, T1),
    T #= T1 + D.

days_from_first(date(D, M), N) :-
    all_months(MM), member(M : MD, MM),
    between(1, MD, D),
    days_before_month(M, MM, T),
    N #= T + D.

add_date(date(D1, M1), N, date(D2, M2)) :-
    days_from_first(date(D1, M1), N1),
    days_from_first(date(D2, M2), N2),
    N #= N2 - N1.
