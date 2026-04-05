% Exercise 2.1 - new succession rule
% birth order only, gender ignored

parent(queen_elizabeth, prince_charles).
parent(queen_elizabeth, princess_ann).
parent(queen_elizabeth, prince_andrew).
parent(queen_elizabeth, prince_edward).

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

precedes_new(A, B) :-
    child_of_queen(A),
    child_of_queen(B),
    birth_order(A, OA)
    birth_order(B, OB),
    OA < OB.

new_succession_rank(Person, Rank) :-
    child_of_queen(Person),
    findall(X, precedes_new(X, Person), L),
    length(L, N),
    Rank is N+1.

