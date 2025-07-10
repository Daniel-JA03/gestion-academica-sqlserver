use gestion_academica
GO

-- STORED PROCEDURE 
-- ======================================
-- PROCEDIMIENTOS: FACULTADES
-- ======================================
IF OBJECT_ID('sp_agregarFacultad') IS NOT NULL 
	DROP PROC sp_agregarFacultad
GO
-- Agregar una nueva Facultad
CREATE PROC sp_agregarFacultad (
@nombre VARCHAR(100)
)
AS
BEGIN 
	IF NOT EXISTS (SELECT 1 FROM facultades WHERE nombre = @nombre)
	BEGIN
		INSERT INTO facultades (nombre)
		VALUES (@nombre)
		PRINT 'Facultad agregada correctamente.'
	END
	ELSE
	BEGIN
		PRINT 'ERROR: La Facultad ya existe.'
	END
END
GO
-- PRUEBA PROCEDURE
EXEC sp_agregarFacultad 'Artes Contemporáneas'
GO
--
---
IF OBJECT_ID('sp_listarFacultadesBack') IS NOT NULL 
	DROP PROC sp_listarFacultadesBack
GO

-- Listar Facultades Backend
CREATE PROC sp_listarFacultadesBack
AS
BEGIN
	SELECT 
		f.facultad_id,
		f.nombre 
	FROM facultades AS f
END
GO
-- PRUEBA PROCEDURE
sp_listarFacultadesBack
GO
--
---
IF OBJECT_ID('sp_listarFacultadesFrond') IS NOT NULL 
	DROP PROC sp_listarFacultadesFrond
GO
-- Listar Facultades Frontend
CREATE PROC sp_listarFacultadesFrond
AS
BEGIN
	SELECT 
		f.facultad_id AS ID,
		f.nombre AS NombreFacultad 
	FROM facultades AS f
	ORDER BY f.nombre ASC
END
GO
-- PRUEBA PROCEDURE
sp_listarFacultadesFrond
GO
--
---
IF OBJECT_ID('sp_actualizarFacultad') IS NOT NULL 
	DROP PROC sp_actualizarFacultad
GO
-- Actualizar Facultad
CREATE PROC sp_actualizarFacultad (
@idfacultad INT,
@nombre VARCHAR(100)
)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM facultades WHERE facultad_id = @idfacultad)
	BEGIN
		UPDATE facultades
		SET nombre = @nombre
		WHERE facultad_id = @idfacultad
		PRINT 'Facultad actualizada correctamente'
	END
	ELSE
	BEGIN
		PRINT 'ERROR: La Facultad no existe.'
	END
END
GO
-- PRUEBA PROCEDURE
EXEC sp_actualizarFacultad 8, 'Artes Contemporáneas'
GO
--
---
IF OBJECT_ID('sp_eliminarFacultad') IS NOT NULL 
	DROP PROC sp_eliminarFacultad
GO
-- Eliminar Facultadad
CREATE PROC sp_eliminarFacultad (
@idfacultad INT
)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM facultades WHERE facultad_id = @idfacultad)
	BEGIN
		DELETE 
		FROM facultades
		WHERE facultad_id = @idfacultad
		PRINT 'Se elimino correctamente la facultad'
	END
	ELSE
	BEGIN
		PRINT 'ERROR: La Facultad no existe.'
	END
END
GO
-- PRUEBA PROCEDURE
EXEC sp_eliminarFacultad 8
GO

-- ======================================
-- PROCEDIMIENTOS: CARRERAS
-- ======================================
IF OBJECT_ID('sp_agregarCarrera') IS NOT NULL 
	DROP PROC sp_agregarCarrera
GO
-- Agregar una nueva Facultad
CREATE PROC sp_agregarCarrera (
@nombre VARCHAR(100),
@idfacultad INT
)
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM carreras WHERE nombre = @nombre)
	BEGIN
		INSERT INTO carreras(nombre, facultad_id)
		VALUES (@nombre, @idfacultad)
		PRINT 'Carrera agregada correctamente.'
	END
	ELSE
	BEGIN
		PRINT 'ERROR: La Carrera ya existe.'
	END
END
GO

-- PRUEBA PROCEDURE
EXEC sp_agregarCarrera 'Artes Escénicas', 9
GO
--
---
IF OBJECT_ID('sp_listarCarrerasBack') IS NOT NULL 
	DROP PROC sp_listarCarrerasBack
GO

-- Listar Carreras Backend
CREATE PROC sp_listarCarrerasBack
AS
BEGIN
	SELECT
		c.carrera_id,
		c.nombre,
		c.facultad_id
	FROM carreras AS c
END
GO
-- PRUEBA PROCEDURE
sp_listarCarrerasBack
--
---
IF OBJECT_ID('sp_listarCarrerasFront') IS NOT NULL 
	DROP PROC sp_listarCarrerasFront
GO

-- Listar Carreras Frontend
CREATE PROC sp_listarCarrerasFront
AS
BEGIN
	SELECT 
		c.carrera_id AS ID,
		c.nombre AS NombreCarrera,
		f.nombre AS Facultad
	FROM carreras AS c
	JOIN facultades f ON f.facultad_id = c.facultad_id
	ORDER BY c.nombre ASC
END
GO
-- PRUEBA PROCEDURE
sp_listarCarrerasFront
--
---
IF OBJECT_ID('sp_actualizarCarreras') IS NOT NULL 
	DROP PROC sp_actualizarCarreras
GO

-- Actualizar Carreras
CREATE PROC sp_actualizarCarreras (
@idcarrera INT,
@nombre VARCHAR(100),
@idfacultad INT
)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM carreras WHERE carrera_id = @idcarrera)
	BEGIN
		UPDATE carreras
		SET nombre = @nombre,
			facultad_id = @idfacultad
		WHERE carrera_id = @idcarrera

		PRINT 'Se actualizo la Carrera Correctamente.'
	END
	ELSE
	BEGIN
		PRINT 'ERROR: La Carrera no existe.'
	END
END
GO
-- PRUEBA PROCEDURE
sp_actualizarCarreras 21, 'Artes Escénicas', 9
--
---
IF OBJECT_ID('sp_eliminarCarrera') IS NOT NULL 
	DROP PROC sp_eliminarCarrera
GO

-- Eliminar Carrera
CREATE PROC sp_eliminarCarrera (
@idcarrera INT
)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM carreras WHERE carrera_id = @idcarrera)
	BEGIN
		DELETE 
		FROM carreras
		WHERE carrera_id = @idcarrera

		PRINT 'Se elimino correctamente la facultad'
	END
	ELSE
	BEGIN
		PRINT 'ERROR: La Carrera no existe.'
	END
END
GO

-- PRUEBA PROCEDURE
EXEC sp_eliminarCarrera 21
--
---

-- ======================================
-- PROCEDIMIENTOS: ALUMNOS
-- ======================================
IF OBJECT_ID('sp_agregarAlumno') IS NOT NULL 
	DROP PROC sp_agregarAlumno
GO
-- Agregar un nuevo Alumno
CREATE PROC sp_agregarAlumno (
@dni VARCHAR(8),
@nombre VARCHAR(100),
@apellido VARCHAR(100),
@correo VARCHAR(100),
@fecnac DATE,
@idcarrera INT
)
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM alumnos WHERE dni = @dni)
	BEGIN
		INSERT INTO alumnos (dni, nombre, apellido, correo, fecha_nacimiento, carrera_id)
		VALUES (@dni, @nombre, @apellido, @correo, @fecnac, @idcarrera)

		PRINT 'Alumno agregado correctamente.'
	END
	ELSE
	BEGIN
		PRINT 'ERROR: ya existe un alumno con ese DNI'
	END
END
GO

-- PRUEBA PROCEDURE
EXEC sp_agregarAlumno '94567850', 'Beto', 'Ortiz', 'beto@gmail.com', '2000-05-12', 2
--
---
IF OBJECT_ID('sp_listarAlumnosBack') IS NOT NULL 
	DROP PROC sp_listarAlumnosBack
GO

-- Listar Alumnos Backend
CREATE PROC sp_listarAlumnosBack
AS
BEGIN
	SELECT
	a.alumno_id,
	a.dni,
	a.nombre,
	a.apellido,
	a.correo,
	a.fecha_nacimiento,
	a.carrera_id
	FROM alumnos AS a
END
GO
-- PRUEBA PROCEDURE
EXEC sp_listarAlumnosBack
--
---
IF OBJECT_ID('sp_listarAlumnosFront') IS NOT NULL 
	DROP PROC sp_listarAlumnosFront
GO

-- Listar Alumnos Frontend
CREATE PROC sp_listarAlumnosFront
AS
BEGIN
	SELECT
	a.alumno_id AS ID,
	a.dni AS DNI,
	CONCAT(a.nombre, SPACE(1), a.apellido) AS Alumno,
	a.correo AS Correo,
	a.fecha_nacimiento AS FechaNacimiento,
	c.nombre AS Carrera
	FROM alumnos AS a
	JOIN carreras c ON c.carrera_id = a.carrera_id
	ORDER BY c.nombre ASC
END
GO
-- PRUEBA PROCEDURE
EXEC sp_listarAlumnosFront
--
---
IF OBJECT_ID('sp_actualizarAlumno') IS NOT NULL 
	DROP PROC sp_actualizarAlumno
GO

-- Actualizar Alumno
CREATE PROC sp_actualizarAlumno (
@idalumno INT,
@dni VARCHAR(8),
@nombre VARCHAR(100),
@apellido VARCHAR(100),
@correo VARCHAR(100),
@fecNac DATE,
@idcarrera INT
)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM alumnos WHERE alumno_id = @idalumno)
	BEGIN
		UPDATE alumnos
		SET dni = @dni,
			nombre = @nombre,
			apellido = @apellido,
			correo = @correo,
			fecha_nacimiento = @fecNac,
			carrera_id = @idcarrera
		WHERE alumno_id =  @idalumno
		PRINT 'Se actualizo el Alumno Correctamente.'
	END
	ELSE
	BEGIN
		PRINT 'ERROR: El Alumno no existe'
	END
END
GO
-- PRUEBA PROCEDURE
EXEC sp_actualizarAlumno 21, '94567850', 'Beto update', 'Perez', 'beto@gmail.com', '2003-05-12', 2
--
---
IF OBJECT_ID('sp_eliminarAlumno') IS NOT NULL 
	DROP PROC sp_eliminarAlumno
GO

-- Eliminar Alumno
CREATE PROC sp_eliminarAlumno (
@idalumno INT
)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM alumnos WHERE alumno_id = @idalumno)
	BEGIN
		DELETE
		FROM alumnos
		WHERE alumno_id = @idalumno

		PRINT 'Se elimino correctamente al Alumno'
	END
	ELSE
	BEGIN
		PRINT 'ERROR: El Alumno no existe'
	END
END
GO

-- PRUEBA PROCEDURE
EXEC sp_eliminarAlumno 21