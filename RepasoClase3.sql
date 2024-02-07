/*REPASO CLASE Nº 3*/
-- select 
SELECT id_class, description -- columnas que vamos a mostrar 
FROM class; -- De que tabla las vamos a consultar 

Select *
FROM CLASS; -- EL * Representa totalidad  

SELECT DISTINCT first_name
FROM system_user;

/*La sentencia WHERE permite agregar condiciones para filtrar los resultados.*/


SELECT *
FROM system_user
where id_system_user = 3;

SELECT * 
FROM system_user
WHERE first_name = ‘Gillie’;

SELECT first_name, last_name
FROM system_user 
WHERE id_user_type = 334;

SELECT first_name, last_name 
FROM system_user 
WHERE id_system_user = 56;

SELECT *
FROM system_user 
WHERE first_name = "Reinaldos";





