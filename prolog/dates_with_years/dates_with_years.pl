:- use_module(library(clpfd)).

all_months(Months) :-
    Months = [jan: 31, feb: 28, mar: 31, apr: 30,
              may: 31, jun: 30, jul: 31, aug: 31,
              sep: 30, oct: 31, nov: 30, dec: 31].

leap(Year, N) :- N #<==> Year mod 400 #= 0 #\/
                 Year mod 4 #= 0 #/\ Year mod 100 #\= 0.

days_through(Y, N) :-
    Y #>= 0, N #>= Y, N #=< Y * 366,
    N #= Y + Y // 4 - Y // 100 + Y // 400.

days_before_month(_, [], 0).
days_before_month(M, [ M : _ | _], 0).
days_before_month(M, [H : D | R], T) :-
    dif(H, M),
    days_before_month(M, R, T1),
    T #= T1 + D.

days_from_first(date(D, jan, _), N) :-
    between(1, 31, D), 
    N #= D.

days_from_first(date(D, feb, Y), N) :-
    leap(Y, L), 
    MD #= 28 + L,
    between(1, MD, D), 
    N #= 31 + D.

days_from_first(date(D, M, Y), N) :-
    all_months(MM), member(M : MD, MM), 
    dif(M, feb), dif(M, jan), leap(Y, L), between(1, MD, D),
    days_before_month(M, MM, T),
    N #= T + D + L.

days_from_beginning(date(D, M, Y), N) :-
    between(1, 9999, Y),
    Y1 #= Y - 1,
    days_through(Y1, YY),
    days_from_first(date(D, M, Y), DD),
    N is YY + DD.


add_date(Date1, N, Date2) :-
    days_from_beginning(Date1, N1),
    days_from_beginning(Date2, N2),
    N #= N2 - N1.
