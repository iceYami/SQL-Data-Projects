CREATE TABLE Personas 

(
    id INT AUTO_INCREMENT PRIMARY KEY,

    nombre VARCHAR(50),
    apellidos VARCHAR(50),
    dni VARCHAR(10),
    nacionalidad VARCHAR(50),
    fecha_nacimiento DATE,
    titulacion VARCHAR(100),
    puesto_laboral VARCHAR(100),
    anos_experiencia INT,
    telefono VARCHAR(15),
    email VARCHAR(100)

);

INSERT INTO Personas (nombre, apellidos, dni, nacionalidad, fecha_nacimiento, titulacion, puesto_laboral, anos_experiencia, telefono, email) VALUES

('Laura', 'Martinez Ruiz', '12345678A', 'Español', '1995-07-11', 'Ingeniera Informática', 'Desarrolladora', 5, '123456789', 'laura@email.es'),
('Maria', 'Lopez Garcia', '12345678B', 'Español', '1991-10-25', 'Graduada en Administración de Empresas', 'Tecnico administrativo', 8, '987654321', 'maria@email.es'),
('Irene', 'Robles Perez', '12345678C', 'Mexicano', '1985-03-15', 'Ingeniero Civil', 'Ingeniero de Proyectos', 3, '555444333', 'irene@email.es'),
('Jose', 'Belmonte Rodriguez', '12345678D', 'Colombiana', '1990-15-03', 'Graduado en Psicología', 'Psicólogo Sanitario', 2, '222333444', 'jose@email.es'),
('Pedro', 'Rodriguez Cifuentes', '987654321E', 'Argentino', '1992-08-20', 'FPS en Administración de Sistemas en Red', 'Técnico de Sonido', 1, '999888777', 'pedro@email.es');

#Seleccionar nombre y email
SELECT CONCAT(nombre, ' ', apellidos) AS nombre_completo, email FROM Personas;

#Contar nº de personas por nacionalidad
SELECT nacionalidad, COUNT(*) AS cantidad_personas FROM Personas GROUP BY nacionalidad;

#Filtrar por años de experiencia
SELECT nombre, apellidos, puesto_laboral, email
FROM Personas
WHERE anos_experiencia > 4;

#Mostrar la persona más joven y la de mayor edad
SELECT nombre, apellidos, fecha_nacimiento
FROM Personas
ORDER BY fecha_nacimiento ASC LIMIT 1;

#Mostrar la persona más joven y la de mayor edad POR NACIONALIDAD
SELECT nacionalidad, nombre, apellidos, fecha_nacimiento
FROM 
(
  SELECT *,
           ROW_NUMBER() OVER (PARTITION BY nacionalidad ORDER BY fecha_nacimiento ASC) AS rn
  FROM Personas
) 
AS ranked
WHERE rn = 1;
SELECT nombre, apellidos, fecha_nacimiento
FROM Personas
ORDER BY fecha_nacimiento DESC LIMIT 1;

#Calcular edad
SELECT nombre, apellidos, TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) AS edad
FROM Personas;

#Calcular media de experiencia
SELECT nacionalidad, AVG(anos_experiencia) AS promedio_experiencia
FROM Personas
GROUP BY nacionalidad;

#Actualizar el puesto laboral de una persona específica (por ejemplo, actualizar el puesto de Juan)
UPDATE Personas
SET puesto_laboral = 'Nuevo Puesto'
WHERE nombre = 'Laura' AND apellidos = 'Martinez Ruiz';

#Eliminar a una persona de la tabla
DELETE FROM Personas
WHERE nombre = 'Laura' AND apellidos = 'Martinez Ruiz';

#Encontrar al menos otro perfil similar:
SELECT p1.nombre, p1.apellidos, p1.puesto_laboral
FROM Personas p1
JOIN Personas p2 ON p1.puesto_laboral LIKE CONCAT('%', p2.puesto_laboral, '%')
WHERE p1.id <> p2.id;

#Encontrar personas con email repetido
SELECT email, COUNT(*) AS cantidad_personas
FROM Personas

#Selecciona  nombre (concatena nombre y apellidos),  edad (calculandola a partir de la fecha de de nacimiento) y nacionalidad
#Cuenta el número total.
#Filtra por puesto "Desarrollador" con mínimo 5 años de experiencia.
#Agrupa por nacionalidad.
#Filtra grupos que tienen más de una persona.
#Ordena por edad descendente.
#Limita máximo 3 filas.

SELECT 
    CONCAT(nombre, ' ', apellidos) AS nombre_completo,
    YEAR(CURDATE()) - YEAR(fecha_nacimiento) AS edad,
    nacionalidad,
    COUNT(*) AS total_personas
FROM 
    Personas
WHERE 
    puesto_laboral LIKE '%Desarrollador%' AND
    anos_experiencia >= 5
GROUP BY 
    nacionalidad
HAVING 
    COUNT(*) > 1
ORDER BY 
    edad DESC
LIMIT 
    3;
GROUP BY email
HAVING COUNT(*) > 1;
