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
		PRINT 'Facultad agrgada correctamente.'
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

