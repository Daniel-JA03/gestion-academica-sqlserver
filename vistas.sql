-- =========================================
-- VISTAS DEL PROYECTO: GESTIÓN ACADÉMICA
-- =========================================

-- Alumnos matriculados por curso
CREATE VIEW vista_alumnos_matriculados
AS
SELECT 
	a.alumno_id,
	CONCAT(a.nombre, SPACE(1), a.apellido) AS Alumno,
	c.nombre AS Curso,
	m.fecha_matricula 
FROM matriculas m
JOIN alumnos a ON  a.alumno_id = m.alumno_id
JOIN cursos c ON c.curso_id = m.curso_id
GO

-- Detalle de calificaciones
CREATE VIEW vista_detalle_calificaciones
AS
SELECT
	cal.nota_id,
	CONCAT(a.nombre, SPACE(1), a.apellido) AS Alumno,
	c.nombre AS Curso,
	cal.nota,
	cal.fecha_registro
FROM calificaciones cal
JOIN matriculas m ON m.matricula_id = cal.matricula_id
JOIN alumnos a ON  a.alumno_id = m.alumno_id
JOIN cursos c ON c.curso_id = m.curso_id
GO

-- Promedio general por alumno
CREATE VIEW vista_promedio_alumno
AS
SELECT 
	a.alumno_id,
	CONCAT(a.nombre, SPACE(1), a.apellido) AS Alumno,
	ROUND(AVG(cal.nota), 2) AS Promedio
FROM calificaciones cal
JOIN matriculas m ON m.matricula_id = cal.matricula_id
JOIN alumnos a ON  a.alumno_id = m.alumno_id
GROUP BY a.alumno_id, a.nombre, a.apellido
GO

-- PROBAR VISTAS
SELECT * FROM vista_alumnos_matriculados
SELECT * FROM vista_detalle_calificaciones
SELECT * FROM vista_promedio_alumno