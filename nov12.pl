% Length of a list method. 

% base case, the length of an empty list should be zero. 
len([],0).

% recursive case, breaks to input list into a head and tail
len([Head|Tail], LenOfL):- len(Tail, LenOfT),
                     
                     % total length is the length of L plus the Length of the tail recursed. 
                     LenOfL is LenOfT + 1.

% factorial method

% factorial of 0 is one.
fact(0,1).

fact(N, NFact):- 
% make sure N is greater than 0
N>0,

% decrement N and store it in N1
N1 is N - 1,

% recurse on the smaller number
fact(N1, N1Fact),

% preform the computation
Nfact is N * N1Fact.


% member function

% base case, X is a member if it is in the list, 
% we compare it to the head of the list. 
mem(X, [X|_]).

% recursive case, break the list up and recurse on the tail, funciton 
% will stop when X is equal to the head. 
mem(X, [_|Tail]):- member(X, Tail).

% index funciton

% the index is 0 if it is at the head of the list. 
index(Element,[Element|_], 0).                

% recursive case, If the element is not the head, we recurse on the tail.
% We use the same Element variable of course, but need a new Index1 variable. 
index(Element, [_|Tail], Index):- index(Element, Tail, Index1),
                                  Index is Index1 + 1.
              
              
