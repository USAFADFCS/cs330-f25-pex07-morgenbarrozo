% pex5.pl
% USAFA UFO Sightings 2024
%
% name: Morgen Barrozo
%
% Documentation: I used pre-flight and presentations from Lesson 31-33 to help me write my code and understand concepts in Prolog. 
% I also used my code in HW7 to give the outline for this pex. 
%

% The query to get the answer(s) or that there is no answer
% My query resulted in no answer. 
% ?- solve.

cadet(smith).
cadet(jones).
cadet(garcia).
cadet(chen).

obj(cloud).
obj(fighter).
obj(kite).
obj(balloon).

day(tue).
day(wed).
day(thur).
day(fri).

solve :-
    cadet(tueC), cadet(wedC), cadet(thurC), cadet(friC),
    all_different([tueC, wedC, thurC, friC]),
    
    obj(tueO), obj(wedO), obj(thurO), obj(friO),
    all_different([tueO, wedO, thurO, friO]),
    
    Triples = [ [tue,   tueC,   tueO],
                [wed,   wedC,   wedO],
                [thur,    thurC,    thurO],
                [fri, friC, friO] ],
    
    
    \+ member([_, garcia, kite], Triples),
    
    \+ member([_, smith,    balloon], Triples),
    \+ member([_, smith, kite], Triples),
    
    \+ member([tue, _, kite], Triples),
    
    \+ member([wed, _, balloon], Triples),
    
    \+member([_, garcia, balloon], Triples),
    \+member([_, jones, balloon], Triples),
    
    member([_, smith, cloud], Triples),
    
    member([fri, _, fighter], Triples),
    
    
    
    tell(tue, tueC, tueO),
    tell(wed, wedC, wedO),
    tell(thur, thurC, thurO),
    tell(fri, friC, friO).

all_different([H | T]) :- member(H, T), !, fail.
all_different([_ | T]) :- all_different(T).
all_different([_]).


tell(Day, Cadet, Object) :-
    write(Day), write(Cadet), write(Object), nl.
  

