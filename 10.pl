%предикат, позволяющий получать элемент списка по его номеру
q([X|_],1,X):-!.		%элемент находится в голове
q([_|T],N,Y):-		%Поиск элемента в теле, если он не в голове
    N1 is N-1,
    q(T,N1,Y).


s([],0,0,_,_,[]). %когда список становится пустым

s([X|T],0,0,_,_,[X|K]):- %после замены двух элементов прокручиваем список до конца
    s(T,0,0,_,_,K),!.

s([_|T],0,1,S,P,[S|K]):- %J=1, то записываем вместо Jго элемента элемент S и зануляем J
    s(T,0,0,S,P,K),!.

s([X|T],0,J,S,P,[X|K]):- %когда уже заменили Iтый элемент, пропускаем элементы до тех пор, пока J не дойдет до 1
    J>1,
    J1 is J-1,
    s(T,0,J1,S,P,K),!.

s([_|T],1,J,S,P,[P|K]):- %I=1, то записываем вместо Iтого элемента элемент P и зануляем I
    J1 is J-1,
    s(T,0,J1,S,P,K),!.
    
s([_|T],I,J,S,P,[_|K]):- %пропускаем элементы, записывая их в список до тех пор, пока счетчик I не дойдет до 1
    I>1,
    I1 is I-1,
    J1 is J-1,
    s(T,I1,J1,S,P,K),!.
    

p(A,I,J,A1):- %начально вызываемый предикат
    q(A,I,S), %находим элемент с 1 индексом
    q(A,J,P), %находим элемент с 2 индексом
    s(A,I,J,S,P,A1).