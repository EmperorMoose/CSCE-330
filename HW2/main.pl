%main.pl
%PierceMatthews
%Sept152017

:- [movie].

print_query_true(Q) :-
    forall(Q, writeln(true:Q)).

print_query_false(Q) :-
    forall(\+ Q, writeln(false:Q)).

main :-
    writeln("1: Did Leonardo DiCaprio act in Babel?"),
    print_query_true(acted_in(leonardo_dicaprio,babel)),
    print_query_false(acted_in(leonardo_dicaprio,babel)),
    nl,
    writeln("2: Who directed District 9?"),
    print_query_true(directed(neill_blomkamp,district_9)),
    print_query_false(directed(neill_blomkamp,district_9)),
    nl,
    writeln("3: Did anyone act in both Click and The Aviator?"),
    print_query_true(acted_in(kate_beckinsale,X)),
    print_query_false(acted_in(kate_beckinsale,X)),
    nl,
    writeln("4: Was there a movie released in 2010 that did not star Jennifer Anniston?"),
    print_query_true((actedin(X,Y), \+ released(y,2010))),
    print_query_false((actedin(X,Y), \+ released(y,2010))),
    nl,
    writeln("5: Who directed movies released in 2009?"),
    print_query_true((directed(X,Y), \+ released(Y,2009))),
    print_query_false((directed(X,Y), \+ released(Y,2009))),
    nl,
    writeln("6: Has anyone directed more than one movie?"),
    print_query_true((directed(X,Y),directed(X,Z), \+ Y=Z)),
    print_query_false((directed(X,Y),directed(X,Z), \+ Y=Z)),
    nl,
    writeln( "7. Does any movie have more than one director?"),
    print_query_true((directed(X,Z),directed(Y,Z), \+ Y=X)),
    print_query_false((directed(X,Z),directed(Y,Z), \+ Y=X)),
    nl,
    writeln( "8. Has anyone acted in more than one movie released in 2008?"),
    print_query_true((acted_in(X,Y),acted_in(X,Z), \+ Y=Z,released(Z,2008),released(Y,2008))),
    print_query_false((acted_in(X,Y),acted_in(X,Z), \+ Y=Z,released(Z,2008),released(Y,2008))),
    nl,
    writeln( "9. Has anyone acted in more than two movies in the same year?"),
    print_query_true((acted_in(X,Y),acted_in(X,Z),acted_in(X,W), \+ Y=Z, \+ Y=W, \+ W=Z,released(Y,A),released(Z,A),released(W,A))),
    print_query_false((acted_in(X,Y),acted_in(X,Z),acted_in(X,W), \+ Y=Z, \+ Y=W, \+ W=Z,released(Y,A),released(Z,A),released(W,A))),
    nl,
    writeln( "10. Who has worked with the same director in different years?"),
    print_query_true((acted_in(X,Z),acted_in(Y,W),X=Y,directed(A,Z),directed(B,W),A=B,released(Z,C),released(W,D), \+C=D)),
    print_query_false((acted_in(X,Z),acted_in(Y,W),X=Y,directed(A,Z),directed(B,W),A=B,released(Z,C),released(W,D), \+C=D)),
    nl,
    halt.
