--ELIMINAR TABLA IF EXISTE
DROP TABLE IF EXISTS employees;

-- CREAR TABLA ID AUTO INCREMENTAL Y LLAVE PRIMARIA
CREATE TABLE IF NOT EXISTS employees(
id SERIAL PRIMARY KEY,
name VARCHAR(255) NOT NULL,
married BOOLEAN,
genre CHAR(1),
salary NUMERIC(10,2)
);

-- INSERTAR DATOS EN TABLA EMPLEADOS
INSERT INTO employees(name, married, genre, salary) VALUES
('Juan Perez', TRUE, 'M', 55000.50),
('Maria Garcia', FALSE, 'F', 62000.75),
('Pedro Gomez', TRUE, 'M', 47000.30),
('Ana Torres', TRUE, 'F', 51000.20)
;

-- VACIAR TABLA SIN ELIMINARLA
TRUNCATE TABLE employees;

-- MODIFICAR TABLA
-- AGREGAR COLUMNA DE TIPO DATE 'YYY-MM-DD'
ALTER TABLE employees ADD COLUMN birth_day DATE;

--AGREGAR FECHA DE CUMPLEAÑOS A LOS REGISTROS DE LA TABLA
UPDATE employees SET birth_day = '1985-12-1' WHERE name = 'Juan Perez';
UPDATE employees SET birth_day = '2000-05-15' WHERE name = 'Maria Garcia';
UPDATE employees SET birth_day = '1983-08-26' WHERE name = 'Ana Torres';
UPDATE employees SET birth_day = '1986-05-26' WHERE name = 'Pedro Gomez';

-- CAMBIAR TABLA POR CAMBIO EN ESTADO CIVIL DE UN REGISTRO
UPDATE employees SET married = False WHERE name = 'Pedro Gomez';

-- AGREGAR COLUMNA DE HORA DE ENTRADA
ALTER TABLE employees ADD COLUMN start_at TIME DEFAULT '08:00';

-- MODIFICAR HORA DE ENTRADA DE UN EMPLEADO
UPDATE employees SET start_at = '07:30:00' WHERE name = 'Juan Perez';

-- RENOMBRAR TABLA
ALTER TABLE IF EXISTS employeeS RENAME To employees_2025;

-- AGREGAR COLUMNA DE CORREO
ALTER TABLE employees_2025 ADD COLUMN email VARCHAR(100);

-- MODIFICAR EMAIL DE REGISTRO EN UNA SOLA SENTENCIA
UPDATE employees_2025 SET email = CASE
WHEN name = 'Juan Perez' THEN 'juanperez@mail.com'
WHEN name = 'Maria Garcia' THEN 'mariagarcia@mail.com'
WHEN name = 'Pedro Gomez' THEN 'pedrogomez@mail.com' 
WHEN name = 'Ana Torres' THEN 'anatorres@mail.com'
END
WHERE name IN('Juan Perez', 'Maria Garcia','Pedro Gomez','Ana Torres');

-- ELIMINAR COLUMNA GENERO
ALTER TABLE employees_2025 DROP COLUMN IF EXISTS genre;

-- LISTAR TABLA ORDENADA POR ID
SELECT * FROM employees_2025 ORDER BY id;