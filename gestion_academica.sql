CREATE DATABASE gestion_academica
GO

USE gestion_academica
GO

CREATE TABLE facultades (
facultad_id INT PRIMARY KEY IDENTITY(1,1),
nombre VARCHAR(100) NOT NULL
)
GO

CREATE TABLE carreras (
carrera_id INT PRIMARY KEY IDENTITY(1,1),
nombre VARCHAR(100) NOT NULL,
facultad_id INT,
FOREIGN KEY(facultad_id) REFERENCES facultades(facultad_id)
)
GO

CREATE TABLE alumnos (
alumno_id INT PRIMARY KEY IDENTITY(1,1),
dni VARCHAR(8) NOT NULL,
nombre VARCHAR(100),
apellido VARCHAR(100),
correo VARCHAR(100),
fecha_nacimiento DATE,
carrera_id INT,
FOREIGN KEY(carrera_id) REFERENCES carreras(carrera_id)
)
GO


CREATE TABLE docentes (
docente_id INT PRIMARY KEY IDENTITY(1,1),
dni VARCHAR(8) NOT NULL,
nombre VARCHAR(100),
apellido VARCHAR(100),
correo VARCHAR(100),
especialidad VARCHAR(100)
)
GO

CREATE TABLE cursos (
curso_id INT PRIMARY KEY IDENTITY(1,1),
nombre VARCHAR(100),
descripcion TEXT,
creditos INT,
docente_id INT,
FOREIGN KEY(docente_id) REFERENCES docentes(docente_id)
)
GO

CREATE  TABLE matriculas (
matricula_id INT PRIMARY KEY IDENTITY(1,1),
alumno_id INT,
curso_id INT,
fecha_matricula DATE DEFAULT GETDATE(),
FOREIGN KEY(alumno_id) REFERENCES alumnos(alumno_id),
FOREIGN KEY(curso_id) REFERENCES cursos(curso_id)
)
GO

CREATE TABLE calificaciones (
nota_id INT PRIMARY KEY IDENTITY(1,1),
matricula_id INT,
nota DECIMAL(10, 2),
fecha_registro DATE DEFAULT GETDATE()
FOREIGN KEY(matricula_id) REFERENCES matriculas(matricula_id)
)
GO