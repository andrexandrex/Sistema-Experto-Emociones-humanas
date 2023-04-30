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

gaa(entero).


estado_de_animo(fernando, feliz).
estado_de_animo(cecilia, preocupado).
estado_de_animo(marcela, triste).
estado_de_animo(gerardo, feliz).
estado_de_animo(adriana, triste).