d(X,Y,Z1):-
    Y==0,Z1 is X,!; 
    X1 is X mod Y, 
    opr(X1,Y,Z1).

q(X,Y,Z1):-
    X==0,Z1 is Y,!;
    Y1 is Y mod X,
    opr(X,Y1,Z1).

opr(X, Y, Z1):-
    X>Y,			%если x>y, то вызывается предикат d, иначе q, высчитываем НОД
    d(X,Y,Z1),!;
    q(X,Y,Z1),!.
        
p(X, Y, Z):-
    opr(X, Y, Z1),
    Z is (X*Y)/Z1. %высчитывание НОК
    
 % ?- p(2,5,Z). Z=6
 % ?- p(3,2,5). false