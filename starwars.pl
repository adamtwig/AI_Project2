:- dynamic human/1.

human(vader).
human(luke).
human(leah).
human(hans).
wookiee(chewy).
sibling(luke, leah).
sibling(leah, luke).
copilot(chewy,hans).
father(vader,luke).
father(vader,leah).

alliance(vader, empire).
alliance(emperor, empire).
alliance(luke, rebels).
alliance(leah, rebels).
alliance(hans, rebels).
alliance(chewy, rebels).
alliance(lars, independent).
flipsAlliance(vader).
flipsAlliance(lars).


good(X) :- alliance(X,rebels).
%turnsGood(X) :- X=vader.
turnsGood(X) :- alliance(X,empire),flipsAlliance(X).

print_solution :-
write('who are humans?'), nl,
bagof(X,human(X), Query1),
write(Query1), nl,
write('Who gets the IRS Child Tax Credit, and for whom?'), nl,
setof((F,C),father(F,C), Query2),
write(Query2), nl.
