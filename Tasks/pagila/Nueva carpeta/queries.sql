-- LISTAR LAS PRIMERAS 50 FILAS DE LA TABLA FILM
SELECT * FROM film limit 50;

-- OBTENER LOS NOMBRES DE LAS PELICULAS 
SELECT title FROM film limit 50;

-- OBTENER ACTORES Y EN QUE PELICULAS ACTUARON
SELECT a.first_name, a.last_name, f.title
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id;



