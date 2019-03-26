%
% rev/2, reverse a list
% rev([1,2,3], [3,2,1]). is true
%
% base case
% The reverse of an empty list is the empty list.
rev([], []).
    
% recursive case
% The reverse of a list is the result of appending the reverse of the tail
%   with the head (we'll need an append rule, see below).
rev([Head|Tail], Output):- 
    rev(T, RevT), app(RevT, [Head], Output).

%
% app/3 - append two lists together
%
% app([1,2,3], [a,b,c], [1,2,3,a,b,c]).
%
% base case 1
% Appending two empty lists results in an empty list.
app([], [], []).

% base case 2
% Appending an empty list with a list results in the list.
app([], List, List).

% base case 3
% Appending a list with an empty list results in the list.
app(List, [], List).

% recursive case
% Appending a list separated into head and tail with a second list, L2,
% results in a list whose head is L1's head and whose tail is the
% recursive result of appending L1's tail with L2.

app([Head|Tail],List2, [Head|Result]):- app(Tail, List2, Result).
%app([Head|Tail],List2, FinalResult):- app(Tail, List2, Result),
%                                      FinalResult = [Head|Result].
%
