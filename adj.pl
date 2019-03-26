%% base case %%
adj([],[]).

%% recursive case %%
adj([One, Two], [Oneone, Twotwo |T2]) :-
    One == Oneone, Two == Twotwo.
%% If One is not equal to Oneone, we want to get ride of Oneone and recurse %%    
adj([One, Two], [Oneone, Twotwo |T2]) :-
    One \== Oneone, adj([One, Two], [Twotwo|T2]).
%% If One is equal, we need to check Two, and if Two is not equal to 
%% Twotwo then we want to discard One and recurse.
adj([One, Two |T], [Oneone, Twotwo |T2]) :-
    Two \== Twotwo, adj([One, Two], [Twotwo|T2]).


