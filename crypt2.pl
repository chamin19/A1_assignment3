% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Camillia Amin Section 1
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
solve([A,C,H,I,O,R,S,T,W]) :-

    % O and W must be declared first as the calculations required to find S and CA1 
    % depend on O and W, which are needed to calculate all of the following digits and
    % carry digits. O and W are interdependent. In most cases, the carry digits must 
    % be calculated in the line as the regular digits due to order of dependency.

    dig(O), dig(W),  W > 0, dig(S), S > 0,
    S is (W*O) mod 10, CA1 is ((W*O) // 10), 

    % The calculations of T and CA10 depend on CA1, so A and T must be declared next. 
    % O has already been declared
    dig(A), dig(T), T > 0,
    T is (A*O + CA1) mod 10, CA10 is ((A*O + CA1) // 10),

    % The calculations of R and CA100 depend on CA10 and ), which has already been declared
    % A has already been declared as a digit, and its calculation depends on T and CA100 
    dig(R), 
    R is (R*O + CA10) mod 10, CA100 is ((R*O + CA10) // 10),
    A is (T*O + CA100) mod 10, CA1000 is ((T*O + CA100) // 10),

    % W has already been declared, but depends on CA1000, so it must come after CA1000
    % We declare W2 immediately after as it must be equal to W
    W is (S*O + CA1000) mod 10, 
    W2 is (W*T) mod 10, CB1 is (W*T) // 10, 
    W=W2,

    % Dependency for carry digits required for the second set of multiplications
    % CB1000 -> CB100 -> CB10 -> CB1
    % A2 and CB10 depend on A,T and CB1, and must ensure that A = A2
    A2 is (A*T + CB1) mod 10, A=A2, CB10 is (A*T + CB1) // 10, 

    % R2 and CB100 depend on R,T and CB10, and must ensure that R = R2
    R2 is (R*T + CB10) mod 10, R=R2, CB100 is (R*T + CB10) // 10, 

    % T2 and CB1000 depend on T and CB100, and must ensure that T = T2
    T2 is (T*T + CB100) mod 10, T=T2, CB1000 is (T*T + CB100) // 10, 

    % S2 depends on S,T and CB1000, and must ensure that S = S2
    S2 is (S*T + CB1000) mod 10, S=S2,

    % Must ensure that R=R3 
    R3 is (W+T) mod 10, R=R3,

    % CC1 depends on W,T and CB1000, and CC10, CC100, CC1000 depend on CC1, 
    % so CC1 must come first in the 3rd set of calculations 
    CC1 is (W+T) // 10, 

    % I is not depended upon by any other digits and unncessary until the 
    % addition calculations in the last stage
    dig(I), I is (R+A + CC1) mod 10, CC10 is (R+A + CC1) // 10, 
    A3 is (A+R + CC10) mod 10, CC100 is (A+R + CC10) // 10, A=A3, 

    % H is similarly not depended upon by other digits thus comes second to last
    dig(H), H is (W+T + CC100) mod 10, CC1000 is (W+T + CC100) // 10,

    % We reserved the CA10000 for the last carry digit calculation as it is only depended
    % upon by one digit (C)
    CA10000 is ((S*O + CA1000) // 10),
    
    % C is the last digit to be calculated in the equation and depends on CC1000 and the
    % carry digit from the first set of multiplication operations (CA10000)  
    dig(C), C > 0, C is (CA10000 + S + CC1000) mod 10,

    all_diff([A,C,H,I,O,R,S,T,W]).


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