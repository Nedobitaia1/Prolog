l([], 0).
l([_|T], L) :- 
    l(T, L_T),
    L is  L_T + 1. %определение размера списка


p([],_,[]):- 
    !.

p([_|St],Y,F):- %пропуск остальных значений
    Y =< 0,
    p(St,Y,F),!.


p([X|St],Y,[X|St1]):- %запись нужного количества значений в новый список
    Y > 0,
    Y1 is Y-1,
    p(St,Y1,St1);
    !.

q(A,X,A1):-
    l(A,P),
    Y is P-X, %размер нужного нам списка
    p(A,Y,A1),
    !.
   
   % ?-q([1,4,2,3,8],3,[3,8]). false
   % ?-q([1,4,2,3,8],2,L1). L1=[1,4,2]
