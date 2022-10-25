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
split_num_op(R, X, Y):- split_string(R, '\s', '\s', [H,T]), atom_number(H, X), Y=T.

uniq(W,X,Y,Z) :- dig(W), dig(X), \+ W=X,
    			 dig(Y), \+ W=Y, \+ X=Y,
                 dig(Z), \+ W=Z, \+ X=Z, \+ Y=Z.


add(X,Y,Z) :- dig(X), dig(Y), X+Y =:= Z.
sub(X,Y,Z) :- dig(X), dig(Y), X>Y, X-Y =:= Z.
sub(X,Y,Z) :- dig(X), dig(Y), Y>X, Y-X =:= Z.
mul(X,Y,Z) :- dig(X), dig(Y), X*Y =:= Z.
div(X,Y,Z) :- dig(X), dig(Y), X>Y, X//Y =:= Z.
div(X,Y,Z) :- dig(X), dig(Y), Y>X, Y//X =:= Z.

% gets number and operator from the input and calculates output number 1 and 2 that result in the value N.
calculation(N, O, On1, On2) :- O="+", add(On1,On2,N).
calculation(N, O, On1, On2) :- O="-", sub(On1,On2,N).
calculation(N, O, On1, On2) :- O="*", mul(On1,On2,N).
calculation(N, O, On1, On2) :- O="/", div(On1,On2,N).



%%%%% RULE: solve( ListOfVars )
% Add the rules defining your solve program
% MAKE SURE IT TAKES A LIST AS INPUT, SUCH THAT THAT LIST IS CONTAINS ALL VARIABLES

% this is wrong
kenken([H|T]) :- split_num_op(H, N, O), calculation(H, N, On1,On2), write(On1), nl, write(On2), nl, kenken(T).

%%%%% RULE: print_solution ( ListOfVars )
%  Add rules the prints your solution in a readable format
% MAKE SURE IT TAKES A LIST AS INPUT, SUCH THAT THAT LIST IS CONTAINS ALL VARIABLES



%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
