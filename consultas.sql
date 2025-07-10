USE gestion_academica
GO

-- CONSULTAS
-- 1. Alumnos aprobados por curso (nota >= 13)
SELECT
	a.nombre + ' ' + a.apellido AS Alumno,
	c.nombre AS Curso,
	cal.nota
FROM calificaciones cal
JOIN matriculas m ON m.matricula_id = cal.matricula_id
JOIN alumnos a ON a.alumno_id = m.alumno_id
JOIN cursos c ON c.curso_id = m.curso_id
WHERE cal.nota >= 13
ORDER BY cal.nota ASC
GO



-- 2. Promedio general por alumno
EXEC sp_calcularPromedioAlumno 14
GO

-- 3. Cursos con más inscritos
SELECT
	c.nombre AS Curso,
	COUNT(m.matricula_id) AS TotalInscritos
FROM cursos c
JOIN matriculas m ON m.curso_id = c.curso_id
GROUP BY c.nombre
ORDER BY TotalInscritos DESC

-- 4. Alumnos de una carrera específica 
SELECT 
	CONCAT(a.nombre, SPACE(1), a.apellido) AS Alumno,
	ca.nombre AS Carrera
FROM alumnos a
JOIN matriculas m ON m.alumno_id = a.alumno_id
JOIN cursos c ON c.curso_id = m.curso_id
JOIN carreras ca ON ca.carrera_id = a.carrera_id
WHERE ca.nombre = 'Ingeniería de Software'

-- 5. Cantidad de alumnos por carrera
SELECT
	ca.nombre AS Carrera,
	COUNT(a.alumno_id) AS TotalAlumnos
FROM carreras ca
JOIN alumnos a ON a.carrera_id = ca.carrera_id
GROUP BY ca.nombre
ORDER BY TotalAlumnos DESC

-- 5. Cantidad de Cursos sin matriculados 
SELECT 
	c.nombre AS Curso
FROM cursos c
LEFT JOIN matriculas m ON m.curso_id = c.curso_id
WHERE m.matricula_id IS NULL