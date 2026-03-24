find_k(Plain, Encrypted, K) :-
    K is (Encrypted - Plain) mod 26.

decrypt_codes([], _, _, []).
decrypt_codes([C1 | C2], K1, K2, [E1 | E2]) :-
    E1 is (C1 - 97 + K1) mod 26 + 97,
    decrypt_codes(C2, K2, K1, E2).

decrypt_word(E, W, K1, _K2) :-
    string_codes(E, [ECode1]),
    string_codes(W, [UCode1]),
    find_k(UCode1, ECode1, K1).
    
decrypt_word(E, W, K1, K2) :-
    string_codes(E, ECodes),
    string_codes(W, WCodes),
    WCodes = [UCode1, UCode2 | _],
    ECodes = [ECode1, EWord2 | _],
    find_k(UCode1, ECode1, K1),
    find_k(UCode2, EWord2, K2),
    decrypt_codes(WCodes, K1, K2, ECodes).

decrypt_all([], _, [], _, _).
decrypt_all([E1 | E2], Dict, [W1 | W2], K1, K2) :-
    member(W1, Dict),
    decrypt_word(E1, W1, K1, K2),
    decrypt_all(E2, Dict, W2, K1, K2).

decrypt(C, Dict, M) :-
    split_string(C, " ", " ", EWords),
    decrypt_all(EWords, Dict, DWords, _, _),
    atomics_to_string(DWords, " ", M).