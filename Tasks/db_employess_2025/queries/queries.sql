--  SENTENCIAS DML_ DATA MANIPULATION LANGUAJE

-- CONSULTAS O RECUPERACION DE DATOS
SELECT * FROM employees_2025;
SELECT id, name FROM employees_2025;

-- FILTRAR FILAS POR ID
SELECT id, name, salary from employees_2025 WHERE id = 2; 
SELECT * FROM employees_2025 WHERE name = 'Maria Garcia';

-- FILTRADO POR salary y start_at ordenado por salary
SELECT id, name, email, salary FROM employees_2025 WHERE salary > 6000.00 AND start_at = '08:00:00' ORDER BY salary;

-- FILTRADO POR MARRIED Y SALARY ORDENADO POR SALARY DESCENDENTE
SELECT * FROM employees_2025 WHERE married = True AND salary < 60000.00 ORDER BY salary DESC;

-- INSERTAR DATOS
INSERT INTO employees_2025(name, married, salary, birth_day, start_at, email) VALUES
('Ramiro Lopez', False, 1254.32, '12-06-1985', '07:00:00', 'ramirolopezqmail.com'); 

INSERT INTO employees_2025(name, salary, start_at, email) VALUES
('Raul Luna', 1254.32, '07:30:00', 'raulluna@mail.com'); 


-- MODIFICAR DATOS
UPDATE employees_2025 SET email = 'ramirolopez@mail.com' WHERE id = 14;

UPDATE employees_2025 SET salary = NULL WHERE id = 15;

UPDATE employees_2025 SET birth_day = '30-05-1985' WHERE id = 15;

UPDATE employees_2025 SET salary = (salary + 3000) WHERE email = 'mariagarcia@mail.com';

-- ACTUALIZAR Y RECUPERAR
UPDATE employees_2025 SET married = False WHERE id = 1 RETURNING *;

-- AGREGAR COLUMNA STATUS PARA USUARIOS QUE DEJA LA EMPRESA
ALTER TABLE employees_2025 ADD COLUMN status BOOLEAN DEFAULT True;
UPDATE employees_2025 SET status = False WHERE id = 2;


-- BORRAR REGISTROS
DELETE FROM employees_2025 WHERE id = 11; 

DELETE FROM employees_2025 WHERE salary IS NULL;

-- SELECCIONAR TODOS LOS REGISTROS INACTIVOS
SELECT * FROM employees_2025 WHERE status = False;

-- SELECCIONAR PRIMEROS 10 REGISTROS ORDENADOS POR ID DE FOMRA ASCENDENTE
SELECT * FROM employees_2025 ORDER BY id ASC LIMIT 10;