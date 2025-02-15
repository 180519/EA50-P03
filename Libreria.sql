--Universidad Politécnica de San Luis Potosí
--          13 de Febrero, 2025
--            Base de Datos
--    Christian Alejandro Cárdenas Rucoba

--                      Biblioteca
--Libros:

--id_libro (INT, PRIMARY KEY)
--titulo (VARCHAR)
--autor (VARCHAR)
--anio_publicacion (INT)

--Prestamos:

--id_prestamo (INT, PRIMARY KEY)
--id_libro (INT, FOREIGN KEY)
--id_usuario (INT)
--fecha_prestamo (DATE)
--fecha_devolucion (DATE)

--Usuarios:

--id_usuario (INT, PRIMARY KEY)
--nombre (VARCHAR)
--email (VARCHAR)


-- Obtener todos los libros prestados actualmente:
-- Listar los usuarios que han prestado libros en el último mes:
-- Encontrar los libros que no han sido prestados nunca:
-- Contar el número de préstamos por usuario:

--                        Tablas
--LIBROS

SET DateStyle = 'ISO, DMY';

CREATE TABLE LIBROS(
  id_libro INT PRIMARY KEY,
  titulo VARCHAR,
  autor VARCHAR,
  anio_publicacion INT
);

--USUARIOS
CREATE TABLE USUARIOS(
  id_usuario INT PRIMARY KEY,
  nombre VARCHAR,
  email VARCHAR
);

--PRESTAMOS
CREATE TABLE PRESTAMOS(
  id_prestamo INT PRIMARY KEY,
  id_libro INT,
  FOREIGN KEY(id_libro) REFERENCES LIBROS(id_libro),
  id_usuario INT,
  FOREIGN KEY(id_usuario) REFERENCES USUARIOS(id_usuario),
  fecha_prestamo DATE,
  fecha_devolucion DATE
);

INSERT INTO LIBROS VALUES
(001,'El que susurra en la oscuridad','H.P. Lovecraft',1931),
(002,'Las ventajas de ser invisible','Stephen Chbosky',1999),
(003,'El que susurra en la oscuridad','H.P. Lovecraft',1931),
(004,'El castillo ambulante','Diana Wynne Jones',1986),
(005,'El principito','Antoine de Saint-Exupéry',1943),
(006,'Cien años de Soledad','Gabriel García Márquez',1967);

INSERT INTO USUARIOS VALUES
(177890, 'Alejandro Araujo Orellana', '177890@upslp.edu.mx'),
(180519, 'Christian Alejandro Cárdenas Rucoba', '180519@upslp.edu.mx'),
(177847, 'Alfredo De Alba Sánchez','177847@upslp.edu.mx'),
(170973, 'César García Martínez Alejandro', '170973@upslp.edu.mx'),
(175680, 'Sebastián Heredia Pardo','175680@upslp.edu.mx'),
(176412, 'Antonio Morales Quiroz De Jesus','176412@upslp.edu.mx');

INSERT INTO PRESTAMOS (id_prestamo,fecha_prestamo,fecha_devolucion) VALUES
(0001,'10-02-2025','13-01-2025'),
(0002,'11-02-2025','21-02-2025'),
(0003,'12-02-2025','22-03-2025'),
(0004,'13-02-2025','23-12-2024'),
(0005,'14-02-2025','24-02-2025');

SELECT * FROM LIBROS;
SELECT * FROM USUARIOS;
SELECT * FROM PRESTAMOS;

SELECT id_prestamo, fecha_devolucion FROM PRESTAMOS WHERE fecha_devolucion < current_date;

SELECT id_libro,id_usuario,fecha_devolucion FROM PRESTAMOS
JOIN USUARIOS ON PRESTAMOS.id_usuario = USUARIOS.id_usuario
WHERE fecha_prestamo > current_date AND fecha_devolucion < current_date;


SELECT id_libro,titulo FROM LIBROS
JOIN PRESTAMOS ON LIBROS.id_libro = PRESTAMOS.id_libro
WHERE PRESTAMOS.fecha_prestamo IS NULL;
