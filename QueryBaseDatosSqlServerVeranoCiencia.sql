

CREATE TABLE alumno (
    idAlumno INT PRIMARY KEY IDENTITY(1,1),
    matricula VARCHAR(20) NOT NULL,
    CURP VARCHAR(18) NOT NULL,
    semestre int NOT NULL,
    promedio DECIMAL(4,2) DEFAULT NULL,
    porcentajeAvanceCarrera TINYINT DEFAULT 1,
    idCarrera INT NOT NULL,
    nombreInvestigadorRecomienda VARCHAR(250) DEFAULT NULL,
    telefonoInvestigadorRecomienda VARCHAR(20) DEFAULT NULL,
    correoInvestigadorRecomienda VARCHAR(200) DEFAULT NULL,
    idUsuario INT NOT NULL,
    idVerano INT NOT NULL,
    fechaCreacion DATETIME DEFAULT GETDATE(),
    fechaModifica DATETIME DEFAULT NULL,
    estatus TINYINT DEFAULT 1
);
CREATE TABLE area (
    idarea INT PRIMARY KEY IDENTITY(1,1),
    descripcion VARCHAR(300) NOT NULL,
    estatus INT DEFAULT 1
);


CREATE TABLE campus (
    idCampus INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    abreviaturaCampus VARCHAR(20) DEFAULT NULL,
    idInstitucion INT NOT NULL,
    idMunicipio INT NOT NULL,
    estatus TINYINT DEFAULT 1
);

CREATE TABLE carrera (
    idCarrera INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    idCampus INT NOT NULL,
    estatus TINYINT DEFAULT 1
);
CREATE TABLE coordinador (
    idCoordinador INT PRIMARY KEY IDENTITY(1,1),
    puesto VARCHAR(50) NOT NULL,
    esCoordinadorInstitucional INT NOT NULL,
    idUsuario INT NOT NULL,
    fechaCreacion DATETIME DEFAULT GETDATE(),
    fechaModifica DATETIME DEFAULT NULL,
    estatus TINYINT DEFAULT 1
);


CREATE TABLE documento (
    idDocumento INT PRIMARY KEY IDENTITY(1,1),
    descripcion VARCHAR(250) NOT NULL,
    prefijo VARCHAR(20) NOT NULL,
    estatus TINYINT DEFAULT 1
);

CREATE TABLE documentoalumno (
    idDocumentoAlumno INT PRIMARY KEY IDENTITY(1,1),
    idDocumento INT NOT NULL,
    idAlumno INT NOT NULL,
    fechaCreacion DATETIME DEFAULT GETDATE(),
    fechaModifica DATETIME DEFAULT NULL,
    estatus TINYINT DEFAULT 1
);

CREATE TABLE estado (
    idEstado INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(50) NOT NULL,
    estatus TINYINT DEFAULT 1
);

CREATE TABLE institucion (
    idInstitucion INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(250) NOT NULL,
    abreviatura VARCHAR(20) DEFAULT NULL,
    idEstado INT NOT NULL,
    estatus TINYINT DEFAULT 1
);

CREATE TABLE investigador (
    idInvestigador INT PRIMARY KEY IDENTITY(1,1),
    titulo VARCHAR(50) NOT NULL,
    departamento VARCHAR(50) NOT NULL,
    nivelSNI TINYINT DEFAULT 0,
    PRODEP TINYINT DEFAULT 0,
    idUsuario INT NOT NULL,
    fechaCreacion DATETIME DEFAULT GETDATE(),
    fechaModifica DATETIME DEFAULT NOT NULL,
    estatus TINYINT DEFAULT 1
);
select *FROM modulo


CREATE TABLE modulo (
    idmodulo INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(200) NOT NULL,
    descripcion TEXT NOT NULL,
    ruta VARCHAR(200) NOT NULL,
    estatus INT DEFAULT 1
);

CREATE TABLE municipio (
    idMunicipio INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(50) NOT NULL,
    idEstado INT NOT NULL,
    estatus TINYINT DEFAULT 1
);
select *FROM municipio

CREATE TABLE proyecto (
    idProyecto INT PRIMARY KEY IDENTITY(1,1),
    titulo VARCHAR(250) NOT NULL,
    perfil TEXT NOT NULL,
    porcentajeAvanceCarrera TINYINT DEFAULT 1,
    carrera VARCHAR(100) NOT NULL,
    actividad TEXT NOT NULL,
    habilidad TEXT NOT NULL,
    modalidad TEXT NOT NULL,
    observaciones TEXT NOT NULL,
    cantidadAlumnos TINYINT DEFAULT NULL,
    validado INT DEFAULT 0,
    idUsuarioInvestigador INT NOT NULL,
    idCampus INT NOT NULL,
    idInstitucion INT NOT NULL,
    idVerano INT NOT NULL,
    idarea INT NOT NULL,
    fechaCreacion DATETIME DEFAULT GETDATE(),
    fechaModifica DATETIME DEFAULT NULL,
    estatus TINYINT DEFAULT 1
);
select *from reporte

CREATE TABLE reporte (
    idreporte INT PRIMARY KEY IDENTITY(1,1),
    idusuario INT NOT NULL,
    idstatusreporte INT NOT NULL,
    idproyecto INT NOT NULL,
    fechaactualizacion DATETIME DEFAULT GETDATE(),
    status INT DEFAULT 1
);

CREATE TABLE reportestatus (
    idreportestatus INT PRIMARY KEY IDENTITY(1,1),
    descripcion VARCHAR(200) NOT NULL,
    status INT DEFAULT 1
);
select *from solicitud

CREATE TABLE solicitud (
    idSolicitud INT PRIMARY KEY IDENTITY(1,1),
    comentario TEXT DEFAULT NULL,
    numeroVuelta TINYINT DEFAULT 2,
    idProyecto INT NOT NULL,
    orden INT DEFAULT 1,
    aceptada TINYINT DEFAULT 0,
    idVerano INT NOT NULL,
    idUsuarioAlumno INT NOT NULL,
    fechaCreacion DATETIME DEFAULT GETDATE(),
    fechaModifica DATETIME DEFAULT NULL,
    estatus TINYINT DEFAULT 1
);

CREATE TABLE tipousuario (
    idTipoUsuario INT PRIMARY KEY IDENTITY(1,1),
    descripcion VARCHAR(25) NOT NULL,
    estatus TINYINT DEFAULT 1
);
select *from tipousuariomodulo

CREATE TABLE tipousuariomodulo (
    idtipousuariomodulo INT PRIMARY KEY IDENTITY(1,1),
    idtipousuario INT NOT NULL,
    idmodulo INT NOT NULL,
    estatus INT DEFAULT 1
);

CREATE TABLE usuario (
    idUsuario INT PRIMARY KEY IDENTITY(1,1),
    idTipoUsuario INT NOT NULL,
    correo VARCHAR(50) NOT NULL,
    clave VARCHAR(500) NOT NULL,
    nombre VARCHAR(250) NOT NULL,
    apellidoPaterno VARCHAR(30) NOT NULL,
    apellidoMaterno VARCHAR(30) NOT NULL,
    fechaNacimiento DATE DEFAULT NULL,
    genero VARCHAR(20) DEFAULT NULL,
    telefono VARCHAR(20) DEFAULT NULL,
    calle VARCHAR(20) DEFAULT NULL,
    colonia VARCHAR(50) DEFAULT NULL,
    numero VARCHAR(10) DEFAULT NULL,
    codigoPostal VARCHAR(10) DEFAULT NULL,
    idCampus INT NOT NULL,
    fechaCreacion DATETIME DEFAULT GETDATE(),
    fechaModifica DATETIME DEFAULT NULL,
    validado TINYINT DEFAULT 0,
    idUsuarioValida INT DEFAULT NULL,
    fechaValida DATETIME DEFAULT NULL,
    estatus TINYINT DEFAULT 1
);

CREATE TABLE verano (
    idVerano INT PRIMARY KEY IDENTITY(1,1),
    descripcion VARCHAR(300) DEFAULT NULL,
    fechaVeranoInicio DATETIME DEFAULT NULL,
    fechaVeranoFin DATETIME DEFAULT NULL,
    proyectosPorInvestigador INT DEFAULT NULL,
    solicitudesPorAlumno INT DEFAULT NULL,
    alumnosPorProyecto INT DEFAULT NULL,
    porcentajeMinimoAvanceAlumno INT DEFAULT NULL,
    fechaCrearProyectoInicio DATETIME DEFAULT NULL,
    fechaCrearProyectoFin DATETIME DEFAULT NULL,
    fechaValidarInvestigadorInicio DATETIME DEFAULT NULL,
    fechaValidarInvestigadorFin DATETIME DEFAULT NULL,
    fechaCrearSolicitudInicio DATETIME DEFAULT NULL,
    fechaCrearSolicitudFin DATETIME DEFAULT NULL,
    fechaValidarSolicitudInicio DATETIME DEFAULT NULL,
	    estatus TINYINT DEFAULT 1

);
select *from verano


-- Agregar relaciones
--alumno
ALTER TABLE alumno ADD FOREIGN KEY (idCarrera) REFERENCES carrera(idCarrera)
ALTER TABLE alumno ADD FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario)
ALTER TABLE alumno ADD FOREIGN KEY (idVerano) REFERENCES verano(idVerano)

--campus
ALTER TABLE campus ADD FOREIGN KEY (idInstitucion) REFERENCES institucion(idInstitucion)
ALTER TABLE campus ADD FOREIGN KEY (idMunicipio) REFERENCES municipio(idMunicipio)
ALTER TABLE campus ADD CONSTRAINT CampusMunicipio FOREIGN KEY (idMunicipio) REFERENCES municipio (idMunicipio)

--carrera
ALTER TABLE carrera ADD CONSTRAINT CarreraCampus FOREIGN KEY (idCampus) REFERENCES campus (idCampus)

--coordinador

ALTER TABLE coordinador ADD CONSTRAINT UsuarioCoordinador FOREIGN KEY (idUsuario) REFERENCES usuario (idUsuario)

--documentoalumono

ALTER TABLE documentoalumno ADD CONSTRAINT documentoAlumnoDocumento FOREIGN KEY (idDocumento) REFERENCES documento (idDocumento)
ALTER TABLE documentoalumno ADD CONSTRAINT documentoAlumnoAlumno FOREIGN KEY (idAlumno) REFERENCES alumno (idAlumno)

--institucion

ALTER TABLE institucion ADD CONSTRAINT institucionEstado FOREIGN KEY (idEstado) REFERENCES estado (idEstado)

--investigador

ALTER TABLE investigador ADD CONSTRAINT investigadorUsuario FOREIGN KEY (idUsuario) REFERENCES usuario (idUsuario)

--municipio 

ALTER TABLE municipio ADD CONSTRAINT municipioEstado FOREIGN KEY (idEstado) REFERENCES estado (idEstado)

--proyecto
ALTER TABLE proyecto ADD CONSTRAINT ProyectoInvestigador FOREIGN KEY (idUsuarioInvestigador) REFERENCES investigador (idInvestigador)
ALTER TABLE proyecto ADD CONSTRAINT ProyectoCampus FOREIGN KEY (idCampus) REFERENCES campus (idCampus)
ALTER TABLE proyecto ADD CONSTRAINT ProyectoInstitucion FOREIGN KEY (idInstitucion) REFERENCES institucion (idInstitucion)
ALTER TABLE proyecto ADD CONSTRAINT ProyectoVerano FOREIGN KEY (idVerano) REFERENCES verano (idVerano)
ALTER TABLE proyecto ADD CONSTRAINT ProyectoArea FOREIGN KEY (idarea) REFERENCES area (idarea)


--reporte
ALTER TABLE reporte ADD CONSTRAINT ReporteUsuario FOREIGN KEY (idUsuario) REFERENCES usuario (idUsuario)
ALTER TABLE reporte ADD CONSTRAINT ReporteStatusss FOREIGN KEY (idstatusreporte) REFERENCES reportestatus (idreportestatus)
ALTER TABLE reporte ADD CONSTRAINT ReporteProyecto FOREIGN KEY (idproyecto) REFERENCES proyecto (idProyecto)


--solicitud
ALTER TABLE solicitud ADD CONSTRAINT solicitudProyecto FOREIGN KEY (idProyecto) REFERENCES proyecto (idProyecto)
ALTER TABLE solicitud ADD CONSTRAINT solicitudVerano FOREIGN KEY (idVerano) REFERENCES verano (idVerano)
ALTER TABLE solicitud ADD CONSTRAINT solicitudUsuarioAlumno FOREIGN KEY (idUsuarioAlumno) REFERENCES usuario (idUsuario)

--tipousuariomodulo
ALTER TABLE tipousuariomodulo ADD CONSTRAINT tipousUarioModuloTipo FOREIGN KEY (idtipousuario) REFERENCES tipousuario (idTipoUsuario)
ALTER TABLE tipousuariomodulo ADD CONSTRAINT tipousUarioModuloModulo FOREIGN KEY (idmodulo) REFERENCES modulo (idmodulo)


--usuario

ALTER TABLE usuario ADD CONSTRAINT usuarioTipoUsuario FOREIGN KEY (idTipoUsuario) REFERENCES tipousuario (idTipoUsuario)
ALTER TABLE usuario ADD CONSTRAINT usuarioCampus FOREIGN KEY (idCampus) REFERENCES campus (idCampus)


--  índices
CREATE INDEX idx_alumno_idCarrera ON alumno(idCarrera);
CREATE INDEX idx_alumno_idUsuario ON alumno(idUsuario);
CREATE INDEX idx_alumno_idVerano ON alumno(idVerano);

CREATE INDEX idx_campus_idInstitucion ON campus(idInstitucion);
CREATE INDEX idx_campus_idMunicipio ON campus(idMunicipio);

CREATE INDEX idx_carrera_idCampus ON carrera(idCampus);

CREATE INDEX idx_coordinador_idUsuario ON coordinador(idUsuario);

CREATE INDEX idx_documentoalumno_idDocumento ON documentoalumno(idDocumento);
CREATE INDEX idx_documentoalumno_idAlumno ON documentoalumno(idAlumno);

CREATE INDEX idx_institucion_idEstado ON institucion(idEstado);

CREATE INDEX idx_investigador_idUsuario ON investigador(idUsuario);

CREATE INDEX idx_municipio_idEstado ON municipio(idEstado);

CREATE INDEX idx_proyecto_idUsuarioInvestigador ON proyecto(idUsuarioInvestigador);
CREATE INDEX idx_proyecto_idCampus ON proyecto(idCampus);
CREATE INDEX idx_proyecto_idInstitucion ON proyecto(idInstitucion);
CREATE INDEX idx_proyecto_idVerano ON proyecto(idVerano);
CREATE INDEX idx_proyecto_idarea ON proyecto(idarea);

CREATE INDEX idx_reporte_idusuario ON reporte(idusuario);
CREATE INDEX idx_reporte_idstatusreporte ON reporte(idstatusreporte);
CREATE INDEX idx_reporte_idproyecto ON reporte(idproyecto);

CREATE INDEX idx_solicitud_idProyecto ON solicitud(idProyecto);
CREATE INDEX idx_solicitud_idVerano ON solicitud(idVerano);
CREATE INDEX idx_solicitud_idUsuarioAlumno ON solicitud(idUsuarioAlumno);

CREATE INDEX idx_tipousuariomodulo_idtipousuario ON tipousuariomodulo(idtipousuario);
CREATE INDEX idx_tipousuariomodulo_idmodulo ON tipousuariomodulo(idmodulo);

CREATE INDEX idx_usuario_idTipoUsuario ON usuario(idTipoUsuario);
CREATE INDEX idx_usuario_idCampus ON usuario(idCampus);


-- Insertar un registro en la tabla alumno
INSERT INTO alumno ( matricula, CURP, semestre, promedio, porcentajeAvanceCarrera, idCarrera, nombreInvestigadorRecomienda, telefonoInvestigadorRecomienda, correoInvestigadorRecomienda, idUsuario, idVerano, fechaCreacion, fechaModifica, estatus)
VALUES ( 'A003prueba2', 'CURP001', 4, 8.5, 50, 1, 'Dr. Juan Perez', '555-1234', 'juan.perez@universidad.edu', 1, 1, GETDATE(), NULL, 1);
select *from usuario

-- Insertar un registro en la tabla area
INSERT INTO area (descripcion, estatus)
VALUES ('Ciencias Naturales', 1);

-- Insertar un registro en la tabla campus
INSERT INTO campus ( nombre, abreviaturaCampus, idInstitucion, idMunicipio, estatus)
VALUES ( 'Campus Centralssss', 'CC', 1, 1, 1);

-- Insertar un registro en la tabla carrera
INSERT INTO carrera ( nombre, idCampus, estatus)
VALUES ('Ingeniería de Software', 1, 1);

-- Insertar un registro en la tabla coordinador
INSERT INTO coordinador ( puesto, esCoordinadorInstitucional, idUsuario, fechaCreacion, fechaModifica, estatus)
VALUES ( 'Coordinador Académico', 1, 2, GETDATE(), NULL, 1);

-- Insertar un registro en la tabla documento
INSERT INTO documento ( descripcion, prefijo, estatus)
VALUES ( 'Identificación Oficial', 'ID', 1);

-- Insertar un registro en la tabla documentoalumno
INSERT INTO documentoalumno ( idDocumento, idAlumno, fechaCreacion, fechaModifica, estatus)
VALUES ( 1, 4, GETDATE(), NULL, 1);

-- Insertar un registro en la tabla estado
INSERT INTO estado ( nombre, estatus)
VALUES ('Nuevo León', 1);
-- Insertar un registro en la tabla institucion
INSERT INTO institucion ( nombre, abreviatura, idEstado, estatus)
VALUES ('Universidad no autonoma de Nuevo Leónn', 'UANL', 1, 1);
select *from proyecto

-- Insertar un registro en la tabla investigador
INSERT INTO investigador ( titulo, departamento, nivelSNI, PRODEP, idUsuario, fechaCreacion, fechaModifica, estatus)
VALUES ( 'Dr.', 'Biología', 1, 1, 1, GETDATE(), GETDATE(), 1);

-- Insertar un registro en la tabla modulo
INSERT INTO modulo ( nombre, descripcion, ruta, estatus)
VALUES ( 'Gestión de Proyectos', 'Modulo para la gestión de proyectos', '/gestion/proyectos', 1);

-- Insertar un registro en la tabla municipio
INSERT INTO municipio ( nombre, idEstado, estatus)
VALUES ( 'Monterrey', 1, 1);

-- Insertar un registro en la tabla proyecto
INSERT INTO proyecto ( titulo, perfil, porcentajeAvanceCarrera, carrera, actividad, habilidad, modalidad, observaciones, cantidadAlumnos, validado, idUsuarioInvestigador, idCampus, idInstitucion, idVerano, idarea, fechaCreacion, fechaModifica, estatus)
VALUES ('Desarrollo de Software', 'Perfil de estudiante de ingeniería', 50, 'Ingeniería de Software', 'Desarrollo de aplicaciones', 'Programación', 'Presencial', 'Ninguna', 1, 1, 3, 1, 1, 1, 1, 11/07/22, 11/07/24, 1);

-- Insertar un registro en la tabla reporte
INSERT INTO reporte ( idusuario, idstatusreporte, idproyecto, fechaactualizacion, status)
VALUES ( 1, 1, 5, GETDATE(), 1);

-- Insertar un registro en la tabla reportestatus
INSERT INTO reportestatus ( descripcion, status)
VALUES ( 'En Proceso', 1);

-- Insertar un registro en la tabla solicitud
INSERT INTO solicitud ( comentario, numeroVuelta, idProyecto, orden, aceptada, idVerano, idUsuarioAlumno, fechaCreacion, fechaModifica, estatus)
VALUES ('Comentario de prueba', 1, 5, 1, 1, 1, 1, GETDATE(), NULL, 1);

-- Insertar un registro en la tabla tipousuario
INSERT INTO tipousuario ( descripcion, estatus)
VALUES ('Estudiante', 1);

-- Insertar un registro en la tabla tipousuariomodulo
INSERT INTO tipousuariomodulo ( idtipousuario, idmodulo, estatus)
VALUES ( 1, 1, 1);

-- Insertar un registro en la tabla usuario
INSERT INTO usuario ( idTipoUsuario, correo, clave, nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento, genero, telefono, calle, colonia, numero, codigoPostal, idCampus, fechaCreacion, fechaModifica, validado, idUsuarioValida, fechaValida, estatus)
VALUES ( 1, 'adminnnn@uanl.mx', 'hashedpassword', 'Admin', 'Admin', 'Admin', '1970-01-01', 'M', '555-0000', 'Calle 1', 'Colonia 1', '123', '64000', 1, GETDATE(), 1, 1, 1, '2024-07-09 13:24:25.367', 1);

-- Insertar un registro en la tabla verano
INSERT INTO verano ( descripcion, fechaVeranoInicio, fechaVeranoFin, proyectosPorInvestigador, solicitudesPorAlumno, alumnosPorProyecto, porcentajeMinimoAvanceAlumno, fechaCrearProyectoInicio, fechaCrearProyectoFin, fechaValidarInvestigadorInicio, fechaValidarInvestigadorFin, fechaCrearSolicitudInicio, fechaCrearSolicitudFin, fechaValidarSolicitudInicio, estado)
VALUES ( 'Verano Ciencia 2024', '2024-06-01', '2024-08-01', 2, 3, 4, 50, '2024-05-01', '2024-05-31', '2024-05-01', '2024-05-31', '2024-06-01', '2024-06-30', '2024-07-01', 1);
