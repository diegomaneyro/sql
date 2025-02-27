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

-- INGREASAR UN REGISTRO CON ID MANUAL
INSERT INTO employees_2025(id, name, married, salary, birth_day, start_at, email) VALUES
(11, 'Pablo Lopez', 'True', 1234.32, '25-08-1986', '08:00:00', 'pablolopez@mail.com');

-- Actualizar la secuencia del id para la numeracion posterior a la ingresada manualmente
SELECT setval('employees_id_seq', GREATEST((SELECT MAX(id) FROM employees_2025), 11) + 1);

-- Ingresar un registro para verificar la asignacion automatica de id
INSERT INTO employees_2025(name, married, salary, birth_day, start_at, email) VALUES
('Jose Ledesma', False, 325.32, '15-06-1984', '07:30:00', 'joseledesma@mail.com');

--MODIFICAR COLUMNA DE CORREO PARA QUE SEA UNICA
ALTER TABLE employees_2025 ADD CONSTRAINT unique_email UNIQUE (email);

-- AGREGAR RESTRICCION A COLUMNA SALARIO QUE SEA MAYOR A CERO
ALTER TABLE employees_2025 ADD CONSTRAINT check_salary CHECK (salary > 0);

-- VERIFICAR REGISTROS QUE TENGAN MENOS DE 18 AÑOS
SELECT * FROM employees_2025 WHERE birth_day > CURRENT_DATE - INTERVAL '18 years'; 

-- AGREGAR RESTRICCION A FECHA NACIMIENTO MENOR A LA FECHA ACTUAL
ALTER TABLE employees_2025 ADD CONSTRAINT check_birth_day CHECK (birth_day < CURRENT_DATE - INTERVAL '18 years');

-- LISTAR TABLA ORDENADA POR ID
SELECT * FROM employees_2025 ORDER BY id;