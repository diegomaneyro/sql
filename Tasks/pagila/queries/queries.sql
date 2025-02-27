-- LISTAR LAS PRIMERAS 50 FILAS DE LA TABLA FILM
SELECT * FROM film limit 50;

-- OBTENER LOS NOMBRES DE LAS PELICULAS 
SELECT title FROM film limit 50;

-- OBTENER ACTORES Y EN QUE PELICULAS ACTUARON
SELECT a.first_name, a.last_name, f.title
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id;

-- SELECIONAR ACTOR
SELECT * FROM actor LIMIT 50;
SELECT actor_id, last_name FROM actor;
SELECT * FROM actor WHERE last_name = 'WAHLBERG';

-- SELECCIONAR ADRESS
SELECT * FROM address LIMIT 50;

-- CONOCER FILAS NO NULAS Y NO VACIAS SI DA CERO LA COMNA ESTA VACIA
SELECT COUNT(*) AS NULL_COUNT
FROM address 
WHERE address2 IS NOT NULL AND address2 <> '';

-- FILTRAR Y CONTAR ADDRESS POR DISTRIT
SELECT COUNT(*) AS cant_dist 
FROM address 
WHERE district = 'California';

-- FILTRAR POR DISTRICT Y POSTAL_CODE
SELECT *
FROM address
WHERE district = 'California' AND postal_code = '17886';

SELECT * FROM country LIMIT 50; 

-- FILTRAR POR DOS CODIGOS POSTALES
SELECT *
FROM address 
WHERE postal_code = '35200' or postal_code = '17886';

-- TABLA CATEGORY
SELECT * FROM category LIMIT 50;
-- FILTRAR POR ACTION
SELECT *
FROM category
WHERE name = 'Action'
LIMIT 50;

-- EN CITY BUSCAR
SELECT * 
FROM city
LIMIT 50;
-- OUTPUT: BAKU

-- EN COUNTRY BUSCAR EL ID DE LA CIUDAD BAKU
SELECT *
FROM country
WHERE country_id = 10;
-- Output: Azerbaijan es el pais que contiene a la ciudad Baku

-- FILTRAR MEDIANTE LIKE(QUE EMPIEZE POR 'Ad' + algo mas)
SELECT * FROM City LIMIT 50;

SELECT *
FROM city
WHERE  city
LIKE ('Ad%') 
LIMIT 50;

-- FILTRAR CUSTOMER POR ESTADO 
SELECT * FROM customer ORDER BY activebool;
-- DESACTIVAR EL CLIENTE Nancy Thomas
SELECT * 
FROM customer
WHERE first_name = 'NANCY' AND last_name = 'THOMAS';

UPDATE customer
SET activebool = False 
WHERE customer_id = 12
;

-- SELECCIONAR TABLA FILM_ACTOR
SELECT * 
FROM film_Actor
LIMIT 50;

-- SELECIONAR Y CONTAR FILAS EN TABLA payment
SELECT COUNT(*) AS_COUNT
FROM payment
;

SELECT * 
FROM payment
LIMIT 100;

-- CONSULTAR LA PARTICION DE payment
SELECT *
FROM payment_p2022_01
Limit 20;

/* 
inventario guarda el film_id, store_id
cuantas copias de la pelicula: COWBOY DOOM 
hay en la sucursal:
*/

-- buscar el id de la pelicula con nombre: COWBOY DOOM
SELECT film_id, title
FROM film
WHERE title = 'COWBOY DOOM';
/* Output
film_id: 185 */

-- buscar el stock y sucursal del id 185
SELECT *
FROM inventory
WHERE film_id = 185;
/* Output
inventario: 185, 186
sucursal: 1
*/

-- Buscar sucursal que tiene las copias
SELECT *
FROM store
WHERE store_id = 1;
/*
la sucursal 1
address_id: 1
*/

-- buscar direccion de la sucursal
SELECT *
FROM address
WHERE address_id = 1;
/* Output:
74 MySakila Drive, Alberta 300
*/





-- CONSULTAR INVENTARIO DE PELICULAS
SELECT * FROM inventory LIMIT 100;