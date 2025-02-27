### Lista de Tareas para la Base de Datos PostgreSQL: Tech Solutions

**Nombre de la Base de Datos**: `tech_solutions_db`

#### 1. Creación de la Base de Datos
- Crear una base de datos llamada `tech_solutions_db`.

#### 2. Creación de Esquemas
- Crear un esquema `public`.
- Crear un esquema `admin`.

#### 3. Creación de Tablas y Columnas
##### Tabla `employees_2025`
- `id`: `SERIAL`, `PRIMARY KEY`
- `name`: `VARCHAR(100)`, `NOT NULL`
- `email`: `VARCHAR(100)`, `UNIQUE`
- `birth_day`: `DATE`, `CHECK (birth_day < CURRENT_DATE - INTERVAL '18 years')`
- `salary`: `INTEGER`, `CHECK (salary > 0)`

#### 4. Actualización de Secuencias y Restricciones

##### Insertar Valores Manualmente y Actualizar Secuencia
- Insertar un registro con `id` específico.
- Actualizar secuencia para evitar conflictos futuros.

#### 5. Modificación de Columnas y Agregación de Restricciones
##### Modificar Columna `salary`
- Asegurarse de que todos los valores en `salary` son mayores que 0.

##### Agregar Restricción `UNIQUE` a la Columna `email`
- Asegurarse de que todos los valores en `email` sean únicos.

##### Verificar y Actualizar Valores Existentes
- Verificar valores nulos y duplicados.
- Actualizar registros que no cumplan con las restricciones antes de aplicarlas.

#### 6. Gestión de Esquemas
- Crear tablas adicionales en el esquema `admin` según sea necesario.
- Asignar permisos específicos a cada esquema para un control de acceso más granular.
