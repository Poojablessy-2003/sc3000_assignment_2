% Exercise 2.2 - new succession rule
% birth order only, gender ignored

% Parent relationships for the four children in scope.
parent(queen_elizabeth, prince_charles).
parent(queen_elizabeth, princess_ann).
parent(queen_elizabeth, prince_andrew).
parent(queen_elizabeth, prince_edward).

% Gender facts (kept for completeness, though new rule ignores gender).
female(queen_elizabeth).
male(prince_charles).
female(princess_ann).
male(prince_andrew).
male(prince_edward).

% Birth order: smaller number means older child.
birth_order(prince_charles, 1).
birth_order(princess_ann, 2).
birth_order(prince_andrew, 3).
birth_order(prince_edward, 4).

% Restrict queries to children of Queen Elizabeth.
child_of_queen(X) :-
    parent(queen_elizabeth, X).

% New rule: precedence depends only on birth order.
precedes_new(A, B) :-
    child_of_queen(A),
    child_of_queen(B),
    birth_order(A, OA),
    birth_order(B, OB),
    OA < OB.

% Rank is one plus the number of people who precede the person.
new_succession_rank(Person, Rank) :-
    child_of_queen(Person),
    findall(X, precedes_new(X, Person), L),
    length(L, N),
    Rank is N+1.

% Print succession line as "Rank <n>: <name>".
show_new_succession :-
    setof(R-P, new_succession_rank(P, R), L),
    forall(member(R-P, L), format('Rank ~w: ~w~n', [R, P])).
