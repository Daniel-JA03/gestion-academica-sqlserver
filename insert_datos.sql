USE gestion_academica
GO

-- Datos de ejemplo para la tabla 'facultades'
INSERT INTO facultades (nombre) VALUES
('Arquitectura'),
('Administraci�n en Hoteler�a y Turismo'),
('Ciencias de la Salud'),
('Comunicaciones'),
('Derecho'),
('Educaci�n'),
('Ingenier�a');


-- Datos de ejemplo para la tabla 'carreras'
INSERT INTO carreras (nombre, facultad_id)
VALUES
('Arquitectura', 1),
('Hoteler�a y Administraci�n', 2),
('Turismo y Administraci�n', 2),
('Medicina', 3),
('Enfermeria', 3),
('Odontolog�a', 3),
('Medicina Veterinaria', 3),
('Psicolog�a', 3),
('Comunicaci�n y Periodismo', 4),
('Comunicaci�n y Marketing', 4),
('Derecho', 5),
('Educaci�n', 6),
('Ingenier�a de Ciberseguridad', 7),
('Ciencias de la Computaci�n', 7),
('Ingenier�a Civil', 7),
('Ingenier�a de Sistemas de Informaci�n', 7),
('Ingenier�a de Software', 7),
('Ingenier�a Industrial', 7),
('Ingenier�a Electr�nica', 7),
('Ingenier�a Mecatr�nica', 7);

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
('23456789', 'Ricardo', 'Mendoza Palacios', 'rmendoza@universidad.edu.pe', 'Dise�o Arquitect�nico'),
('34567890', 'Luc�a', 'Fern�ndez del Castillo', 'lfernandez@universidad.edu.pe', 'Gesti�n Hotelera'),
('45678901', 'Oscar', 'Torres Rojas', 'otorres@universidad.edu.pe', 'Turismo Sostenible'),
('56789012', 'Dra. Carmen', 'Vega Salinas', 'cvega@universidad.edu.pe', 'Medicina Interna'),
('67890123', 'Enf. Jorge', 'Linares Montes', 'jlinares@universidad.edu.pe', 'Enfermer�a Cl�nica'),
('78901234', 'Dr. Luis', 'D�az V�squez', 'ldiaz@universidad.edu.pe', 'Cirug�a Dental'),
('89012345', 'MVZ Patricia', 'Quiroga Arce', 'pquiroga@universidad.edu.pe', 'Cirug�a Veterinaria'),
('90123456', 'Ps. Ana Mar�a', 'Salazar Fuentes', 'asalazar@universidad.edu.pe', 'Psicolog�a Cl�nica'),
('01234567', 'Mg. Carlos', 'Paredes Medina', 'cparedes@universidad.edu.pe', 'Periodismo Digital'),
('12345098', 'Lic. Sof�a', 'Ruiz Velasco', 'sruiz@universidad.edu.pe', 'Marketing Digital'),
('23450987', 'Dr. Manuel', 'G�mez Prado', 'mgomez@universidad.edu.pe', 'Derecho Penal'),
('34509876', 'Lic. Rosa', 'Alvarado Mendoza', 'ralvarado@universidad.edu.pe', 'Pedagog�a Moderna'),
('45678909', 'Ing. Julio', 'Ram�rez Castro', 'jramirez@universidad.edu.pe', 'Seguridad Inform�tica'),
('56789098', 'PhD. Laura', 'Silvestre Ch�vez', 'lsilvestre@universidad.edu.pe', 'Inteligencia Artificial'),
('67890987', 'Ing. Marco', 'Tello R�os', 'mtello@universidad.edu.pe', 'Estructuras Civiles'),
('78909876', 'Mg. Daniel', 'Cuellar Paz', 'dcuellar@universidad.edu.pe', 'Bases de Datos'),
('89098765', 'Ing. Patricia', 'Salinas L�pez', 'psalinas@universidad.edu.pe', 'Desarrollo de Software'),
('90987654', 'Ing. Fernando', 'Montes V�squez', 'fmontes@universidad.edu.pe', 'Log�stica Industrial'),
('09876543', 'Ing. Karina', 'D�vila Rojas', 'kdavila@universidad.edu.pe', 'Rob�tica Industrial'),
('98765432', 'Dr. Luis', 'Cabrera Tapia', 'lcabrera@universidad.edu.pe', 'Derecho Constitucional');

-- Datos de ejemplo para la tabla 'cursos'
INSERT INTO cursos (nombre, descripcion, creditos, docente_id)
VALUES
('Dise�o Arquitect�nico Avanzado', 'Principios avanzados de dise�o y planificaci�n arquitect�nica', 4, 1),
('Gesti�n de Alojamientos Tur�sticos', 'Administraci�n moderna de hoteles y resorts', 3, 2),
('Turismo Ecol�gico', 'Desarrollo de proyectos tur�sticos sostenibles', 3, 3),
('Patolog�a M�dica', 'Diagn�stico y tratamiento de enfermedades internas', 5, 4),
('Enfermer�a en Cuidados Intensivos', 'T�cnicas especializadas en unidades de cuidados cr�ticos', 4, 5),
('Ortodoncia y Cirug�a Maxilofacial', 'Tratamientos avanzados en odontolog�a', 4, 6),
('Cirug�a en Peque�os Animales', 'T�cnicas quir�rgicas para mascotas y animales dom�sticos', 4, 7),
('Psicoterapia Cognitivo-Conductual', 'Enfoques terap�uticos para trastornos psicol�gicos', 3, 8),
('Periodismo de Investigaci�n', 'Metodolog�as para reportajes de investigaci�n', 3, 9),
('Marketing en Redes Sociales', 'Estrategias digitales para engagement y conversi�n', 3, 10),
('Derecho Penal Econ�mico', 'Legislaci�n sobre delitos financieros y corporativos', 4, 11),
('Innovaci�n Educativa', 'Metodolog�as modernas para la ense�anza', 3, 12),
('Ciberseguridad Ofensiva', 'T�cnicas de ethical hacking y pentesting', 4, 13),
('Machine Learning Aplicado', 'Algoritmos de IA para soluci�n de problemas reales', 5, 14),
('Dise�o de Estructuras Met�licas', 'C�lculo y dise�o de edificaciones met�licas', 5, 15),
('Bases de Datos NoSQL', 'Manejo de MongoDB, Cassandra y sistemas distribuidos', 4, 16),
('Desarrollo de Apps M�viles', 'Creaci�n de aplicaciones para iOS y Android', 4, 17),
('Log�stica Global', 'Gesti�n de cadena de suministro internacional', 4, 18),
('Rob�tica Industrial', 'Automatizaci�n de procesos con robots', 5, 19),
('Derecho Constitucional Comparado', 'An�lisis de constituciones a nivel mundial', 4, 20),
('Dibujo Arquitect�nico Digital', 'Uso de software CAD para dise�o arquitect�nico', 3, 1),
('Eventos y Convenciones', 'Organizaci�n de congresos y reuniones corporativas', 3, 2),
('Medicina de Emergencias', 'Protocolos para atenci�n de emergencias m�dicas', 4, 4),
('Enfermer�a Pedi�trica', 'Cuidados especializados para pacientes infantiles', 4, 5),
('Derecho Internacional', 'Legislaci�n aplicable a relaciones entre estados', 4, 11);

-- Datos de ejemplo para la tabla 'cursos'
INSERT INTO matriculas (alumno_id, curso_id, fecha_matricula)
VALUES
(1, 1, '2023-03-15'),  -- Dise�o Arquitect�nico Avanzado (Arquitectura)
(1, 21, '2023-03-15'), -- Dibujo Arquitect�nico Digital (Arquitectura)
(2, 2, '2023-03-16'),  -- Gesti�n de Alojamientos Tur�sticos (Hoteler�a y Administraci�n)
(2, 22, '2023-03-16'), -- Eventos y Convenciones (Hoteler�a y Administraci�n)
(3, 3, '2023-03-17'),  -- Turismo Ecol�gico (Turismo y Administraci�n)
(3, 2, '2023-03-17'),  -- Gesti�n de Alojamientos Tur�sticos (Turismo y Administraci�n)
(4, 4, '2023-03-18'),  -- Patolog�a M�dica (Medicina)
(4, 23, '2023-03-18'), -- Medicina de Emergencias (Medicina)
(5, 5, '2023-03-19'),  -- Enfermer�a en Cuidados Intensivos (Enfermer�a)
(5, 24, '2023-03-19'), -- Enfermer�a Pedi�trica (Enfermer�a)
(6, 6, '2023-03-20'),  -- Ortodoncia y Cirug�a Maxilofacial (Odontolog�a)
(7, 7, '2023-03-21'),  -- Cirug�a en Peque�os Animales (Medicina Veterinaria)
(8, 8, '2023-03-22'),  -- Psicoterapia Cognitivo-Conductual (Psicolog�a)
(9, 9, '2023-03-23'),  -- Periodismo de Investigaci�n (Comunicaci�n y Periodismo)
(10, 10, '2023-03-24'), -- Marketing en Redes Sociales (Comunicaci�n y Marketing)
(11, 11, '2023-03-25'), -- Derecho Penal Econ�mico (Derecho)
(11, 25, '2023-03-25'), -- Derecho Internacional (Derecho)
(12, 12, '2023-03-26'), -- Innovaci�n Educativa (Educaci�n)
(13, 13, '2023-03-27'), -- Ciberseguridad Ofensiva (Ingenier�a de Ciberseguridad)
(14, 14, '2023-03-28'), -- Machine Learning Aplicado (Ciencias de la Computaci�n)
(15, 15, '2023-03-29'), -- Dise�o de Estructuras Met�licas (Ingenier�a Civil)
(16, 16, '2023-03-30'), -- Bases de Datos NoSQL (Ingenier�a de Sistemas de Informaci�n)
(17, 17, '2023-03-31'), -- Desarrollo de Apps M�viles (Ingenier�a de Software)
(18, 18, '2023-04-01'), -- Log�stica Global (Ingenier�a Industrial)
(19, 19, '2023-04-02'), -- Rob�tica Industrial (Ingenier�a Electr�nica)
(20, 20, '2023-04-03'), -- Derecho Constitucional Comparado (Derecho - segunda carrera)
(20, 11, '2023-04-03'); -- Derecho Penal Econ�mico (Derecho - segunda carrera)

-- Datos de ejemplo para la tabla 'calificaciones'
INSERT INTO calificaciones (matricula_id, nota, fecha_registro)
VALUES
(1, 16.5, '2023-07-15'), -- Arquitectura
(1, 18.0, '2023-07-20'), -- Arquitectura
(2, 14.0, '2023-07-16'), -- Hoteler�a
(2, 15.5, '2023-07-21'), -- Hoteler�a
(3, 13.5, '2023-07-17'), -- Turismo
(3, 17.0, '2023-07-22'), -- Turismo
(4, 18.5, '2023-07-18'), -- Medicina
(4, 19.0, '2023-07-23'), -- Medicina
(5, 16.0, '2023-07-19'), -- Enfermer�a
(5, 15.0, '2023-07-24'), -- Enfermer�a
(6, 17.5, '2023-07-20'), -- Odontolog�a
(7, 14.5, '2023-07-21'), -- Veterinaria
(8, 16.5, '2023-07-22'), -- Psicolog�a
(9, 15.5, '2023-07-23'), -- Periodismo
(10, 17.0, '2023-07-24'), -- Marketing
(11, 18.0, '2023-07-25'), -- Derecho
(11, 16.5, '2023-07-30'), -- Derecho
(12, 14.5, '2023-07-26'), -- Educaci�n
(13, 19.0, '2023-07-27'), -- Ciberseguridad
(14, 18.5, '2023-07-28'), -- Ciencias Computaci�n
(15, 17.0, '2023-07-29'), -- Ing. Civil
(16, 16.0, '2023-07-30'), -- Ing. Sistemas
(17, 18.5, '2023-07-31'), -- Ing. Software
(18, 15.5, '2023-08-01'), -- Ing. Industrial
(19, 17.5, '2023-08-02'), -- Ing. Electr�nica
(20, 16.0, '2023-08-03'), -- Derecho
(20, 14.5, '2023-08-08'); -- Derecho