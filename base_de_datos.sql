-- - DDL DE LA BASE DE DATOS - 
DROP TABLE IF EXISTS Turno, Empleado, Usuario, Servicio, Ciudad CASCADE; --con esta linea evita que existan otras tablas con el mismo nombre y se dupliquen los registros.

CREATE TABLE Ciudad (
    ciudad_id SERIAL PRIMARY KEY,
    nombre_ciudad VARCHAR(100) NOT NULL,
    codigo_postal VARCHAR(20)
);

CREATE TABLE Servicio (
    servicio_id SERIAL PRIMARY KEY,
    nombre_servicio VARCHAR(100) NOT NULL,
    descripcion TEXT,
    estado VARCHAR(20)
);

CREATE TABLE Usuario (
    usuario_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    tipo_usuario VARCHAR(50),
    condiciones TEXT,
    ciudad_id INT REFERENCES Ciudad(ciudad_id)
);

CREATE TABLE Empleado (
    empleado_id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES Usuario(usuario_id),
    cargos VARCHAR(100),
    departamentos VARCHAR(100)
);

CREATE TABLE Turno (
    turno_id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES Usuario(usuario_id),
    servicio_id INT REFERENCES Servicio(servicio_id),
    empleado_id INT REFERENCES Empleado(empleado_id),
    fecha DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    estado VARCHAR(50)
);

-- - DML DE LA BASE DE DATOS - 10 ejemplos de regristos para las tablas
INSERT INTO Ciudad (nombre_ciudad, codigo_postal) VALUES 
('Bogotá','1101'),('Medellín','0501'),('Cali','7601'),('Baq','0801'),('Cartagena','1301'),
('Bucaramanga','6801'),('Pereira','6601'),('Manizales','1701'),('Ibagué','7301'),('Neiva','4101');

INSERT INTO Servicio (nombre_servicio, descripcion, estado) VALUES 
('Despacho','Salida','Activo'),('Entrega','Final','Activo'),('Recepción','Entrada','Activo'),
('Atención','Consultas','Activo'),('Consultoría','Asesoría','Activo'),('Soporte','Técnico','Activo'),
('Devoluciones','Retorno','Activo'),('Facturación','Pagos','Activo'),('Afiliaciones','Nuevos','Activo'),
('Reclamos','Quejas','Activo');

INSERT INTO Usuario (nombre, apellido, tipo_usuario, condiciones, ciudad_id) VALUES 
('U1','A1','Cliente','Ninguna',1),('U2','A2','Cliente','Embarazo',2),('U3','A3','Empleado','Ninguna',3),
('U4','A4','Cliente','Adulto Mayor',4),('U5','A5','Proveedor','Silla',5),('U6','A6','Cliente','Ninguna',6),
('U7','A7','Empleado','Ninguna',7),('U8','A8','Cliente','Ninguna',8),('U9','A9','Cliente','Ninguna',9),
('U10','A10','Cliente','Ninguna',10);

INSERT INTO Empleado (usuario_id, cargos, departamentos) VALUES 
(3,'Asesor','Ventas'),(7,'Técnico','Soporte'),(1,'Jefe','Admin'),(2,'Caja','Finanzas'),(4,'Analista','TI'),
(5,'Op','Logística'),(6,'Aux','Admin'),(8,'Coord','Ventas'),(9,'Asist','TI'),(10,'Dir','General');

INSERT INTO Turno (usuario_id, servicio_id, empleado_id, fecha, hora_inicio, hora_fin, estado) VALUES 
(1,1,1,'2026-01-01','08:00','08:30','Ok'),(2,2,2,'2026-01-01','09:00','09:30','Ok'),
(3,3,3,'2026-01-01','10:00','10:30','Ok'),(4,4,4,'2026-01-01','11:00','11:30','Ok'),
(5,5,5,'2026-01-01','12:00','12:30','Ok'),(6,6,6,'2026-01-01','13:00','13:30','Ok'),
(7,7,7,'2026-01-01','14:00','14:30','Ok'),(8,8,8,'2026-01-01','15:00','15:30','Ok'),
(9,9,9,'2026-01-01','16:00','16:30','Ok'),(10,10,10,'2026-01-01','17:00','17:30','Ok');

SELECT * FROM Turno;
