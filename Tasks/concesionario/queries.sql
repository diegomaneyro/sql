-- CREAR TABLAS EN BASE DE DATOS concesionario

CREATE TABLE manufacturer (
	id SERIAL,
	name VARCHAR(50) NOT NULL,
	num_employees INT,
	constraint pk_manufacturer PRIMARY KEY(ID)
);

-- SELECCIONAR TABLA manufacturer
SELECT * FROM manufacturer;

-- INGRESAR DATOS 
INSERT INTO manufacturer(name, num_employees)
values('Ford', 29000);
INSERT INTO manufacturer(name, num_employees)
values('Toyota', 45000);
INSERT INTO manufacturer(name, num_employees)
VALUES('Chevrolet', 32000);
INSERT INTO manufacturer(name, num_employees)
VALUES('Honda', 37000);
INSERT INTO manufacturer(name, num_employees)
VALUES('BMW', 25000);


-- MODEL
CREATE TABLE model(
	id SERIAL,
	name VARCHAR(50) NOT NULL,
	id_manufacturer INT,
	CONSTRAINT pk_model PRIMARY KEY(id),
	CONSTRAINT fk_model_manufacturer FOREIGN KEY(id_manufacturer) REFERENCES manufacturer(id)
);

-- INGRESAR DATOS A MODEL
INSERT INTO model (name, id_manufacturer) 
VALUES('Modeo', 1);
INSERT INTO model (name, id_manufacturer) 
VALUES('Fiesta', 1);
INSERT INTO model (name, id_manufacturer) 
VALUES('Prius', 2);
INSERT INTO model(name, id_manufacturer)
VALUES('Civic', 4);
INSERT INTO model(name, id_manufacturer)
VALUES('Accord', 4);
INSERT INTO model(name, id_manufacturer)
VALUES('Cruze', 3);
INSERT INTO model(name, id_manufacturer)
VALUES('Camaro', 3);
INSERT INTO model(name, id_manufacturer)
VALUES('320i', 5);
INSERT INTO model(name, id_manufacturer)
VALUES('X5', 5);


SELECT * FROM model LIMIT 50;

-- VERSION
CREATE TABLE version(
	id SERIAL,
	name VARCHAR(50),
	engine VARCHAR(50),
	price NUMERIC,
	cc NUMERIC(2,1),
	id_model INT,
	CONSTRAINT pk_version PRIMARY KEY(id),
	CONSTRAINT fk_version FOREIGN KEY(id_model) REFERENCES model(id) ON UPDATE SET NULL ON DELETE SET NULL 
);
SELECT * FROM version LIMIT 50;

-- INGRESAR DATOS EN VERSION
INSERT INTO version(name, engine, price, cc, id_model) 
VALUES('Basic', 'Diesel', 30000.00, 1.9, 2);
INSERT INTO version(name, engine, price, cc, id_model)
VALUES('Civic LX', '1.5L Turbo', 22000, 1.5, 4);
INSERT INTO version(name, engine, price, cc, id_model)
VALUES('Civic EX', '2.0L Turbo', 25000, 2.0, 4);
INSERT INTO version(name, engine, price, cc, id_model)
VALUES('Cruze LT', '1.4L Turbo', 18000, 1.4, 7);
INSERT INTO version(name, engine, price, cc, id_model)
VALUES('Camaro SS', '6.2L V8', 42000, 6.2, 8);
INSERT INTO version(name, engine, price, cc, id_model)
VALUES('320i Sport', '2.0L Turbo', 35000, 2.0, 9);
INSERT INTO version(name, engine, price, cc, id_model)
VALUES('X5 xDrive', '3.0L I6', 60000, 3.0, 9);

