
%COMIENZO
estado_emocional:-
    hipotesis(Enfermedad),
	write('Al parecer esta experimentando'),
	write(Enfermedad),
	nl,
	write('¿ALguna otra consulta?'),
  	deshacer.




hipotesis(felicidad):- felicidad.
hipotesis(tristeza):- tristeza.
hipotesis(aburrimiento):- aburrimiento.
hipotesis(orgullo):- orgullo.
hipotesis(preocupación):- preocupación.
hipotesis(depresión):- depresión.
hipotesis(miedo):- miedo.
hipotesis(ansiedad):- ansiedad.
hipotesis(animación):-animación.


felicidad:-
    verificar(postura_erguida),
    verificar(movmientos_rapidos),
    verificar(circulo_social_grande),
    verificar(trabajo_agradable).

tristeza:-
    verificar(postura_encorvada),
    verificar(movimientos_lentos),
    verificar(circulo_social_chico),
    verificar(trabajo_estresante).
    
aburrimiento:-
    verificar(postura_encorvada),
    verificar(movimientos_lentos),
    verificar(circulo_social_pequeño),
    verificar(boztezos).
    
orgullo:-
    verificar(postura_erguida),
    verificar(movimientos_seguros),
    verificar(trabajo_agradable),
    verificar(a).
preocupación:-
    verificar(postura_encorvada),
    verificar(movimientos_nerviosos),
    verificar(no_saludable),
    verificar(trabajo_estresante).
depresión:-
    verificar(postura_encorvada),
    verificar(movimientos_lentos),
    verificar(circulo_social_chico),
    verificar(trabajo_estresante).
miedo:-
    verificar(postura_encorvada),
    verificar(movimientos_tensos),
    verificar(no_saludable),
    verificar(trabajo_estresante).
ansiedad:-
    verificar(postura_encorvada),
    verificar(movimientos_nerviosos),
    verificar(no_saludable),
    verificar(trabajo_estresante).
animación:-
    verificar(postura_erguida),
    verificar(movimientos_rápidos),
    verificar(no_saludable),
    verificar(trabajo_estresante).
    

    
preguntar(Pregunta) :-
    write('¿El individuo presenta estas caracteristicas?:'),
    write(Pregunta),
    write('? '),
    read(Respuesta),
    nl,
    ((Respuesta == si) -> assert(si(Pregunta));
    assert(no(Pregunta)), fail).


:- dynamic si/1,no/1.
/*Como se verifica */
verificar(S) :-
(si(S)->true ;
(no(S)->fail ;
preguntar(S))).



    
%desahacer    
deshacer :- retract(si(_)),fail.
deshacer :- retract(no(_)),fail.
deshacer.
