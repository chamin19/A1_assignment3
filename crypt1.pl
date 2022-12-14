%%%%% ATOMIC
% Put any atomic statements needed here
dig(0). dig(1). dig(2). dig(3).  dig(4).
dig(5). dig(6). dig(7). dig(8).  dig(9).


%%%%% HELPER PREDICATES
% Put any helper predicates here (leave empty if you do not have any)
all_diff([]).
all_diff([N|L]) :- not memberList(N,L), all_diff(L).

memberList(N,[N|L]).
memberList(N,[M|L]) :- memberList(N,L).


%%%%% RULE: solve( ListOfVars )
% Add the rules defining your solve program
% MAKE SURE IT TAKES A LIST AS INPUT, SUCH THAT THAT LIST IS CONTAINS ALL VARIABLES

solve([A,C,H,I,O,R,S,T,W]) :-
    % generate
    dig(A), dig(C), dig(H), dig(I), dig(O), dig(R), 
    dig(S), dig(T), dig(W), 
    C > 0, S > 0,  T > 0, W > 0, 
    S=S2, T=T2, R=R2, R=R3, A=A2, A=A3, W=W2,

    % test
    S is (W*O) mod 10, CA1 is ((W*O) // 10), 
    T is (A*O + CA1) mod 10, CA10 is ((A*O + CA1) // 10), 
    R is (R*O + CA10) mod 10, CA100 is ((R*O + CA10) // 10), 
    A is (T*O + CA100) mod 10, CA1000 is ((T*O + CA100) // 10),
    W is (S*O + CA1000) mod 10, CA10000 is ((S*O + CA1000) // 10),
    
    W2 is (W*T) mod 10, CB1 is (W*T) // 10, 
    A2 is (A*T + CB1) mod 10, CB10 is (A*T + CB1) // 10, 
    R2 is (R*T + CB10) mod 10, CB100 is (R*T + CB10) // 10, 
    T2 is (T*T + CB100) mod 10, CB1000 is (T*T + CB100) // 10,
    S2 is (S*T + CB1000) mod 10, CB10000 is (S*T + CB1000) // 10, 

    R3 is (W+T) mod 10, CC1 is (W+T) // 10, 
    I is (R+A + CC1) mod 10, CC10 is (R+A + CC1) // 10, 
    A3 is (A+R + CC10) mod 10, CC100 is (A+R + CC10) // 10, 
    H is (W+T + CC100) mod 10, CC1000 is (W+T + CC100) // 10,
    C is (CA1000+S + CC1000) mod 10, CC10000 is (S*T + CC1000) // 10,
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