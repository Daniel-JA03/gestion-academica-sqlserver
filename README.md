# 🎓 Proyecto SQL - Gestión Académica

Este proyecto simula un sistema académico básico. Está desarrollado con **SQL Server** e incluye el diseño de base de datos, inserción de datos, procedimientos almacenados, vistas, triggers y transacciones.

---

## 📁 Estructura del Proyecto

```plaintext
.
├── gestion_academica.sql          -- Script de creación de tablas y relaciones
├── insert_datos.sql               -- Datos de prueba para todas las tablas
├── procedimientos.sql             -- Procedimientos almacenados (SP)
├── consultas.sql                  -- Consultas útiles del sistema
├── vistas.sql                     -- Vistas creadas a partir de consultas
├── trigger.sql                   -- Triggers para historial de calificaciones
├── transacciones.sql              -- Transacciones para registrar matrícula y calificación del alumno
```
---

## 🗃️ Tablas del Proyecto

- facultades
- carreras
- alumnos
- docentes
- cursos
- matriculas
- calificaciones
- historial_calificaciones (para el triggers)

---

## ⚙️ Procedimientos Almacenados

| Facultades | Carreras | Alumnos | Docente | Cursos | Matriculas | Calificaciones |
|------------|----------|---------|---------|------------|----------------|----------------|
| `sp_agregarFacultad`   | `sp_agregarCarrera` | `sp_agregarAlumno` | `sp_agregarDocente` | `sp_agregarCurso` | `sp_agregarMatricula` | `sp_agregarCalificacion` |
| `sp_listarFacultadesBack`    | `sp_listarCarrerasBack` | `sp_listarAlumnosBack` | `sp_listarDocentes` | `sp_listarCursosBack` | `sp_listarMatriculaBack` | `sp_listarCalificacionesPorAlumno` |
| `sp_listarFacultadesFrond`  | `sp_listarCarrerasFront` | `sp_listarAlumnosFront` | `sp_actualizarDocente` | `sp_listarCursosFrond` | `sp_listarMatriculaFrond` | `sp_calcularPromedioAlumno` |
| `sp_actualizarFacultad`    | `sp_actualizarCarreras` | `sp_actualizarAlumno` | `sp_eliminarDocente` | `sp_actualizarCurso` | `sp_eliminarMatricula` |  |
| `sp_eliminarFacultad`   | `sp_eliminarCarrera` | `sp_eliminarAlumno` |  | `sp_eliminarCurso` |  |  |

---

## 🔍 Consultas Útiles

- Alumnos aprobados por curso (**nota >= 13**)
- Promedio general por alumno
- Cursos con más inscritos
- Alumnos de una carrera específica 
- Cantidad de alumnos por carrera
- Cantidad de Cursos sin matriculados

---

## 🔄 Vistas SQL

- Alumnos matriculados por curso
- Detalle de calificaciones
- Promedio general por alumno

---

## ⚠️ Triggers

- **TR_Historial_Calificaciones** : inserciones, actualizaciones y eliminaciones sobre la tabla `calificaciones`

---

## 💾 Transacciones

Incluye una transacción que registra automáticamente una matrícula y su calificación en caso de éxito o realiza rollback en caso de error.













  
