green(frog).        %frog is green
green(grass).       %grass is green  %frog is an atom, green is a predicate(something that is true) whole thing is a fact

animal(frog).       
animal(cow).
animal(dog).

plant(tree).
plant(grass).

alive(X) :- plant(X).
alive(X) :- animal(X). % all animals/plants are alive

capital(prague, czech_rep). % prague is the capital of the czech republic
capital(berlin, germany).

likes(marek, P). %marek likes everyone
likes(P, katka). %everyone likes katka

