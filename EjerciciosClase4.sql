/*1.Todos los comentarios sobre juegos desde 2019 en adelante.*/
select * from game limit 10;
select * from commentary limit 10;

Select * From commentary;


select commentary,comment_date from commentary
where comment_date >='2019-01-01' 
order by comment_date desc ;

/*2.Todos los comentarios sobre juegos anteriores a 2011.*/
select commentary,comment_date 
from commentary 
where comment_date <='2011-01-01';

/*3.Los usuarios y texto de aquellos comentarios sobre juegos cuyo código de juego (id_game) sea 73*/
select id_system_user,commentary
from commentary
where id_game=73;

/*4.Los usuarios y texto de aquellos comentarios sobre juegos cuyo id de juego no sea 73.*/
select id_system_user,commentary 
from commentary 
where id_game != 73;

/*5.Aquellos juegos de nivel 1.*/
select * from
game 
where id_level = 1 ;

/*6.Aquellos juegos sean de nivel 14 o superior.*/
select * from game 
where id_level >= 14 ;
/*Obtener comentarios realizados entre dos fechas específicas.*/

SELECT *
FROM COMMENTARY
WHERE comment_date BETWEEN '2011-01-01' AND '2013-12-31';


/*7.Aquellos juegos de nombre 'Riders Republic' o 'The Dark Pictures: House Of Ashes'.*/
select * from game where name in('Riders Republic','The Dark Pictures: House Of Ashes') ;
select * from game where name ='Riders Republic' or name = 'The Dark Pictures: House Of Ashes';
select * from game where name ='Riders Republic' and id_level=7;

/*AND ambas condiciones deben ser verdaderas para que la fila sea incluida en el resultado.*/

SELECT *
FROM COMMENTARY
WHERE id_system_user = 633 AND id_game =45; -- Que pasa si modificamos alguno de los dos valores ?

SELECT *
FROM GAME
WHERE id_class = 143 AND id_level = 2;
 
select * from game;

/*Consulta con OR para al menos una condición verdadera:*/
SELECT *
FROM SUGGEST
WHERE id_system_user = 1 OR id_game = 4;

SELECT *
FROM COMMENTARY
WHERE id_game = 2 OR comment_date >= '2023-01-01';



/*8.Aquellos juegos cuyo nombre empiece con 'Gran'.*/
SELECT *
FROM GAME
WHERE name LIKE 'Gran%';

/*9.Aquellos juegos cuyo nombre contenga 'field'.*/

SELECT *
FROM GAME
WHERE name LIKE '%field%';

/*ej de operador 'like'*/
select * from game where name like '%riders%';
select * from game where upper(name) like '%RIDERS%';
select * from game where lower(name) like '%riders%';


/*ej alias*/
SELECT 
     pepe.id_system_user  id,
     pepe.last_name  l_n,     
     pepe.password  pass
FROM system_user  pepe
ORDER BY pepe.id_system_user;

select * FROM system_user;

/*funciones agregacion*/

/*Contar el total de niveles en el juego:*/
SELECT COUNT(*) as total_level  
FROM level_game;

-- Encontrar el nivel más bajo (ID) en el juego:
SELECT MIN(id_level) as id_level 
FROM level_game;

-- Encontrar el nivel más alto (ID) en el juego:
SELECT MAX(id_level) 
AS max_level
FROM level_game;

-- Calcular la puntuación total para un juego específico (ID de juego = 1):
SELECT SUM(value) as Total
FROM vote
WHERE id_game = 1;

select * from vote limit 10;

-- calcular el valor promedio de las puntuaciones 
SELECT AVG(value) as avg_value
FROM vote
WHERE id_game = 1;

/*Contar el número de juegos en cada nivel:*/
SELECT id_level, COUNT(id_game) as games_count
FROM GAME
GROUP BY id_level;

/*Calcular el número total de comentarios por juego:*/
SELECT id_game, COUNT(id_commentary) as "Total De Comentarios"
FROM COMMENTARY
GROUP BY id_game;

/*Encontrar la fecha más temprana y la fecha más reciente de los comentarios:*/
SELECT MIN(comment_date) as  "Primer Comentario ", MAX(comment_date) as "Ultimo Comentario"
FROM COMMENTARY;

/*La cláusula GROUP BY en SQL se utiliza para agrupar filas que 
tienen los mismos valores en una o más columnas en funciones de agregación,
 como COUNT, SUM, AVG, MAX o MIN. Básicamente, GROUP BY se utiliza en conjunto 
 con funciones de agregación para realizar cálculos sobre grupos de filas en 
 lugar de sobre la tabla completa.
 
Imagina que tienes una caja llena de bolitas de colores, 
y cada bolita tiene un número escrito en ella. Ahora,
quieres saber cuántas bolitas tienes de cada color y cuál
es el promedio de los números escritos en las bolitas de cada color.
En términos de SQL, la caja es tu tabla de base de datos, 
las bolitas son las filas y cada bolita tiene diferentes características (columnas). 
Al aplicar GROUP BY, estás esencialmente organizando las bolitas por colores,
 agrupándolas en conjuntos basados en los valores de una columna específica.
 Luego, puedes realizar operaciones de agregación, como contar cuántas bolitas
 hay en cada grupo (usando COUNT), encontrar el promedio de los números en cada
 grupo (usando AVG), entre otras cosas.
Entonces, el GROUP BY en este caso sería como dividir las bolitas en grupos
 según su color antes de realizar cualquier operación adicional.
 Esto te permite obtener información más específica y resumida sobre
 las características de las bolitas dentro de cada grupo en lugar de
 considerar todas las bolitas juntas.
 
*/
-- Contar el número de juegos por nivel
SELECT id_level, COUNT(id_game) as juegos_por_nivel
FROM GAME
GROUP BY id_level;

-- Calcular la puntuación promedio por juego
SELECT id_game, AVG(value) as puntuacion_promedio
FROM VOTE
GROUP BY id_game;



/*"Contabiliza el número de comentarios para cada usuario del sistema en la tabla 'commentary' 
y muestra la cantidad de comentarios ('comments') junto con el identificador 
del usuario del sistema ('id_system_user')."*/

SELECT count(id_system_user)
AS comments, id_system_user
from commentary 
group by id_system_user;


/*HAVING 
HAVING: Esta cláusula se utiliza para filtrar los resultados después de aplicar
GROUP BY y funciones de agregación.
HAVING se encarga de establecer condiciones para los grupos resultantes.
Es como una extensión de WHERE que se aplica a los resultados después de haber sido agrupados.*/
--  usuarios que hayan jugado más de un juego. 
SELECT 
id_system_user AS user, COUNT(*) AS games_by_user
FROM play
GROUP BY id_system_user
HAVING COUNT(*) > 1;

/*Contabiliza el número de comentarios para cada usuario del sistema en la tabla
'commentary', muestra la cantidad de comentarios ('comments') junto con el identificador
del usuario del sistema ('id_system_user') 
y filtra solo aquellos usuarios del sistema que tienen más de 2 comentarios.*/

Select count(id_system_user) AS comments , id_system_user
from commentary 
GROUP BY id_system_user 
HAVING comments > 2 ;

 
/*INNER JOIN */
/*Juegos Jugados con Detalles de Usuarios: Obtén la información sobre los juegos jugados, 
incluyendo detalles de usuarios, mediante un INNER JOIN entre las tablas de juegos y jugadas.
*/
-- 
SELECT p.id_system_user as user, g.id_game as game, g.name, 
       g.id_level as level
FROM play as p INNER JOIN game as g 
ON (p.id_game = g.id_game);

select * from play;
select * from game;
--
/*Obtener información sobre comentarios y los usuarios que los realizaron*/
SELECT C.id_commentary, C.comment_date, C.commentary, U.first_name, U.last_name
FROM commentary AS C
INNER JOIN system_user AS U ON C.id_system_user = U.id_system_user;

/*Obtener información sobre juegos y sus niveles*/
SELECT G.id_game, G.name AS game_name, L.description AS level_description
FROM game AS G
INNER JOIN level_game AS L 
ON G.id_level = L.id_level;



/*EJEMPLOS LEFT JOINS*/
SELECT p.id_system_user as user, g.id_game as game, 
g.name, g.id_level as level
FROM game as g 
LEFT JOIN play as p
ON (p.id_game = g.id_game);


select * from play ;
select * from game;

--  Obtener detalles de juegos y sus votos (si existen)
SELECT G.id_game, G.name AS game_name, V.id_vote, V.value
FROM game AS G
LEFT JOIN vote AS V ON G.id_game = V.id_game;


select * from play ;
select * from game;
--  Obtener información sobre niveles y las clases asociadas (si existen):
SELECT L.id_level, L.description AS level_description, C.id_class, C.description AS class_description
FROM level_game AS L
LEFT JOIN class AS C 
ON L.id_level = C.id_level;

/*Esta consulta mostrará detalles de todos los niveles y, 
si existen, las clases asociadas a esos niveles.*/




/*ej right join*/
SELECT p.id_system_user as user, g.id_game as game, 
g.name, g.id_level as level
FROM game g  RIGHT JOIN play p
ON (p.id_game = g.id_game);

select 
name from game where id_level = 1;