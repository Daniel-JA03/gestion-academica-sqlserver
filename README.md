# 🎓 Proyecto SQL - Gestión Académica

Este proyecto simula un sistema académico básico. Está desarrollado con **SQL Server** e incluye el diseño de base de datos, inserción de datos, procedimientos almacenados, vistas, triggers y transacciones.

---

## 📌 Objetivo del proyecto

Crear una base de datos relacional que permita gestionar de forma organizada la información académica de una institución educativa. Incluye operaciones CRUD, reportes útiles y un mecanismos de control como triggers y transacciones.

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

El sistema cuenta con las siguientes tablas, relacionadas mediante claves foráneas:

- `facultades`
- `carreras`
- `alumnos`
- `docentes`
- `cursos`
- `matriculas`
- `calificaciones`
- `historial_calificaciones` (usada para el trigger de auditoría)

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

- ✅ Alumnos aprobados por curso (**nota >= 13**)
- 📊 Promedio general por alumno
- 📈 Cursos con más inscritos
- 🧑‍🎓 Alumnos de una carrera específica 
- 📌 Cantidad de alumnos por carrera
- ❌ Cantidad de Cursos sin matriculados

---

## 🔄 Vistas SQL

- `vista_alumnos_matriculados` -> Alumnos matriculados por curso
- `vista_detalle_calificaciones` -> Detalle de calificaciones
- `vista_promedio_alumno` -> Promedio general por alumno

---

## ⚠️ Triggers

### `TR_Historial_Calificaciones`

Este trigger se activa automáticamente ante **INSERT, UPDATE y DELETE** en la tabla `calificaciones` y guarda un historial completo en la tabla `historial_calificaciones`, registrando:

- Los datos antiguos y nuevos.
- Fecha y hora del cambio.
- Usuario y host desde donde se hizo.
- Tipo de acción: Inserción, Actualización o Eliminación.

Esto permite auditar todos los movimientos sobre las calificaciones.

---

## 💾 Transacciones

Se implementó una transacción que garantiza que tanto la matrícula como la calificación del alumno se registren correctamente. En caso de error, se ejecuta un `ROLLBACK`.














  
