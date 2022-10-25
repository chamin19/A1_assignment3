% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Camillia Amin 501071556 Section 1
%%%%% NAME: Rudaba Syed Section 1
%%%%% NAME: Mayra Mussarrat Section 1
%
% Add the required atomic propositions and rules in the corresponding sections. 
% If you put the propositions and rules in the wrong sections, you may lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the comment lines below

%%%%% ATOMIC
% Put any atomic statements needed here
dig(1). dig(2). dig(3). dig(4).


%%%%% HELPER PREDICATES
% Put any helper predicates here (leave empty if you do not have any
add(X,Y,Z) :- Z is X+Y.
subt(X,Y,Z) :- Z is X-Y.
subt(X,Y,Z) :- Z is Y-X.
mult(X,Y,Z) :- Z is X*Y.
d(X,Y,Z) :- Z is X//Y.
d(X,Y,Z) :- Z is Y//X.

distinct_values([]).
distinct_values([H|List]) :- not memberList(H,List), distinct_values(List).

memberList(N,[N|L]).
memberList(N,[M|L]) :- memberList(N,L).


%%%%% RULE: solve( ListOfVars )
% Add the rules defining your solve program
% MAKE SURE IT TAKES A LIST AS INPUT, SUCH THAT THAT LIST IS CONTAINS ALL VARIABLES
solve([Row1, Row2, Row3, Row4]) :-

dig(A1), dig(A2), 
subt(A1,A2,1),

dig(A3), dig(A4), 
subt(A3,A4,3),

dig(B1), dig(C1),
mult(B1,C1,12), 

dig(C2), dig(C3),
subt(C2,C3,2),

dig(B2), dig(B3),
d(B2,B3,2), 

dig(B4), dig(C4), 
add(B4,C4,3), 

dig(D1), dig(D2),
subt(D1,D2,3), 

dig(D3), dig(D4), 
subt(D3,D4,1),

Col1 = [A1, A2, A3, A4],
Col2 = [B1, B2, B3, B4],
Col3 = [C1, C2, C3, C4],
Col4 = [D1, D2, D3, D4], 
distinct_values(Col1), distinct_values(Col2), distinct_values(Col3), distinct_values(Col4),

Row1 = [A1, B1, C1, D1], 
Row2 = [A2, B2, C2, D2], 
Row3 = [A3, B3, C3, D3], 
Row4 = [A4, B4, C4, D4],
distinct_values(Row1), distinct_values(Row2), distinct_values(Row3), distinct_values(Row4).

%%%%% RULE: print_solution ( ListOfVars )
%  Add rules the prints your solution in a readable format
% MAKE SURE IT TAKES A LIST AS INPUT, SUCH THAT THAT LIST IS CONTAINS ALL VARIABLES
print_solution([Row1, Row2, Row3, Row4]) :-
solve([Row1, Row2, Row3, Row4]),
write(Row1), nl,
write(Row2), nl,
write(Row3), nl,
write(Row4).

%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
