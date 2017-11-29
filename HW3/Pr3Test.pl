%APierceMatthews
%PR3
%CSCE330
$Oct081017

%europe map coloring problem -- use these colors as the domain
color(red).  color(blue).   color(yellow).

color (red).
color(blue).
color(yellow).

solution(Fr,Sw,It,Be,Ho,Ge,Au) :-
color(Fr), color(Sw), color(It), color(Be), color(Ho), color(Ge), color(Au),
\+ Fr=Sw, \+ Fr=It, \+ Sw=It, \+ Sw=Be, \+ Be=It, \+ Sw=Ho, \+ Sw=Ge, \+ Be=Ho, \+ Be=Au, 
\+ Ho=Ge, \+ Ho=Au, \+ Ge=Au. 


europe_color(Fr,Sw,It,Be,Ho,Ge,Au):- solution(Fr,Sw,It,Be,Ho,Ge,Au), nl,
  write('Country Fr is colored '), write(Fr), nl,
  write('Country Sw is colored '), write(Sw), nl,
  write('Country It is colored '), write(It), nl,
  write('Country Be is colored '), write(Be), nl,
  write('Country Ho is colored '), write(Ho), nl,
  write('Country Ge is colored '), write(Ge), nl,
  write('Country Au is colored '), write(Au), nl.

cryptarithmetic(C,R,O,S,A,D,N,G,E):-
  uniqueDigits(C,R,O,S,A,D,N,G,E), C > 0, R > 0,
  R is (S+S) mod 10, C1 is (S+S) //10,
  E is (S+D+C1) mod 10, C10 is (S+D+C1) //10,
  G is (O+A+C10) mod 10, C100 is (O+A+C10) //10,
  N is (R+O+C100) mod 10, C1000 is (R+O+C100) //10,
  A is (C+R+C1000) mod 10, D is (C+R+C1000) //10.

uniqueDigits(C,R,O,S,A,D,N,G,E):-
  dig(C), dig(R), dig(O), dig(S), dig(A), dig(D), dig(N), dig(G), dig(E),
  \+ C=R, \+ C=O, \+ C=S, \+ C=A, \+ C=D, \+ C=N, \+ C=G, \+ C=E,
  \+ R=O, \+ R=S, \+ R=A, \+ R=D, \+ R=N, \+ R=G, \+ R=E, \+ O=S,
  \+ O=A, \+ O=D, \+ O=N, \+ O=G, \+ O=E, \+ S=A, \+ S=D, \+ S=N,
  \+ S=G, \+ S=E, \+ A=D, \+ A=N, \+ A=G, \+ A=E, \+ D=N, \+ D=G,
  \+ D=E, \+ N=G, \+ N=E, \+ G=E.

dig(0).  dig(1).  dig(2).  dig(3).  dig(4).
dig(5).  dig(6).  dig(7).  dig(8).  dig(9).


%Persons are just their names, lower case
pos(1). pos(2). pos(3). pos(4).
who_ordered_pizza(PizzaPerson):- 
%=hints=%
	%across
	across(Donna,Doreen), 
	across(Danny,David),
	across(Lasagna,Milk),
	%equals
	Chicken=Coke, 
	Donna=Water, 
	%Three list: people, meals, drinks
	uniq_pos(Donna,Danny,David,Doreen),
	uniq_pos(Steak,Lasagna,Chicken,Pizza),
	uniq_pos(Coke,Milk,Water,Coffee),
	%beside
	beside(Doreen,Steak),

	\+ Danny=Steak,
	\+ David=Coffee.	

%=predicates=%
 uniq_pos(P1,P2,P3,P4) :-
 	pos(P1), pos(P2), pos(P3), pos(P4),
 	\+ P1=P2, \+ P1=P3, \+ P1=P4, \+ P2=P3, \+ P2=P4, \+ P3=P4.

 beside(1,2). beside(3,4). across(1,3). across(2,4).

 next_to(X,Y) :- beside(X,Y).
 next_to(X,Y) :- beside(Y,X).

 across_from(X,Y) :- across(X,Y).
 across_from(X,Y) :- across(Y,X).


score(S):- scoreQ2(S2),scoreQ3(S3),scoreQ4(S4),
	S is S2+S3+S4,
	write('Score Q2 = '),write(S2),nl,
	write('Score Q3 = '),write(S3),nl,
	write('Score Q4 = '),write(S4),nl,
	write('Your Scrore is '),write(S),write(' + partial credit'),nl,
	write('Also, remember that if the cryptarithmetic takes more than a second, there will be a penalty').

scoreQ2(S):-findall([Fr,Sw,It,Be,Ho,Ge,Au],europe_color(Fr,Sw,It,Be,Ho,Ge,Au),Countries),
	                 TRUEs=[[blue,red,yellow,red,blue,yellow,blue],[blue,yellow,red,yellow,blue,red,blue],[red,blue,yellow,blue,red,yellow,red],[red,yellow,blue,yellow,red,blue,red],[yellow,blue,red,blue,yellow,red,yellow],[yellow,red,blue,red,yellow,blue,yellow]],
			 sort(Countries,SCountries),
			 ((SCountries=TRUEs,S is 30) ; (\+ SCountries = TRUEs,S is 0)).

scoreQ3(S):-findall([C,R,O,S,A,D,N,G,E],cryptarithmetic(C,R,O,S,A,D,N,G,E),Solutions),
	                 TRUEs=[[9,6,2,3,5,1,8,7,4]],
			 sort(Solutions,SSolutions),
			 ((SSolutions=TRUEs,S is 30) ; (\+ SSolutions = TRUEs,S is 0)).


scoreQ4(S):-findall([PP],who_ordered_pizza(PP),Solutions),
	                 TRUEs=[[donna]],
			 sort(Solutions,SSolutions),
			 ((SSolutions=TRUEs,S is 40) ; (\+ SSolutions = TRUEs,S is 0)).
