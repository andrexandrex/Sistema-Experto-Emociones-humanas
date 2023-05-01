start:- consult('C:/Users/USER/Desktop/PROLOG/Sistema-Experto-Emociones-humanas-master/prueba1.pl'),
    nl,
    write('Escribe los nombres completamente en minuscula'),nl,
    write('seguidos de un punto'),nl,
    nl,
    process_a_query.

process_a_query :-write('nombre?'),
    read(Nombre),
    answer(Nombre).


answer(stop):- write('Grabando la base de conocimientos...'), nl,
    tell('C:/Users/USER/Desktop/PROLOG/Sistema-Experto-Emociones-humanas-master/prueba1.pl'),
    listing(estado_de_animo),          
    listing(edad),
    listing(sueldos),
    listing(deudas),
    listing(vive_solo),
    listing(circulo_social_chico),
    listing(vive_en),
    listing(tiene_hijos),
    listing(circulo_social_mediano),
    listing(circulo_social_grande),
    listing(trabajo_agradable),
    listing(trabajo_estable),
    listing(trabajo_estresante),
    listing(trabajo_retador),
    listing(salud_buena),
    listing(salud_mala),
    listing(salud_media),
    told,
    write('Listo.'), nl.

answer(Nombre):- estado_de_animo(Nombre, Estado),
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

preguntar_atributos(Nombre) :- 
    write('¿Cuál es la edad de '), write(Nombre), write('? '), read(Edad),
    assert(edad(Nombre, Edad)),
    sueldos(Sueldos),
    (  memberchk((Nombre, _), Sueldos)
    -> write('¿Cuál es el sueldo de '), write(Nombre), write('? '), read(Sueldo),%bien
       retract(sueldos(Sueldos)),
       select((Nombre,_), Sueldos, Sueldos1),
       assert(sueldos([(Nombre,Sueldo)|Sueldos1]))
    ;  write('¿Cuál es el sueldo de '), write(Nombre), write('? '), read(Sueldo),%bien
       retract(sueldos(Sueldos)),
       assert(sueldos([(Nombre,Sueldo)|Sueldos])) ),
    deudas(Deudas),
    (  memberchk((Nombre, _), Deudas)
    -> write('¿Cuál es la deuda de '), write(Nombre), write('? '), read(Deuda), %bien
       retract(deudas(Deudas)),
       select((Nombre,_), Deudas, Deudas1),
       assert(deudas([(Nombre,Deuda)|Deudas1]))
    ;  write('¿Cuál es la deuda de '), write(Nombre), write('? '), read(Deuda),
       retract(deudas(Deudas)),
       assert(deudas([(Nombre,Deuda)|Deudas])) ),
    write('¿Vive solo/a? (s/n) '), read(ViveSolo), %elimnar_anteriores
    (ViveSolo == 's' -> 
        (vive_solo(ListaViveSolo), 
         (member(Nombre, ListaViveSolo) -> 
             true ; assert(vive_solo([Nombre|ListaViveSolo])))) ;
        assert(vive_con_padres(Nombre))),
    write('Lugar donde vive '), write(Nombre), write('? '), read(Lugar),%bien
    assert(vive_en(Nombre, Lugar)),
   write('¿Tiene hijos? (s/n) '), read(TieneHijos), %elimnar_anteriores
    (TieneHijos == 's' -> 
        (tiene_hijos(ListaTieneHijos), 
         (member(Nombre, ListaTieneHijos) -> 
             true ; assert(tiene_hijos([Nombre|ListaTieneHijos])))) ; true),
    write('¿Tiene un círculo social chico, mediano o grande? (c/m/g) '), read(CirculoSocial),%elimnar_anteriores
    (CirculoSocial == 'c' -> 
        (circulo_social_chico(ListaCirculoChico),
         retract(circulo_social_chico(ListaCirculoChico)), 
         (member(Nombre, ListaCirculoChico) -> 
             true ; assert(circulo_social_chico([Nombre|ListaCirculoChico])))) ;
     CirculoSocial == 'm' -> 
        (circulo_social_mediano(ListaCirculoMediano),
         retract(circulo_social_mediano(ListaCirculoMediano)), 
         (member(Nombre, ListaCirculoMediano) -> 
             true ; assert(circulo_social_mediano([Nombre|ListaCirculoMediano])))) ;
     CirculoSocial == 'g' -> 
        (circulo_social_grande(ListaCirculoGrande),
         retract(circulo_social_grande(ListaCirculoGrande)), 
         (member(Nombre, ListaCirculoGrande) -> 
             true ; assert(circulo_social_grande([Nombre|ListaCirculoGrande]))))),
    write('¿Su trabajo es estresante? (s/n) '), read(TrabajoEstresante),%bien
    (TrabajoEstresante == 's' -> 
        (trabajo_estresante(ListaActual), append(ListaActual, [Nombre], NuevaLista),
        retract(trabajo_estresante(ListaActual)), assert(trabajo_estresante(NuevaLista)));
        true),
    write('¿Su trabajo es agradable? (s/n) '), read(TrabajoAgradable),%bien
    (TrabajoAgradable == 's' -> 
        (trabajo_agradable(ListaActual1), append(ListaActual1, [Nombre], NuevaLista1),
        retract(trabajo_agradable(ListaActual1)), assert(trabajo_agradable(NuevaLista1)));
        true),
    write('¿Su trabajo es estable? (s/n) '), read(TrabajoEstable),%bien
    (TrabajoEstable == 's' -> 
        (trabajo_estable(ListaActual2), append(ListaActual2, [Nombre], NuevaLista2),
        retract(trabajo_estable(ListaActual2)), assert(trabajo_estable(NuevaLista2)));
        true),
    write('¿Su trabajo es retador? (s/n) '), read(TrabajoRetador),%bien
    (TrabajoRetador == 's' -> 
        (trabajo_retador(ListaActual3), append(ListaActual3, [Nombre], NuevaLista3),
        retract(trabajo_retador(ListaActual3)), assert(trabajo_retador(NuevaLista3)));
        true),
    write('¿Tiene buena, media o mala salud? (b/m/a) '), read(Salud),%eliminar_anteriores
    (Salud == 'b' -> 
        (salud_buena(ListaSaludBuena), 
         retract(salud_buena(ListaSaludBuena)), 
         (member(Nombre, ListaSaludBuena) -> 
             true ; assert(salud_buena([Nombre|ListaSaludBuena])))) ;
     Salud == 'm' -> 
        (salud_media(ListaSaludMedia),
         retract(salud_media(ListaSaludMedia)), 
         (member(Nombre, ListaSaludMedia) -> 
             true ; assert(salud_media([Nombre|ListaSaludMedia])))) ;
     Salud == 'a' -> 
        (salud_mala(ListaSaludMala),
         retract(salud_mala(ListaSaludMala)), 
         (member(Nombre, ListaSaludMala) -> 
             true ; assert(salud_mala([Nombre|ListaSaludMala]))))),
    process_a_query.





/*memberchk((Nombre, _), Sueldos),
    write('¿Cuál es el sueldo de '), write(Nombre), write('? '), read(Sueldo),
    retractall(sueldos(Nombre, _)),
    assert(sueldos(Nombre, Sueldo)),
    process_a_query.*/






    












    











/*ingresa stop
answer(stop):- write('grabando la base de conocimiento...'),nl,
    tell('C:/Users/USER/Desktop/PROLOG/Sistema-Experto-Emociones-humanas-master/prueba1.pl'),
    listing(personas),
    told,
    write('listo.'),nl.

answer(Nombre):- personas(Nombre),nl,
    write('el nombre '),
    write(Nombre),
    write('esta en la base de datos'),
    nl,
    process_a_query.

answer(Nombre) :- \+personas(Nombre),
    \+edad(Edad)
    write('no conozco ese nombre'),nl,
    write('Por favor agreguemos'),nl,
    write('nombre?'),
    read(Nombre),
    write('gracias'),nl,nl,
    assert(personas(Nombre)),
    process_a_query. */



