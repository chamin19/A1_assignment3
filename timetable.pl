% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: 
%%%%% NAME:
%%%%% NAME:
%
% Add the required atomic propositions and rules in the corresponding sections. 
% If you put the propositions and rules in the wrong sections, you may lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the comment lines below

%%%%% ATOMIC
% Put any atomic statements needed here

dance([[fri,1], [fri,2], [fri,3]]).
art([[mon,10], [wed,10], [fri,10]]).
art([[mon,11], [wed,11], [fri,11]]).
math([[mon,11], [wed,3], [fri,3]]).
math([[mon,2], [wed,2], [fri,11]]).
compsci([[mon,11], [wed,11], [fri,12]]).
compsci([[mon,12], [wed,12], [wed,3]]).
lunch([mon,12]).
lunch([mon,1]).
lunch([wed,12]).
lunch([wed,1]).
lunch([fri,12]).
lunch([fri,1]).
    


%%%%% HELPER PREDICATES
% Put any helper predicates here (leave empty if you do not have any)

notMember([],L).
notMember([H|T],L) :- \+ member(H,L), notMember(T,L).



%%%%% RULE: solve( ListOfVars )
% Add the rules defining your solve program
% MAKE SURE IT TAKES A LIST AS INPUT, SUCH THAT THAT LIST IS CONTAINS ALL VARIABLES

solve([Dance,Art,Math,Compsci,Mon,Wed,Fri]) :- dance(Dance), art(Art), math(Math), compsci(Compsci), lunch([mon, Mon]),lunch([wed, Wed]), lunch([fri, Fri]), notMember(Math,Art), notMember(Compsci,Art), notMember(Compsci,Math), \+ member([mon,Mon],Dance), \+ member([mon,Mon],Compsci), \+ member([mon,Mon],Math), \+ member([mon,Mon],Art), \+ member([wed,Wed],Dance), \+ member([wed,Wed],Compsci), \+ member([wed,Wed],Math), \+ member([wed,Wed],Art), \+ member([fri,Fri],Dance), \+ member([fri,Fri],Compsci), \+ member([fri,Fri],Math), \+ member([fri,Fri],Art).




%%%%% RULE: print_solution ( ListOfVars )
%  Add rules the prints your solution in a readable format
% MAKE SURE IT TAKES A LIST AS INPUT, SUCH THAT THAT LIST IS CONTAINS ALL VARIABLES

print_solution(List) :- solve([Dance,Art,Math,Compsci,Mon,Wed,Fri]), write('Art: '), write(Art), nl, write('Math: '), write(Math), nl, write('Compsci: '), write(Compsci), nl, write('Dance: '), write(Dance), nl, write('Monday lunch :'), write(Mon), nl, write('Wednesday lunch :'), write(Wed), nl, write('Friday lunch: '), write(Fri).



%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
