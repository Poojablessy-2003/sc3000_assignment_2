% Exercise 2.1 - old succession rule
% gender wise order, males first, then females; within each group by
% birth order

parent(queen_elizabeth, prince_charles).
parent(queen_elizabeth, princess_ann).
parent(queen_elizabeth, prince_andrew).
parent(queen_elizabeth, prince_edward).

female(queen_elizabeth).
male(prince_charles).
female(princess_ann).
male(prince_andrew).
male(prince_edward).

birth_order(prince_charles, 1).
birth_order(princess_ann, 2).
birth_order(prince_andrew, 3).
birth_order(prince_edward, 4).

child_of_queen(X) :-
    parent(queen_elizabeth, X).

precedes_old(A, B) :-
    child_of_queen(A),
    child_of_queen(B),
    male(A),
    female(B),
    A \= B.

precedes_old(A, B) :-
    child_of_queen(A),
    child_of_queen(B),
    male(A),
    male(B),
    birth_order(A, OA),
    birth_order(B, OB),
    OA < OB.

precedes_old(A, B) :-
    child_of_queen(A),
    child_of_queen(B),
    female(A),
    female(B),
    birth_order(A, OA),
    birth_order(B, OB),
    OA < OB.

old_succession_rank(Person, Rank) :-
    child_of_queen(Person),
    findall(X, precedes_old(X, Person), L),
    length(L, N),
    Rank is N+1.

show_old_succession :-
    setof(R-P, old_succession_rank(P, R), L),
    forall(member(R-P, L), format('Rank ~w: ~w~n', [R, P])).
