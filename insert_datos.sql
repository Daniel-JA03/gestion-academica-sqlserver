USE gestion_academica
GO

-- Datos de ejemplo para la tabla 'facultades'
INSERT INTO facultades (nombre) VALUES
('Arquitectura'),
('Administración en Hotelería y Turismo'),
('Ciencias de la Salud'),
('Comunicaciones'),
('Derecho'),
('Educación'),
('Ingeniería');


-- Datos de ejemplo para la tabla 'carreras'
INSERT INTO carreras (nombre, facultad_id)
VALUES
('Arquitectura', 1),
('Hotelería y Administración', 2),
('Turismo y Administración', 2),
('Medicina', 3),
('Enfermeria', 3),
('Odontología', 3),
('Medicina Veterinaria', 3),
('Psicología', 3),
('Comunicación y Periodismo', 4),
('Comunicación y Marketing', 4),
('Derecho', 5),
('Educación', 6),
('Ingeniería de Ciberseguridad', 7),
('Ciencias de la Computación', 7),
('Ingeniería Civil', 7),
('Ingeniería de Sistemas de Información', 7),
('Ingeniería de Software', 7),
('Ingeniería Industrial', 7),
('Ingeniería Electrónica', 7),
('Ingeniería Mecatrónica', 7);

-- Datos de ejemplo para la tabla 'alumnos'
INSERT INTO alumnos (dni, nombre, apellido, correo, fecha_nacimiento, carrera_id)
VALUES
('11223344', 'Juan Carlos', 'Martinez Rios', 'juanmartinez@email.com', '2002-05-15', 1),
('22334455', 'Maria Alejandra', 'Gonzales Soto', 'mariagonzales@email.com', '2003-08-22', 2),
('33445566', 'Pedro Pablo', 'Ramirez Flores', 'pedroramirez@email.com', '2004-02-10', 3),
('44556677', 'Laura Estefania', 'Vargas Mendoza', 'lauravargas@email.com', '2002-11-30', 4),
('55667788', 'Carlos Eduardo', 'Silva Torres', 'carlossilva@email.com', '2003-07-18', 5),
('66778899', 'Ana Beatriz', 'Diaz Castro', 'anadiaz@email.com', '2004-04-05', 6),
('77889900', 'Luis Miguel', 'Herrera Cordova', 'luisherrera@email.com', '2002-09-12', 7),
('88990011', 'Sofia Camila', 'Paredes Ruiz', 'sofiaparedes@email.com', '2003-12-25', 8),
('99001122', 'Diego Armando', 'Maradona Perez', 'diegomaradona@email.com', '2004-06-08', 9),
('10012233', 'Valeria Nicole', 'Quispe Alvarado', 'valeriaquispe@email.com', '2002-03-17', 10),
('11122233', 'Jorge Luis', 'Borges Villegas', 'jorgeborges@email.com', '2003-10-29', 11),
('12223334', 'Carmen Rosa', 'Lopez Gutierrez', 'carmenlopez@email.com', '2004-01-14', 12),
('13334445', 'Fernando Jose', 'Morales Salas', 'fernandomorales@email.com', '2002-08-03', 13),
('14445556', 'Daniela Alejandra', 'Castro Rios', 'danielacastro@email.com', '2003-05-21', 14),
('15556667', 'Roberto Carlos', 'Santillana Mendez', 'robertosantillana@email.com', '2004-07-30', 15),
('16667778', 'Patricia Elizabeth', 'Montesinos Vega', 'patriciamontesinos@email.com', '2002-12-11', 16),
('17778889', 'Oscar Manuel', 'Delgado Fuentes', 'oscardelgado@email.com', '2003-09-05', 17),
('18889990', 'Gabriela Maria', 'Suarez Llanos', 'gabrielasuarez@email.com', '2004-04-19', 18),
('19990001', 'Ricardo Antonio', 'Peralta Jimenez', 'ricardoperalta@email.com', '2002-10-27', 19),
('20001112', 'Lucia Fernanda', 'Rojas Camacho', 'luciarojas@email.com', '2003-06-13', 20);

-- Datos de ejemplo para la tabla 'docentes'
INSERT INTO docentes (dni, nombre, apellido, correo ,especialidad)
VALUES
('23456789', 'Ricardo', 'Mendoza Palacios', 'rmendoza@universidad.edu.pe', 'Diseño Arquitectónico'),
('34567890', 'Lucía', 'Fernández del Castillo', 'lfernandez@universidad.edu.pe', 'Gestión Hotelera'),
('45678901', 'Oscar', 'Torres Rojas', 'otorres@universidad.edu.pe', 'Turismo Sostenible'),
('56789012', 'Dra. Carmen', 'Vega Salinas', 'cvega@universidad.edu.pe', 'Medicina Interna'),
('67890123', 'Enf. Jorge', 'Linares Montes', 'jlinares@universidad.edu.pe', 'Enfermería Clínica'),
('78901234', 'Dr. Luis', 'Díaz Vásquez', 'ldiaz@universidad.edu.pe', 'Cirugía Dental'),
('89012345', 'MVZ Patricia', 'Quiroga Arce', 'pquiroga@universidad.edu.pe', 'Cirugía Veterinaria'),
('90123456', 'Ps. Ana María', 'Salazar Fuentes', 'asalazar@universidad.edu.pe', 'Psicología Clínica'),
('01234567', 'Mg. Carlos', 'Paredes Medina', 'cparedes@universidad.edu.pe', 'Periodismo Digital'),
('12345098', 'Lic. Sofía', 'Ruiz Velasco', 'sruiz@universidad.edu.pe', 'Marketing Digital'),
('23450987', 'Dr. Manuel', 'Gómez Prado', 'mgomez@universidad.edu.pe', 'Derecho Penal'),
('34509876', 'Lic. Rosa', 'Alvarado Mendoza', 'ralvarado@universidad.edu.pe', 'Pedagogía Moderna'),
('45678909', 'Ing. Julio', 'Ramírez Castro', 'jramirez@universidad.edu.pe', 'Seguridad Informática'),
('56789098', 'PhD. Laura', 'Silvestre Chávez', 'lsilvestre@universidad.edu.pe', 'Inteligencia Artificial'),
('67890987', 'Ing. Marco', 'Tello Ríos', 'mtello@universidad.edu.pe', 'Estructuras Civiles'),
('78909876', 'Mg. Daniel', 'Cuellar Paz', 'dcuellar@universidad.edu.pe', 'Bases de Datos'),
('89098765', 'Ing. Patricia', 'Salinas López', 'psalinas@universidad.edu.pe', 'Desarrollo de Software'),
('90987654', 'Ing. Fernando', 'Montes Vásquez', 'fmontes@universidad.edu.pe', 'Logística Industrial'),
('09876543', 'Ing. Karina', 'Dávila Rojas', 'kdavila@universidad.edu.pe', 'Robótica Industrial'),
('98765432', 'Dr. Luis', 'Cabrera Tapia', 'lcabrera@universidad.edu.pe', 'Derecho Constitucional');

-- Datos de ejemplo para la tabla 'cursos'
INSERT INTO cursos (nombre, descripcion, creditos, docente_id)
VALUES
('Diseño Arquitectónico Avanzado', 'Principios avanzados de diseño y planificación arquitectónica', 4, 1),
('Gestión de Alojamientos Turísticos', 'Administración moderna de hoteles y resorts', 3, 2),
('Turismo Ecológico', 'Desarrollo de proyectos turísticos sostenibles', 3, 3),
('Patología Médica', 'Diagnóstico y tratamiento de enfermedades internas', 5, 4),
('Enfermería en Cuidados Intensivos', 'Técnicas especializadas en unidades de cuidados críticos', 4, 5),
('Ortodoncia y Cirugía Maxilofacial', 'Tratamientos avanzados en odontología', 4, 6),
('Cirugía en Pequeños Animales', 'Técnicas quirúrgicas para mascotas y animales domésticos', 4, 7),
('Psicoterapia Cognitivo-Conductual', 'Enfoques terapéuticos para trastornos psicológicos', 3, 8),
('Periodismo de Investigación', 'Metodologías para reportajes de investigación', 3, 9),
('Marketing en Redes Sociales', 'Estrategias digitales para engagement y conversión', 3, 10),
('Derecho Penal Económico', 'Legislación sobre delitos financieros y corporativos', 4, 11),
('Innovación Educativa', 'Metodologías modernas para la enseñanza', 3, 12),
('Ciberseguridad Ofensiva', 'Técnicas de ethical hacking y pentesting', 4, 13),
('Machine Learning Aplicado', 'Algoritmos de IA para solución de problemas reales', 5, 14),
('Diseño de Estructuras Metálicas', 'Cálculo y diseño de edificaciones metálicas', 5, 15),
('Bases de Datos NoSQL', 'Manejo de MongoDB, Cassandra y sistemas distribuidos', 4, 16),
('Desarrollo de Apps Móviles', 'Creación de aplicaciones para iOS y Android', 4, 17),
('Logística Global', 'Gestión de cadena de suministro internacional', 4, 18),
('Robótica Industrial', 'Automatización de procesos con robots', 5, 19),
('Derecho Constitucional Comparado', 'Análisis de constituciones a nivel mundial', 4, 20),
('Dibujo Arquitectónico Digital', 'Uso de software CAD para diseño arquitectónico', 3, 1),
('Eventos y Convenciones', 'Organización de congresos y reuniones corporativas', 3, 2),
('Medicina de Emergencias', 'Protocolos para atención de emergencias médicas', 4, 4),
('Enfermería Pediátrica', 'Cuidados especializados para pacientes infantiles', 4, 5),
('Derecho Internacional', 'Legislación aplicable a relaciones entre estados', 4, 11);

-- Datos de ejemplo para la tabla 'cursos'
INSERT INTO matriculas (alumno_id, curso_id, fecha_matricula)
VALUES
(1, 1, '2023-03-15'),  -- Diseño Arquitectónico Avanzado (Arquitectura)
(1, 21, '2023-03-15'), -- Dibujo Arquitectónico Digital (Arquitectura)
(2, 2, '2023-03-16'),  -- Gestión de Alojamientos Turísticos (Hotelería y Administración)
(2, 22, '2023-03-16'), -- Eventos y Convenciones (Hotelería y Administración)
(3, 3, '2023-03-17'),  -- Turismo Ecológico (Turismo y Administración)
(3, 2, '2023-03-17'),  -- Gestión de Alojamientos Turísticos (Turismo y Administración)
(4, 4, '2023-03-18'),  -- Patología Médica (Medicina)
(4, 23, '2023-03-18'), -- Medicina de Emergencias (Medicina)
(5, 5, '2023-03-19'),  -- Enfermería en Cuidados Intensivos (Enfermería)
(5, 24, '2023-03-19'), -- Enfermería Pediátrica (Enfermería)
(6, 6, '2023-03-20'),  -- Ortodoncia y Cirugía Maxilofacial (Odontología)
(7, 7, '2023-03-21'),  -- Cirugía en Pequeños Animales (Medicina Veterinaria)
(8, 8, '2023-03-22'),  -- Psicoterapia Cognitivo-Conductual (Psicología)
(9, 9, '2023-03-23'),  -- Periodismo de Investigación (Comunicación y Periodismo)
(10, 10, '2023-03-24'), -- Marketing en Redes Sociales (Comunicación y Marketing)
(11, 11, '2023-03-25'), -- Derecho Penal Económico (Derecho)
(11, 25, '2023-03-25'), -- Derecho Internacional (Derecho)
(12, 12, '2023-03-26'), -- Innovación Educativa (Educación)
(13, 13, '2023-03-27'), -- Ciberseguridad Ofensiva (Ingeniería de Ciberseguridad)
(14, 14, '2023-03-28'), -- Machine Learning Aplicado (Ciencias de la Computación)
(15, 15, '2023-03-29'), -- Diseño de Estructuras Metálicas (Ingeniería Civil)
(16, 16, '2023-03-30'), -- Bases de Datos NoSQL (Ingeniería de Sistemas de Información)
(17, 17, '2023-03-31'), -- Desarrollo de Apps Móviles (Ingeniería de Software)
(18, 18, '2023-04-01'), -- Logística Global (Ingeniería Industrial)
(19, 19, '2023-04-02'), -- Robótica Industrial (Ingeniería Electrónica)
(20, 20, '2023-04-03'), -- Derecho Constitucional Comparado (Derecho - segunda carrera)
(20, 11, '2023-04-03'); -- Derecho Penal Económico (Derecho - segunda carrera)

-- Datos de ejemplo para la tabla 'calificaciones'
INSERT INTO calificaciones (matricula_id, nota, fecha_registro)
VALUES
(1, 16.5, '2023-07-15'), -- Arquitectura
(1, 18.0, '2023-07-20'), -- Arquitectura
(2, 14.0, '2023-07-16'), -- Hotelería
(2, 15.5, '2023-07-21'), -- Hotelería
(3, 13.5, '2023-07-17'), -- Turismo
(3, 17.0, '2023-07-22'), -- Turismo
(4, 18.5, '2023-07-18'), -- Medicina
(4, 19.0, '2023-07-23'), -- Medicina
(5, 16.0, '2023-07-19'), -- Enfermería
(5, 15.0, '2023-07-24'), -- Enfermería
(6, 17.5, '2023-07-20'), -- Odontología
(7, 14.5, '2023-07-21'), -- Veterinaria
(8, 16.5, '2023-07-22'), -- Psicología
(9, 15.5, '2023-07-23'), -- Periodismo
(10, 17.0, '2023-07-24'), -- Marketing
(11, 18.0, '2023-07-25'), -- Derecho
(11, 16.5, '2023-07-30'), -- Derecho
(12, 14.5, '2023-07-26'), -- Educación
(13, 19.0, '2023-07-27'), -- Ciberseguridad
(14, 18.5, '2023-07-28'), -- Ciencias Computación
(15, 17.0, '2023-07-29'), -- Ing. Civil
(16, 16.0, '2023-07-30'), -- Ing. Sistemas
(17, 18.5, '2023-07-31'), -- Ing. Software
(18, 15.5, '2023-08-01'), -- Ing. Industrial
(19, 17.5, '2023-08-02'), -- Ing. Electrónica
(20, 16.0, '2023-08-03'), -- Derecho
(20, 14.5, '2023-08-08'); -- Derecho