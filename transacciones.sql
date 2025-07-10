-- ======================================
-- TRANSACCIONES 
-- ======================================

-- Registrar Matricula y calificacion del alumno
BEGIN TRY
	BEGIN TRAN

	DECLARE @idAlumno INT = 12
	DECLARE @idCurso INT = 2
	DECLARE @nota DECIMAL (5,2) = 15.3

	--INSERTAR MATRICULA
	INSERT INTO matriculas (alumno_id, curso_id, fecha_matricula)
	VALUES(@idAlumno, @idCurso, GETDATE())

	DECLARE @matriculaNueva INT = SCOPE_IDENTITY()

	--INSERTAR CALIFICACION RELACIONADA
	INSERT INTO calificaciones (matricula_id, nota, fecha_registro)
	VALUES (@matriculaNueva, @nota, GETDATE())

	COMMIT TRAN
	PRINT 'Matricula y calificacion registrada correctamente.'

END TRY
BEGIN CATCH
	ROLLBACK TRAN
	PRINT 'Error en la transaccion: ' + ERROR_MESSAGE()
END CATCH
GO

SELECT * FROM calificaciones
