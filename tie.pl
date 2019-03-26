prettyprint([]) :- nl.
prettyprint([player(FName, Tie, Giver)|T]) :-
    write(FName), write('s tie is the '),
    write(Tie), write(' tie and was given to him by his '),
    write(Giver), write('.'), nl,
    prettyprint(T).



solve :- 
    tie(N).

tie(N) :- 
    Solution = [ player(_,_,daughter), player(_,_,father-in-law),
                player(_,_,sister), player(_,_,uncle) ],

    member(player(_,happyfaces,_), Solution),
    member(player(_,reindeer,_), Solution),
    member(player(_,cupids,_), Solution), 
    member(player(_,A,daughter), Solution), A\==leprechauns,
    member(player(crow, B, _), Solution), B\== reindeer, B\==happyfaces,
    member(player(speigler, _, C), Solution), C\==uncle,
    member(player(_,D,sister), Solution), D\==happyfaces,
    member(player(E, leprechauns, _), Solution), member(E, [evans, speigler]),
    member(player(F,_, father-in-law), Solution), member(F, [evans, speigler]), E\==F,
    member(player(hurley, _, sister), Solution),
    prettyprint(Solution),
    nl.

