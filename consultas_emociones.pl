:- dynamic estado_de_animo/2.

start :- consult('hechos_emociones.pl'),
         nl,
         write('Escribe el nombre en minúsculas,'),
         nl, write('seguidos de un punto.'), nl, nl,
         process_a_query.

process_a_query :- write('nombre? '),read(Nombre),answer(Nombre).

answer(stop) :- write('Grabando la base de conocimientos...'), nl,
                 tell('hechos_emociones.pl'),
                 listing(estado_de_animo),
                 told,
                 write('Listo.'), nl.

answer(Nombre) :- estado_de_animo(Nombre, Estado),
                  nl,
                  write('El estado de ánimo de '),
                  write(Nombre),
                  write(' es '),
                  write(Estado),
                  nl,
                  process_a_query.

answer(Nombre) :- \+ estado_de_animo(Nombre, _),
                  nl,
                  write('No conozco el estado de ánimo de '),
                  write(Nombre),nl,
                  preguntar_atributos(Nombre).

%pregunta atributos de una nueva persona y lo almacena en la base de datos.
preguntar_atributos(Nombre) :-
    write('¿Cuál es la edad de '), write(Nombre), write('? '), read(Edad),
    assert(edad(Nombre, Edad)),
    sueldos(Sueldos),
    memberchk((Nombre, _), Sueldos),
    write('¿Cuál es el sueldo de '), write(Nombre), write('? '), read(Sueldo),
    retractall(sueldo(Nombre, _)),
    assert(sueldo(Nombre, Sueldo)),
    deudas(Deudas),
    memberchk((Nombre, _), Deudas),
    write('¿Cuál es la deuda de '), write(Nombre), write('? '), read(Deuda),
    retractall(deuda(Nombre, _)),
    assert(deuda(Nombre, Deuda)),
    write('¿Vive solo/a? (s/n) '), read(ViveSolo),
    (ViveSolo == 's' -> assert(vive_solo(Nombre)); assert(vive_con_padres(Nombre))),
    write('Lugar donde vive '), write(Nombre), write('? '), read(Lugar),
    (es_seguro(Lugar) -> assert(es_seguro(Nombre)); assert(no_es_seguro(Nombre))),
    write('¿Tiene hijos? (s/n) '), read(TieneHijos),
    (TieneHijos == 's' -> assert(tiene_hijos(Nombre)); true),
    write('¿Tiene un círculo social chico, mediano o grande? (c/m/g) '), read(CirculoSocial),
    (CirculoSocial == 'c' -> assert(circulo_social_chico(Nombre));
     CirculoSocial == 'm' -> assert(circulo_social_mediano(Nombre));
     assert(circulo_social_grande(Nombre))),
    write('¿Su trabajo es estresante? (s/n) '), read(TrabajoEstresante),
    (TrabajoEstresante == 's' -> assert(trabajo_estresante(Nombre)); true),
    write('¿Su trabajo es agradable? (s/n) '), read(TrabajoAgradable),
    (TrabajoAgradable == 's' -> assert(trabajo_agradable(Nombre)); true),
    write('¿Su trabajo es estable? (s/n) '), read(TrabajoEstable),
    (TrabajoEstable == 's' -> assert(trabajo_estable(Nombre)); true),
    write('¿Su trabajo es retador? (s/n) '), read(TrabajoRetador),
    (TrabajoRetador == 's' -> assert(trabajo_retador(Nombre)); true),
    write('¿Tiene buena, media o mala salud? (b/m/a) '), read(Salud),
    (Salud == 'b' -> assert(salud_buena(Nombre)); 
    Salud == 'm' -> assert(salud_media(Nombre));
    Salud == 'a' -> assert(salud_mala(Nombre))), process_a_query.
    
     