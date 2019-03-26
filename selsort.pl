%
% Selection Sort
%

selsort(UnsortedList, SortedList) :-
  min(UnsortedList, Min),
  remove(UnsortedList, Min, SmallerUnsortedList),
  selsort(SmallerUnsortedList, SmallerSortedList),
  SortedList = [Min | SmallerSortedList ].


% min([2,3,4], 2).
% min([2,1,3,4], 1).
% min([5], 5).
% HINT: make "assumption" that first item is the smallest
min([Head|Tail], X) :-
    X < Head,
    min(Tail, X).

min([Head|Tail], X):-
    X == Head,
    min(Tail, X).

min([], X).
% remove([2,3,4], 2, [3,4]).
% remove([2,3,4], 3, [2,4]).
remove([Head|Tail], Target, Output):-
    Head == Target,
    remove(Tail, Target, Output).

remove([Head|Tail], Target, Output):-
   remove(Tail, Target, [Head|Output]).

remove([],_,Output).
