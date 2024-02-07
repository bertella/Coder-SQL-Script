# Descripción de Scripts SQL

Este repositorio contiene una serie de scripts SQL que ilustran diversos conceptos y técnicas utilizadas en el manejo de bases de datos. A continuación, se presenta una breve descripción de cada grupo de scripts:

## Consultas Básicas (Operadores de Comparación y WHERE)
1. **Obtener sugerencias con correo electrónico que contenga "hotmail"**
   - Script: `ObtenerSugerenciasHotmail.sql`
   - Ejemplo de consulta para filtrar sugerencias por correo electrónico.

2. **Encontrar juegos con descripción que contenga "aventura"**
   - Script: `EncontrarJuegosAventura.sql`
   - Ejemplo de consulta para buscar juegos cuya descripción incluya "aventura".

3. **Buscar usuarios con nombre que comience en "A"**
   - Script: `BuscarUsuariosNombreA.sql`
   - Ejemplo de consulta para encontrar usuarios cuyos nombres comienzan con "A".

## Operadores de Comparación (WHERE) y Ejemplos Prácticos
4. **Obtener juegos completados por un usuario específico**
   - Script: `JuegosCompletadosPorUsuario.sql`
   - Ejemplo de consulta para obtener juegos completados por un usuario específico.

5. **Buscar sugerencias con juegos específicos**
   - Script: `SugerenciasConJuegosEspecificos.sql`
   - Ejemplo de consulta para buscar sugerencias relacionadas con juegos específicos.

## Agrupación (Group By) y Estadísticas
6. **Contar usuarios por tipo**
   - Script: `ContarUsuariosPorTipo.sql`
   - Ejemplo de consulta para contar usuarios agrupados por tipo.

7. **Contar comentarios por juego**
   - Script: `ContarComentariosPorJuego.sql`
   - Ejemplo de consulta para contar comentarios agrupados por juego.

## Ordenamiento y Clasificación
8. **Obtener juegos ordenados por nombre de forma ascendente**
   - Script: `JuegosOrdenadosPorNombre.sql`
   - Ejemplo de consulta para obtener todos los juegos ordenados alfabéticamente.

9. **Encontrar usuarios ordenados por tipo de usuario**
   - Script: `UsuariosOrdenadosPorTipo.sql`
   - Ejemplo de consulta para encontrar usuarios ordenados por tipo.

## Joins (INNER JOIN, LEFT JOIN, RIGHT JOIN) y Relaciones entre Tablas
10. **Obtener detalles de votos junto con información del juego**
    - Script: `DetallesVotosConJuego.sql`
    - Ejemplo de consulta utilizando INNER JOIN para obtener detalles de votos y la información del juego asociado.

11. **Encontrar usuarios con información del tipo de usuario**
    - Script: `UsuariosConTipo.sql`
    - Ejemplo de consulta utilizando INNER JOIN para encontrar usuarios con información sobre su tipo.

## Subconsultas y Uso de EXISTS
12. **Subconsulta para obtener usuarios con sugerencias**
    - Script: `UsuariosConSugerencias.sql`
    - Ejemplo de subconsulta para obtener usuarios con sus sugerencias de juegos.

13. **Subconsulta con operador de comparación: Juegos con votos superiores al promedio**
    - Script: `JuegosConVotosSuperioresAlPromedio.sql`
    - Ejemplo de subconsulta para obtener juegos con votos superiores al promedio.

## Vistas y Funciones
14. **Creación de Vista: Juegos y sus Comentarios**
    - Script: `VistaJuegosYComentarios.sql`
    - Creación de una vista que lista juegos junto con sus comentarios.

15. **Creación de Función: Concatenación de Nombres**
    - Script: `FuncionConcatenarNombres.sql`
    - Creación de una función para concatenar nombres y apellidos.

Estos scripts proporcionan ejemplos prácticos para entender y aplicar diversas técnicas de consulta en SQL, desde consultas básicas hasta conceptos avanzados como JOIN, subconsultas y funciones. ¡Explora y experimenta con estos ejemplos para fortalecer tus habilidades en SQL!
