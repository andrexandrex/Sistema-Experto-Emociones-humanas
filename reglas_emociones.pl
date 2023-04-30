/* reglas*/

sueldo_disponible_bajo(X):- sueldo(X,S),deuda(X,D),S-D<2000. %  sueldo_disponible_bajo(gerardo).
situacion_financiera_dificil(X) :- sueldo_disponible_bajo(X), vive_en(X,Z), no_es_seguro(Z), vive_solo(X).%  situacion_financiera_dificil(gerardo).	
sueldo_disponible_moderado(X):-
    sueldos(Sueldos),
    deudas(Deudas),
    member((X, Sueldo), Sueldos),
    member((X, Deuda), Deudas),
    Diferencia is Sueldo - Deuda,
    Diferencia < 2000, Diferencia > 1000.
sueldo_disponible_alto(X):-
    sueldos(Sueldos),
    deudas(Deudas),
    member((X, Sueldo), Sueldos),
    member((X, Deuda), Deudas),
    Diferencia is Sueldo - Deuda,
    Diferencia > 3000.
sueldo_disponible_bajo(X):-
    sueldos(Sueldos),
    deudas(Deudas),
    member((X, Sueldo), Sueldos),
    member((X, Deuda), Deudas),
    Diferencia is Sueldo - Deuda,
    Diferencia < 1000.

%listas con recursividad 
todos_viven_en([], _).
todos_viven_en([X|Xs], Location) :-
    vive_en(X, Location),
    todos_viven_en(Xs, Location).

personas_mismo_trabajo(Trabajo, Personas) :-
    findall(Persona, trabajo(Persona, Trabajo), Personas).

todos_autoestima_media([]).
todos_autoestima_media([X|Xs]) :-
    autoestima(X, media),
    todos_autoestima_media(Xs).
%




%feliz_trabajo(X) :- trabajo_(X,T), (T = agradable; T = retador), sueldo(X,S), S >3000. %feliz_trabajo(marcela).
feliz_trabajo(X) :- (trabajo_agradable(VAR);trabajo_retador(VAR)), member(X,VAR).

esta_en_salud_buena(Elemento) :- salud_buena(Lista), member(Elemento, Lista).

trabajo_agradable_esta(Elemento) :- trabajo_agradable(Lista1),member(Elemento, Lista1).
trabajo_estable_esta(Elemento) :- trabajo_estable(Lista2),member(Elemento, Lista2).
trabajo_estresante_esta(Elemento) :- trabajo_estresante(Lista2),member(Elemento, Lista2).

autoestima_media_esta(Elemento) :-autoestima_media(Lista2),member(Elemento, Lista2).
autoestima_alta_esta(Elemento) :- autoestima_alta(Lista3),member(Elemento, Lista3).
autoestima_baja_esta(Elemento) :- autoestima_baja(Lista3),member(Elemento, Lista3).





%EMOCIONESSSSSS


%feliz(X) :- trabajo(X, T), (T = agradable; T = retador; T = estable), sueldo(X,Y),(Y>3000),salud(X,buena),(autoestima(X,alta);autoestima(X,media)). %feliz(marcela). 
feliz(X) :- 
    trabajo_agradable_esta(X);
    trabajo_estable_esta(X),
    sueldo_disponible_alto(X),
    esta_en_salud_buena(X),
    autoestima_media_esta(X);
    autoestima_alta_esta(x). %feliz(marcela).
orgullo(X) :- (vive_solo(Y),member(X,Y)),feliz_trabajo(X). %orgullo(marcela). 
animado(X) :- feliz(X).%animado(marcela). 
sentido_del_humor(X) :- circulo_social_grande(Z), member(X,Z).%  sentido_del_humor(cecilia).

preocupado(X) :- salud_mala(Z),member(X,Z),sueldo_disponible_bajo(X).
preocupado(X) :- salud_media(T),member(X,T);trabajo_estresante_esta(X).%preocupado(cecilia).
aburrido(X) :- circulo_social_chico(F),member(X,F),vive_solo(Y),member(X,Y). %  aburrido(fernando).
triste(X) :- vive_solo(Y),member(X,Y),circulo_social_chico(F),member(X,F),autoestima_baja_esta(X).%  triste(fernando).
deprimido(X) :- salud_mala(Z),member(X,Z),triste(X).%  deprimido(fernando). 
desanimado(X) :- triste(X), deprimido(X),not(feliz_trabajo(X)) . %desanimado(fernando).
miedo(X) :- vive_solo(Y),member(X,Y),vive_en(X,U), no_es_seguro(L),member(U,L). %miedo(gerardo).
ansioso(X) :- preocupado(X);(autoestima_baja_esta(X);autoestima_media_esta(X)). %ansioso(cecilia).
%Reglas extra 