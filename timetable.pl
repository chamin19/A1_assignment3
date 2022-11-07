dance([[fri,1], [fri,2], [fri,3]]).
art([[mon,10], [wed,10], [fri,10]]). art([[mon,11], [wed,11], [fri,11]]).
math([[mon,11], [wed,3], [fri,3]]). math([[mon,2], [wed,2], [fri,11]]).
compsci([[mon,11], [wed,11], [fri,12]]). compsci([[mon,12], [wed,12], [wed,3]]).
lunch([[mon,12],[wed,12],[fri,12]]). lunch([[mon,1],[wed,1],[fri,1]]).
lunch([[mon,12],[wed,12],[fri,1]]). lunch([[mon,12],[wed,1],[fri,12]]). lunch([[mon,1],[wed,12],[fri,12]]).  
lunch([[mon,12],[wed,1],[fri,1]]). lunch([[mon,1],[wed,12],[fri,1]]). lunch([[mon,1],[wed,1],[fri,12]]).  


%%%%% HELPER PREDICATES
% Put any helper predicates here (leave empty if you do not have any)
notMember([],L).
notMember([H|T],L) :- not memberList(H,L), notMember(T,L).

memberList(N,[N|L]).
memberList(N,[M|L]) :- memberList(N,L).

getDay([D1,D2,D3],D1,D2,D3). 


%%%%% RULE: solve( ListOfVars )
% Add the rules defining your solve program
% MAKE SURE IT TAKES A LIST AS INPUT, SUCH THAT THAT LIST IS CONTAINS ALL VARIABLES

solve([Dance,Art,Math,Compsci,Lunch]) :- 
lunch(Lunch), compsci(Compsci), 
notMember(Compsci,Lunch),
art(Art), 
notMember(Compsci,Art), notMember(Art,Lunch), 
math(Math), 
notMember(Math,Art), notMember(Math,Compsci), notMember(Math,Lunch), 
dance(Dance), 
notMember(Dance, Lunch).


%%%%% RULE: print_solution ( ListOfVars )
%  Add rules the prints your solution in a readable format
% MAKE SURE IT TAKES A LIST AS INPUT, SUCH THAT THAT LIST IS CONTAINS ALL VARIABLES

print_solution([Dance,Art,Math,Compsci,Lunch]) :- 
solve([Dance,Art,Math,Compsci,Lunch]), 

getDay(Art,Art1,Art2,Art3), 
getDay(Math,Math1,Math2,Math3), 
getDay(Lunch,Lunch1,Lunch2,Lunch3),
getDay(Dance,Dance1,Dance2,Dance3), 
getDay(Compsci,Compsci1,Compsci2,Compsci3),

nl,
write('     Subject      |   Hour 1   |   Hour 2   |   Hour 3  '), nl,
write('                  | [day,time] | [day,time] | [day,time] '), nl,
write('------------------|------------|------------|-------------'), nl, 
write(' Art              | '), write(Art1), write('  | '), write(Art2), write('  | '), write(Art3), nl,
write(' Math             | '), write(Math1), write('   | '), write(Math2), write('   | '), write(Math3), nl,
write(' Computer Science | '), write(Compsci1), write('  | '), write(Compsci2), write('  | '), write(Compsci3), nl,
write(' Dance            | '), write(Dance1), write('   | '), write(Dance2), write('   | '), write(Dance3), nl,
write(' Lunch            | '), write(Lunch1), write('   | '), write(Lunch2), write('   | '), write(Lunch3), nl.

%%%%% END