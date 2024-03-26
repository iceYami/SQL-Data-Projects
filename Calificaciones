#Creamos una base de datos para llevar el seguimiento de las calificaciones de los estudiantes, con su nombre, calificación numérica y qué porcentaje de actividades han completado. En este primer paso, selecciona todos los renglones y despliega name, number_grade y percent_completed, el cual puedes calcular multiplicando y redondeando la columna fraction_completed.

SELECT 
  name, 
  number_grade, 
  ROUND(fraction_completed * 100) 
  AS percent_completed

FROM student_grades;

#Base de datos:

CREATE TABLE student_grades (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    number_grade INTEGER,
    fraction_completed REAL);
    
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winston", 90, 0.805);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winnefer", 95, 0.901);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winsteen", 85, 0.906);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Wincifer", 66, 0.7054);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winster", 76, 0.5013);
INSERT INTO student_grades (name, number_grade, fraction_completed)
    VALUES ("Winstonia", 82, 0.9045);
