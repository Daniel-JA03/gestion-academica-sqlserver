USE gestion_academica
GO

CREATE TABLE historial_calificaciones (
	historial_id INT PRIMARY KEY IDENTITY(1,1),
	nota_id INT,
	matricula_id INT,
	nota DECIMAL(10,2),
	fecha_registro DATE,
	usuario VARCHAR(100),
	host VARCHAR(100),
	fecha_modificacion DATETIME DEFAULT GETDATE(),
	accion VARCHAR(50),
	estado VARCHAR(50)
)
GO

--Trigger
CREATE OR ALTER TRIGGER TR_Historial_Calificaciones
ON calificaciones
FOR INSERT, UPDATE, DELETE
AS
BEGIN
	-- ACTUALIZAR
	IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
	BEGIN
		-- NUEVOS DATOS (inserted)
		INSERT INTO historial_calificaciones (nota_id, matricula_id, nota, fecha_registro, usuario, host, fecha_modificacion, accion, estado)
		SELECT i.nota_id, i.matricula_id, i.nota, i.fecha_registro, USER_NAME(), HOST_NAME(), GETDATE(), 'Actualización', 'New Data'
		FROM inserted i

		-- DATOS ANTERIORES (deleted)
		INSERT INTO historial_calificaciones (nota_id, matricula_id, nota, fecha_registro, usuario, host, fecha_modificacion, accion, estado)
		SELECT d.nota_id, d.matricula_id, d.nota, d.fecha_registro, USER_NAME(), HOST_NAME(), GETDATE(), 'Actualización', 'Old Data'
		FROM deleted d

		PRINT 'Se ha realizado una actualizacion en la tabla calificaciones.'
	END
	-- INSERTAR
	ELSE IF EXISTS (SELECT * FROM inserted)
	BEGIN
		INSERT INTO historial_calificaciones (nota_id, matricula_id, nota, fecha_registro, usuario, host, fecha_modificacion, accion, estado)
		SELECT i.nota_id, i.matricula_id, i.nota, i.fecha_registro, USER_NAME(), HOST_NAME(), GETDATE(), 'Inserción', 'New Data'
		FROM inserted i

		PRINT 'Se ha realizado una inserción en la tabla calificaciones.'
	END
	-- ELIMINAR
	ELSE
	BEGIN
		INSERT INTO historial_calificaciones (nota_id, matricula_id, nota, fecha_registro, usuario, host, fecha_modificacion, accion, estado)
		SELECT d.nota_id, d.matricula_id, d.nota, d.fecha_registro, USER_NAME(), HOST_NAME(), GETDATE(), 'Eliminación', 'Old Data'
		FROM deleted d

		PRINT 'Se ha realizado una eliminación en la tabla calificaciones.'
	END
END
GO



-- PROBAR EL TRIGGER
INSERT INTO calificaciones (matricula_id, nota)
VALUES (3, 11.5)
GO

SELECT * FROM historial_calificaciones
SELECT * FROM calificaciones
--
---
UPDATE calificaciones
SET nota = 14.0
WHERE nota_id = 32
GO

SELECT * FROM historial_calificaciones
SELECT * FROM calificaciones
--
---
DELETE FROM calificaciones
WHERE nota_id = 32
GO

SELECT * FROM historial_calificaciones
SELECT * FROM calificaciones