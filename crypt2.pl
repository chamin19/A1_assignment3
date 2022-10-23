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
dig(0). dig(1). dig(2). dig(3).  dig(4).
dig(5). dig(6). dig(7). dig(8).  dig(9).


%%%%% HELPER PREDICATES
% Put any helper predicates here (leave empty if you do not have any
all_diff([]).
all_diff([N|L]) :- not memberList(N,L), all_diff(L).

memberList(N,[N|L]).
memberList(N,[M|L]) :- memberList(N,L).


%%%%% RULE: solve( ListOfVars )
% Add the rules defining your solve program
% MAKE SURE IT TAKES A LIST AS INPUT, SUCH THAT THAT LIST IS CONTAINS ALL VARIABLES



%%%%% RULE: print_solution ( ListOfVars )
%  Add rules the prints your solution in a readable format
% MAKE SURE IT TAKES A LIST AS INPUT, SUCH THAT THAT LIST IS CONTAINS ALL VARIABLES
print_solution([A,C,H,I,O,R,S,T,W]) :- 
solve([A,C,H,I,O,R,S,T,W]),

write('A'), write(' = '), write(A), write('    |    '), write(' '), write(' '), write(' '), write(S),   write(T),   write(R),   write(A),  write(W), nl,
write('C'), write(' = '), write(C), write('    |    '), write('*'), write(' '), write(' '), write(' '), write(' '), write(' '), write(T),  write(O), nl,
write('H'), write(' = '), write(H), write('    |    '), write(' '), write(' '), write('-'), write('-'), write('-'), write('-'), write('-'), write('-'), nl,
write('I'), write(' = '), write(I), write('    |    '), write(' '), write(' '), write(' '), write(W),   write(A),   write(R),   write(T),  write(S), nl,
write('O'), write(' = '), write(O), write('    |    '), write('+'), write(' '), write(S),   write(T),   write(R),   write(A),  write(W), write(' '), nl,
write('R'), write(' = '), write(R), write('    |    '), write(' '), write('-'), write('-'), write('-'), write('-'), write('-'), write('-'), write('-'), nl,
write('S'), write(' = '), write(S), write('    |    '), write(' '), write(' '), write(C), write(H), write(A), write(I), write(R), write(S), nl,
write('T'), write(' = '), write(T), write('    |    '), nl,
write('W'), write(' = '), write(W), write('    |    '), nl.


%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW