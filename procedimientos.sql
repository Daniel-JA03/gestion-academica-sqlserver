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
--
---

-- ======================================
-- PROCEDIMIENTOS: DOCENTES
-- ======================================
IF OBJECT_ID('sp_agregarDocente') IS NOT NULL 
	DROP PROC sp_agregarDocente
GO
-- Agregar un nuevo Docente
CREATE PROC sp_agregarDocente (
@dni VARCHAR(8),
@nombre VARCHAR(100),
@apellido VARCHAR(100),
@correo VARCHAR(100),
@especi VARCHAR(100)
)
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM docentes WHERE dni = @dni)
	BEGIN
		INSERT INTO docentes (dni, nombre, apellido, correo, especialidad)
		VALUES (@dni, @nombre, @apellido, @correo, @especi)

		PRINT 'Docente registrado correctamente'
	END
	ELSE
	BEGIN
		PRINT 'ERROR: ya existe un docente con ese DNI'
	END
END
GO
-- PRUEBA PROCEDURE
EXEC sp_agregarDocente '49023654', 'Daniel', 'Rojas', 'daniel@gmail.com', 'Bases de Datos'

--
---
IF OBJECT_ID('sp_listarDocentes') IS NOT NULL 
	DROP PROC sp_listarDocentes
GO

-- Listar Docentes Backend
CREATE PROC sp_listarDocentes
AS
BEGIN
	SELECT 
		d.docente_id,
		d.dni,
		d.nombre,
		d.apellido,
		d.correo,
		d.especialidad
	FROM docentes AS d
END
GO
-- PRUEBA PROCEDURE
EXEC sp_listarDocentes
--
---
IF OBJECT_ID('sp_actualizarDocente') IS NOT NULL 
	DROP PROC sp_actualizarDocente
GO

-- Actualizar Docente
CREATE PROC sp_actualizarDocente (
@iddocente INT,
@dni VARCHAR(8),
@nombre VARCHAR(100),
@apellido VARCHAR(100),
@correo VARCHAR(100),
@especi VARCHAR(100)
)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM docentes WHERE docente_id = @iddocente)
	BEGIN
		UPDATE docentes
		SET dni = @dni,
			nombre = @nombre,
			apellido = @apellido,
			correo = @correo,
			especialidad = @especi
		WHERE docente_id = @iddocente

		PRINT 'Docente actualizado correctamente'
	END
	ELSE
	BEGIN
		PRINT 'ERROR: El Docente no existe'
	END
END
GO
-- PRUEBA PROCEDURE
EXEC sp_actualizarDocente 21, 49023654, 'Daniel update', 'Rojas Perez', 'daniel@gmail.com', 'Bases de Datos'
--
---
IF OBJECT_ID('sp_eliminarDocente') IS NOT NULL 
	DROP PROC sp_eliminarDocente
GO

-- Eliminar Docente
CREATE PROC sp_eliminarDocente (
@iddocente INT
)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM docentes WHERE docente_id = @iddocente)
	BEGIN
		DELETE
		FROM docentes
		WHERE docente_id = @iddocente

		PRINT 'Docente eliminado correctamente'
	END
	ELSE
	BEGIN
		PRINT 'ERROR: El Docente no existe'
	END
END
GO
-- PRUEBA PROCEDURE
EXEC sp_eliminarDocente 21
--
---

-- ======================================
-- PROCEDIMIENTOS: CURSOS
-- ======================================
IF OBJECT_ID('sp_agregarCurso') IS NOT NULL 
	DROP PROC sp_agregarCurso
GO
-- Agregar un nuevo Curso
CREATE PROC sp_agregarCurso (
@nombre VARCHAR(100),
@descrip TEXT,
@credit INT,
@iddocente INT
)
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM cursos WHERE nombre = @nombre)
	BEGIN
		INSERT INTO cursos(nombre, descripcion, creditos, docente_id)
		VALUES(@nombre, @descrip, @credit, @iddocente)

		PRINT 'Curso agregado correctamente'
	END
	ELSE
	BEGIN
		PRINT 'ERROR: El Curso ya existe.'
	END
END
GO
-- PRUEBA PROCEDURE
EXEC sp_agregarCurso 'POO', 'Programacion Orientada a Objetos Java', 3, 16
--
---
IF OBJECT_ID('sp_listarCursosBack') IS NOT NULL 
	DROP PROC sp_listarCursosBack
GO

-- Listar Cursos Backend
CREATE PROC sp_listarCursosBack
AS
BEGIN
	SELECT
		c.curso_id,
		c.nombre,
		c.descripcion,
		c.creditos,
		c.docente_id
	FROM cursos AS c
END
GO
-- PRUEBA PROCEDURE
EXEC sp_listarCursosBack
--
---
IF OBJECT_ID('sp_listarCursosFrond') IS NOT NULL 
	DROP PROC sp_listarCursosFrond
GO
-- Listar Facultades Frontend
CREATE PROC sp_listarCursosFrond
AS
BEGIN
	SELECT 
		c.curso_id AS ID,
		c.nombre AS NombreCurso,
		c.descripcion AS Descripcion,
		c.creditos AS Creditos,
		CONCAT(d.nombre, SPACE(1), d.apellido) AS Docente
	FROM cursos AS c
	JOIN docentes d ON d.docente_id = c.docente_id
	ORDER BY c.nombre ASC
END
GO
-- PRUEBA PROCEDURE
EXEC sp_listarCursosFrond
--
---
IF OBJECT_ID('sp_actualizarCurso') IS NOT NULL 
	DROP PROC sp_actualizarCurso
GO

-- Actualizar Curso
CREATE PROC sp_actualizarCurso (
@idcurso INT,
@nombre VARCHAR(100),
@descrip TEXT,
@credit INT,
@iddocente INT
)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM cursos WHERE curso_id = @idcurso)
	BEGIN
		UPDATE cursos
		SET nombre = @nombre,
			descripcion = @descrip,
			creditos = @credit,
			docente_id = @iddocente
		WHERE curso_id = @idcurso

		PRINT 'Curso actualizada correctamente'
	END
	ELSE
	BEGIN
		PRINT 'ERROR: El Curso no existe.'
	END
END
GO
-- PRUEBA PROCEDURE
EXEC sp_actualizarCurso 26, 'POO I', 'Programacion Orientada a Objetos Java', 3, 16
--
---
IF OBJECT_ID('sp_eliminarCurso') IS NOT NULL 
	DROP PROC sp_eliminarCurso
GO

-- Eliminar Curso
CREATE PROC sp_eliminarCurso (
@idcurso INT
)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM cursos WHERE curso_id = @idcurso)
	BEGIN
		DELETE 
		FROM cursos
		WHERE curso_id = @idcurso
		PRINT 'Se elimino el Curso Correctamente'
	END
	ELSE
	BEGIN
		PRINT 'ERROR: El Curso no existe.'
	END
END
GO
-- PRUEBA PROCEDURE
EXEC sp_eliminarCurso 26
--
---

-- ======================================
-- PROCEDIMIENTOS: MATRICULAS
-- ======================================
IF OBJECT_ID('sp_agregarMatricula') IS NOT NULL 
	DROP PROC sp_agregarMatricula
GO
-- Agregar un nuevo Matricula
CREATE PROC sp_agregarMatricula (
@idalumno INT,
@idcurso INT,
@fecmatri DATE
)
AS
BEGIN
	INSERT INTO matriculas(alumno_id, curso_id, fecha_matricula)
	VALUES(@idalumno, @idcurso, @fecmatri)
	PRINT 'Matricula registrado correctamente'
END
GO
-- PRUEBA PROCEDURE
EXEC sp_agregarMatricula 20, 12, '2023-05-03'

select * from matriculas
--
---
IF OBJECT_ID('sp_listarMatriculaBack') IS NOT NULL 
	DROP PROC sp_listarMatriculaBack
GO

-- Listar Matricula Backend
CREATE PROC sp_listarMatriculaBack
AS
BEGIN
	SELECT 
	m.matricula_id,
	m.alumno_id,
	m.curso_id,
	m.fecha_matricula
	FROM matriculas AS m
END
GO
-- PRUEBA PROCEDURE
EXEC sp_listarMatriculaBack
--
---
IF OBJECT_ID('sp_listarMatriculaFrond') IS NOT NULL 
	DROP PROC sp_listarMatriculaFrond
GO
-- Listar Matricula Frontend
CREATE PROC sp_listarMatriculaFrond
AS
BEGIN
	SELECT
		m.matricula_id AS ID,
		CONCAT(a.nombre, SPACE(1), a.apellido) AS Alumno,
		c.nombre AS Curso,
		m.fecha_matricula AS FechaMatricula
	FROM matriculas AS m
	JOIN alumnos a ON a.alumno_id = m.alumno_id
	JOIN cursos c ON c.curso_id = m.curso_id
	ORDER BY Alumno ASC
END
GO
-- PRUEBA PROCEDURE
EXEC sp_listarMatriculaFrond
--
---
IF OBJECT_ID('sp_eliminarMatricula') IS NOT NULL 
	DROP PROC sp_eliminarMatricula
GO

-- Eliminar Matricula
CREATE PROC sp_eliminarMatricula (
@idmatricula INT
)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM matriculas WHERE matricula_id = @idmatricula)
	BEGIN
		DELETE
		FROM matriculas
		WHERE matricula_id = @idmatricula
		PRINT 'Se elimino Matricula Correctamente'
	END
	ELSE
	BEGIN
		PRINT 'ERROR: La Matricula no existe.'
	END
END
GO
-- PRUEBA PROCEDURE
EXEC sp_eliminarMatricula 28
--
---

-- ======================================
-- PROCEDIMIENTOS: CALIFICACIONES
-- ======================================
IF OBJECT_ID('sp_agregarCalificacion') IS NOT NULL 
	DROP PROC sp_agregarCalificacion
GO
-- Agregar una nueva calificacion
CREATE PROC sp_agregarCalificacion (
@idmatricula INT,
@nota DECIMAL(10, 2),
@fechregistro DATE
)
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM matriculas WHERE matricula_id = @idmatricula)
	BEGIN
		PRINT 'ERROR: La matricula no existe'
		RETURN
	END

	-- Validar que la nota este entre 0 y 20
	IF @nota < 0 OR @nota > 20
	BEGIN
		PRINT 'ERROR: La nota debe estar entre 0 y 20.'
        RETURN
	END

	BEGIN TRY
		INSERT INTO calificaciones(matricula_id, nota, fecha_registro)
		VALUES (@idmatricula, @nota, @fechregistro)

		PRINT 'Se registro correctamente la calificacion'
	END TRY
	BEGIN CATCH
		-- Manejo de errores
		PRINT 'Ocurrio un error al registrar la calificacion: ' + ERROR_MESSAGE()
	END CATCH
END
GO
-- PRUEBA PROCEDURE
EXEC sp_agregarCalificacion 26, 19, '2023-09-15'

--
---
IF OBJECT_ID('sp_listarCalificacionesPorAlumno') IS NOT NULL 
	DROP PROC sp_listarCalificacionesPorAlumno
GO
-- Listar calificaiones por alumno
CREATE PROC sp_listarCalificacionesPorAlumno (
	@idalumno INT
)
AS
BEGIN 
	IF NOT EXISTS (SELECT 1 FROM alumnos WHERE alumno_id = @idalumno)
	BEGIN
		PRINT 'ERROR: El alumno no existe'
		RETURN
	END

	SELECT
		CONCAT(a.nombre, SPACE(1), a.apellido) AS Alumno,
		cu.nombre AS Curso,
		m.fecha_matricula AS FecjaMatricula,
		c.nota AS Nota,
		c.fecha_registro AS FechaCalificacion
	FROM matriculas AS m
		JOIN alumnos a ON a.alumno_id = m.alumno_id
		JOIN cursos cu ON cu.curso_id = m.curso_id 
		LEFT JOIN calificaciones c ON c.matricula_id = m.matricula_id
	WHERE m.alumno_id = @idalumno
	ORDER BY cu.nombre, c.fecha_registro DESC
END
GO
-- PRUEBA PROCEDURE
EXEC sp_listarCalificacionesPorAlumno 20
