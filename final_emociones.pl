/* Reconocimiento de estado de animo de las personas */
/* hechos */
edad(fernando,30).
edad(cecilia, 22).
edad(marcela, 49).
edad(gerardo, 18).
edad(adriana, 36).

sueldos([(fernando,1200), (cecilia,4500), (marcela,6800), (gerardo,2750), (adriana,900)]).
deudas([(fernando,100), (cecilia,23), (marcela,400), (gerardo,3000), (adriana,1100)]).

vive_solo([marcela,gerardo,fernando]).
vive_con_padres([adriana,cecilia]).


vive_en(marcela, la_molina).
vive_en(gerardo, callao).
vive_en(fernando, callao).
vive_en(adriana, san_borja).
vive_en(cecilia, comas).


tiene_hijos([marcela,gerardo]).

es_seguro([la_molina,san_borja]).
no_es_seguro([callao,comas]).

circulo_social_chico([adriano,fernando]).
circulo_social_mediano([gerardo,marcela]).
circulo_social_grande([cecilia]).



trabajo_estresante([fernando]).
trabajo_agradable([marcela,gerardo]).
trabajo_estable([adriana]).
trabajo_retador([cecilia]).

salud_mala([fernando,adriana]).
salud_buena([marcela,gerardo]).
salud_media([cecilia]).


autoestima_media([gerardo,cecilia]).
autoestima_alta([marcela]).
autoestima_baja([fernando,adriana]).

/* reglas*/

%sueldo_disponible_bajo(X):- sueldo(X,S),deuda(X,D),S-D<2000. %  sueldo_disponible_bajo(gerardo).
%situacion_financiera_dificil(X) :- sueldo_disponible_bajo(X), vive_en(X,Z), no_es_seguro(Z), vive_solo(X).%  situacion_financiera_dificil(gerardo).	
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