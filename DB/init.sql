CREATE TABLE `Estudiantes` (
  `ID_Estudiante` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  'Fecha_Nacimiento' date NOT NULL,
  'Direccion' varchar(100) NOT NULL,
  'Telefono' varchar(15) NOT NULL,
  PRIMARY KEY (`ID_Estudiante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `Profesores` (
  'ID_Profesor' int(9) unsigned NOT NULL AUTO_INCREMENT,
  'Nombre' varchar(45) NOT NULL,
  'Apellido' varchar(45) NOT NULL,
  'Email' varchar(100) NOT NULL,
  'Especialidad' varchar(70) NOT NULL,
  PRIMARY KEY (`ID_Profesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `Asignatura` (
  'ID_Asignatura' int(9) unsigned NOT NULL AUTO_INCREMENT,
  'Nombre_Asignatura' varchar(100) NOT NULL,
  -- Codigo unico para cada asignatura
  'Codigo_Asignatura' varchar(10) UNIQUE NOT NULL,
  'ID_Profesor_Encargado' int(9) unsigned,
  PRIMARY KEY (`ID_Asignatura`),
  FOREIGN KEY (`ID_Profesor_Encargado`) REFERENCES `Profesores`(`ID_Profesor`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `Matriculas` (
  'ID_Matricula' int(9) unsigned NOT NULL AUTO_INCREMENT,
  'ID_Estudiante' int(9) unsigned NOT NULL,
  'ID_Asignatura' int(9) unsigned NOT NULL,
  'Periodo_Academico' varchar(20) NOT NULL,
  'Fecha_Matricula' date NOT NULL,
  PRIMARY KEY (`ID_Matricula`),
  FOREIGN KEY (`ID_Estudiante`) REFERENCES `Estudiantes`(`ID_Estudiante`) ON DELETE CASCADE,
  FOREIGN KEY (`ID_Asignatura`) REFERENCES `Asignatura`(`ID_Asignatura`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE 'Asistencia' (
  'ID_Asistencia' int(9) unsigned NOT NULL AUTO_INCREMENT,
  'ID_Matricula' int(9) unsigned NOT NULL,
  'Fecha' date NOT NULL,
  'Estado' enum('Presente', 'Ausente', 'Tarde') NOT NULL,
  PRIMARY KEY (`ID_Asistencia`),
  FOREIGN KEY (`ID_Matricula`) REFERENCES `Matriculas`(`ID_Matricula`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

insert into Profesores (Nombre, Apellido, Email, Especialidad) values
('Juan', 'Perez', 'juanperez@ejemplo.com', 'Matematicas'),
('Maria', 'Gomez', 'mariagomez@ejemple.com', 'Historia'),

insert into Asignatura (Nombre_Asignatura, Codigo_Asignatura, ID_Profesor_Encargado) values
('Algebra', 'MAT101', 1),
('Geometria', 'MAT102', 1),
('Historia Universal', 'HIS101', 2);

insert into Estudiantes (Nombre, Apellido, Fecha_Nacimiento, Direccion, Telefono) values
('Carlos', 'Lopez', '2005-03-15', 'Calle Falsa 123', '555-1234'),
('Ana', 'Martinez', '2006-07-22', 'Avenida Siempre Viva 742', '555-5678');

insert into Matriculas (ID_Estudiante, ID_Asignatura, Periodo_Academico, Fecha_Matricula) values
(1, 1, '2024/2025', '2024-01-10'),
(1, 2, '2024/2025', '2024-01-10'),
(2, 1, '2024/2025', '2024-01-11'),
(2, 3, '2024/2025', '2024-01-11');