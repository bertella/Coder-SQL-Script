 
 
 -- Ejemplo 1: Obtener sugerencias con correo electrónico que contenga "hotmail"
SELECT * FROM SUGGEST WHERE email LIKE 'bipgrave4@surveymonkey.com';

-- Ejemplo 2: Encontrar juegos con descripción que contenga "aventura"
SELECT * FROM GAME WHERE name LIKE '%Call of Duty: Vanguard%';

-- Ejemplo 3: Buscar usuarios con nombre que comience en "A"
SELECT * FROM SYSTEM_USER WHERE first_name LIKE 'A%';


#operadores de comparacion (where)


-- Ejemplo 1: Obtener juegos completados por un usuario específico
SELECT * FROM PLAY WHERE id_system_user = 1 AND completed = true;


-- Ejemplo 2: Buscar sugerencias con juegos específicos
SELECT * FROM SUGGEST WHERE id_game IN (1, 2, 3);
  
  
  # Agrupación (Group By):

-- Ejemplo 1: Contar usuarios por tipo
SELECT id_user_type as "Id Usuario", COUNT(*) as "Cantidad de usuarios" 
FROM SYSTEM_USER GROUP BY id_user_type;


-- Ejemplo 2: Contar comentarios por juego
SELECT id_game, COUNT(*) as num_comentarios FROM COMMENT GROUP BY id_game;
  
  
# ORDENAMIENTO 
-- Ejemplo 1: Obtener todos los juegos ordenados por nombre de forma ascendente
SELECT * FROM GAME ORDER BY name ASC;

-- Ejemplo 2: Encontrar usuarios ordenados tipo de usuario
SELECT * FROM SYSTEM_USER ORDER BY id_user_type;

-- Ejemplo 3: Buscar sugerencias ordenadas por fecha de sugerencia
SELECT * FROM SUGGEST ORDER BY email DESC;

# INNER JOIN 
-- Ejemplo 1: Obtener detalles de votos junto con información del juego
SELECT VOTE.*, GAME.name, GAME.description
FROM VOTE
INNER JOIN GAME ON VOTE.id_game = GAME.id_game;

-- Ejemplo 2: Encontrar usuarios con información del tipo de usuario
SELECT SYSTEM_USER.*, USER_TYPE.description
FROM SYSTEM_USER
INNER JOIN USER_TYPE ON SYSTEM_USER.id_user_type = USER_TYPE.id_user_type;


-- Ejemplo 1: Obtener detalles de votos junto con el nombre del juego
SELECT v.id_vote as "id", v.value as "Valor", g.name as "Nombre del juego"
FROM VOTE v
INNER JOIN GAME g ON v.id_game = g.id_game;

-- Ejemplo 2: Encontrar usuarios con su tipo de usuario
SELECT SYSTEM_USER.first_name, SYSTEM_USER.last_name, USER_TYPE.description
FROM SYSTEM_USER
INNER JOIN USER_TYPE ON SYSTEM_USER.id_user_type = USER_TYPE.id_user_type;

-- Otra consulta INNER JOIN (ejemplo adicional)
SELECT p.id_play AS "ID Juego Jugado", p.completed AS "Completado", g.name AS "Nombre del Juego", u.first_name AS "Nombre del Usuario"
FROM PLAY p
INNER JOIN GAME g ON p.id_game = g.id_game
INNER JOIN SYSTEM_USER u ON p.id_system_user = u.id_system_user;

#LEFT JOIN
-- LEFT JOIN
SELECT c.id_commentary AS "ID Comentario", c.commentary AS "Comentario", g.name AS "Nombre del Juego"
FROM COMMENTARY c
LEFT JOIN GAME g ON c.id_game = g.id_game;

-- Otra consulta LEFT JOIN (ejemplo adicional)
SELECT s.id_suggest AS "ID Sugerencia", s.email AS "Email", g.name AS "Nombre del Juego"
FROM SUGGEST s
LEFT JOIN GAME g ON s.id_game = g.id_game;

  -- RIGHT JOIN
SELECT g.id_game AS "ID Juego", g.name AS "Nombre del Juego", v.value AS "Valor del Voto"
FROM GAME g
RIGHT JOIN VOTE v ON g.id_game = v.id_game;

-- Otra consulta RIGHT JOIN (ejemplo adicional)
SELECT l.id_level AS "ID Nivel", l.description AS "Descripción del Nivel", c.description AS "Descripción de la Clase"
FROM LEVEL_GAME l
RIGHT JOIN CLASS c ON l.id_level = c.id_level;
  
  -- SUBCONSULTAS
SELECT description
FROM USER_TYPE
WHERE id_user_type IN (SELECT id_user_type FROM GAME WHERE id_game < 100);

  
SELECT id_commentary, comment_date, commentary
FROM COMMENTARY
WHERE id_game IN (SELECT id_game FROM VOTE WHERE value > 4);

-- Subconsulta con operador de comparación:

/*Queremos obtener todos los juegos que tienen
 un número de votos mayor que el promedio de votos.*/
/*En este ejemplo, 
la subconsulta (SELECT AVG(COUNT(*)) FROM VOTE)
 calcula el promedio del número de votos por juego,
 y la subconsulta principal filtra los juegos que tienen
 más votos que ese promedio.*/

SELECT id_game, name
FROM GAME
WHERE id_game IN (SELECT id_game FROM VOTE GROUP BY id_game HAVING COUNT(*) > (SELECT AVG(COUNT(*)) FROM VOTE));

SELECT id_game, name
FROM GAME g
WHERE EXISTS (SELECT 1 FROM COMMENTARY c WHERE c.id_game = g.id_game);


# VISTAS 
CREATE VIEW GameComments AS
SELECT g.name AS GameName, c.commentary AS Comment
FROM GAME g
INNER JOIN COMMENTARY c ON g.id_game = c.id_game;

# Vista que lista los usuarios y sus sugerencias de juegos:
CREATE VIEW UserSuggestions AS
SELECT u.first_name, u.last_name, s.email, g.name AS SuggestedGame
FROM SYSTEM_USER u
INNER JOIN SUGGEST s ON u.id_system_user = s.id_system_user
INNER JOIN GAME g ON s.id_game = g.id_game;

# Vista que muestra los juegos con sus votos y valoraciones:
CREATE VIEW GameVotes AS
SELECT g.name AS GameName, v.value AS VoteValue
FROM GAME g
LEFT JOIN VOTE v ON g.id_game = v.id_game;

# FUNCIONES
DELIMITER //

CREATE FUNCTION ConcatenateUserNames(firstName VARCHAR(50), lastName VARCHAR(50)) RETURNS VARCHAR(100)
BEGIN
    -- Devolver la concatenación de nombres y apellidos
    RETURN CONCAT(firstName, ' ', lastName);
END //

DELIMITER ;

-- Llamada de ejemplo a la función
SELECT ConcatenateUserNames('John', 'Doe') AS FullName;


  