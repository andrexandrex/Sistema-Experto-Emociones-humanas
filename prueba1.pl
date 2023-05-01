:- dynamic estado_de_animo/2.

estado_de_animo(fernando, feliz).
estado_de_animo(cecilia, preocupado).
estado_de_animo(marcela, triste).
estado_de_animo(gerardo, feliz).
estado_de_animo(adriana, triste).

:- dynamic edad/2.

edad(fernando, 30).
edad(cecilia, 22).
edad(marcela, 49).
edad(gerardo, 18).
edad(adriana, 36).


:- dynamic sueldos/1.

sueldos([(fernando, 1200), (cecilia, 4500), (marcela, 6800), (gerardo, 2750), (adriana, 900)]).

:- dynamic deudas/1.

deudas([(fernando, 100), (cecilia, 23), (marcela, 400), (gerardo, 3000), (adriana, 1100)]).

:- dynamic vive_solo/1.

vive_solo([marcela, gerardo, fernando]).

:- dynamic vive_con_padres/1.

vive_con_padres([adriana,cecilia]).

:- dynamic circulo_social_chico/1.

circulo_social_chico([adriano, fernando]).




:- dynamic vive_en/2.

vive_en(marcela, la_molina).
vive_en(gerardo, callao).
vive_en(fernando, callao).
vive_en(adriana, san_borja).
vive_en(cecilia, comas).


:- dynamic tiene_hijos/1.

tiene_hijos([marcela, gerardo]).

:- dynamic circulo_social_mediano/1.

circulo_social_mediano([gerardo, marcela]).


:- dynamic circulo_social_grande/1.

circulo_social_grande([cecilia]).

:- dynamic trabajo_agradable/1.


trabajo_agradable([marcela, gerardo]).

:- dynamic trabajo_estable/1.

trabajo_estable([adriana]).


:- dynamic trabajo_estresante/1.

trabajo_estresante([fernando]).


:- dynamic trabajo_retador/1.

trabajo_retador([cecilia]).


:- dynamic salud_buena/1.

salud_buena([marcela, gerardo]).

:- dynamic salud_mala/1.

salud_mala([fernando, adriana]).

:- dynamic salud_media/1.

salud_media([cecilia]).


