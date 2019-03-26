%%  base case %%
myflatten([],[]).

%% recursive case %%
myflatten([H|T], Output) :-
    append(H, Concat),
    myflatten(T, Concat).
