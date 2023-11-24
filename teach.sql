spool C:\Users\jnvg9\OneDrive\Escritorio\salidasbases\salidaTeach.txt

--clear screen;
set linesize 150
set PAGESIZE 99
set COLSEP '|*|'

--Borrado de tablas
DROP TABLE InstructorStudent CASCADE CONSTRAINT;
DROP TABLE InstructorCourse CASCADE CONSTRAINT;
DROP TABLE CourseStudent CASCADE CONSTRAINT;
DROP TABLE CourseInstructor CASCADE CONSTRAINT;
DROP TABLE StudentCourse CASCADE CONSTRAINT;
DROP TABLE StudentInstructor CASCADE CONSTRAINT;
DROP TABLE Teach CASCADE CONSTRAINT;

--Tablas
CREATE TABLE Teach(
    student VARCHAR2(10),
    course VARCHAR2(10),
    instructor VARCHAR2(10)
);

CREATE TABLE StudentInstructor(
    student VARCHAR2(10),
    instructor VARCHAR2(10)
);

CREATE TABLE StudentCourse(
    student VARCHAR2(10),
    course VARCHAR2(10)
);

CREATE TABLE CourseInstructor(
    course VARCHAR2(10),
    instructor VARCHAR2(10)
);

CREATE TABLE CourseStudent(
    course VARCHAR2(10),
    student VARCHAR2(10)
);

CREATE TABLE InstructorCourse(
    instructor VARCHAR2(10),
    course VARCHAR2(10)
);

CREATE TABLE InstructorStudent(
    instructor VARCHAR2(10),
    student VARCHAR2(10)
);

--Restricciones
ALTER TABLE Teach
ADD CONSTRAINT student_PK PRIMARY KEY (student);

--Insertar datos
INSERT INTO Teach VALUES('Narayan', 'Database', 'Mark');
INSERT INTO Teach VALUES('Smith', 'Database', 'Navathe');
INSERT INTO Teach VALUES('Smith', 'Operating Systems', 'Ammar');
INSERT INTO Teach VALUES('Smith', 'Theory', 'Schulman');
INSERT INTO Teach VALUES('Wallace', 'Database', 'Mark');
INSERT INTO Teach VALUES('Wallace', 'Operanding Systems', 'Ahamad');
INSERT INTO Teach VALUES('Wong', 'Database', 'Omiecinski');
INSERT INTO Teach VALUES('Zelaya', 'Database', 'Navathe');
INSERT INTO Teach VALUES('Narayan', 'Operanding Systems', 'Ammar');

INSERT INTO StudentInstructor VALUES('Narayan', 'Mark');
INSERT INTO StudentInstructor VALUES('Smith', 'Navathe');
INSERT INTO StudentInstructor VALUES('Smith', 'Ammar');
INSERT INTO StudentInstructor VALUES('Smith', 'Schulman');
INSERT INTO StudentInstructor VALUES('Wallace', 'Mark');
INSERT INTO StudentInstructor VALUES('Wallace', 'Ahamad');
INSERT INTO StudentInstructor VALUES('Wong', 'Omiecinski');
INSERT INTO StudentInstructor VALUES('Zelaya', 'Navathe');
INSERT INTO StudentInstructor VALUES('Narayan', 'Ammar');

INSERT INTO StudentCourse VALUES('Narayan', 'Database');
INSERT INTO StudentCourse VALUES('Smith', 'Database');
INSERT INTO StudentCourse VALUES('Smith', 'Operating Systems');
INSERT INTO StudentCourse VALUES('Smith', 'Theory');
INSERT INTO StudentCourse VALUES('Wallace', 'Database');
INSERT INTO StudentCourse VALUES('Wallace', 'Operanding Systems');
INSERT INTO StudentCourse VALUES('Wong', 'Database');
INSERT INTO StudentCourse VALUES('Zelaya', 'Database');
INSERT INTO StudentCourse VALUES('Narayan', 'Operanding Systems');

INSERT INTO CourseInstructor VALUES('Database', 'Mark');
INSERT INTO CourseInstructor VALUES('Database', 'Navathe');
INSERT INTO CourseInstructor VALUES('Operating Systems', 'Ammar');
INSERT INTO CourseInstructor VALUES('Theory', 'Schulman');
INSERT INTO CourseInstructor VALUES('Database', 'Mark');
INSERT INTO CourseInstructor VALUES('Operanding Systems', 'Ahamad');
INSERT INTO CourseInstructor VALUES('Database', 'Omiecinski');
INSERT INTO CourseInstructor VALUES('Database', 'Navathe');
INSERT INTO CourseInstructor VALUES('Operanding Systems', 'Ammar');

INSERT INTO CourseStudent VALUES('Database', 'Narayan');
INSERT INTO CourseStudent VALUES('Database', 'Smith');
INSERT INTO CourseStudent VALUES('Operating Systems', 'Smith');
INSERT INTO CourseStudent VALUES('Theory', 'Smith');
INSERT INTO CourseStudent VALUES('Database', 'Wallace');
INSERT INTO CourseStudent VALUES('Operanding Systems', 'Wallace');
INSERT INTO CourseStudent VALUES('Database', 'Wong');
INSERT INTO CourseStudent VALUES('Database', 'Zelaya');
INSERT INTO CourseStudent VALUES('Operanding Systems', 'Narayan');

--Desplega las tablas
SELECT * FROM Teach;
SELECT * FROM StudentInstructor;
SELECT * FROM StudentCourse;
SELECT * FROM CourseInstructor;
SELECT * FROM CourseStudent;

--Vistas
DROP VIEW Teach_vista;
CREATE VIEW Teach_vista AS 
    SELECT student, course, instructor FROM Teach;
SELECT * FROM Teach_vista;

DROP VIEW StudentInstructor_vista;
CREATE VIEW StudentInstructor_vista AS 
    SELECT student, instructor FROM StudentInstructor;
SELECT * FROM StudentInstructor_vista;

DROP VIEW StudentCourse_vista;
CREATE VIEW StudentCourse_vista AS 
    SELECT student, course FROM StudentCourse;
SELECT * FROM StudentCourse_vista;

DROP VIEW CourseInstructor_vista;
CREATE VIEW CourseInstructor_vista AS 
    SELECT course, instructor FROM CourseInstructore;
SELECT * FROM CourseInstructor_vista;

DROP VIEW CourseStudent_vista;
CREATE VIEW CourseStudent_vista AS 
    SELECT course, student FROM CourseStudent;
SELECT * FROM CourseStudent_vista;

-- Da formato a la salida de datos 
rem desplegar por TABLE_NAME & CONSTRAINT
col owner FORMAT A12
col CONSTRAINT_NAME FORMAT A31
col CONSTRAINT_TYPE FORMAT A10
col table_name FORMAT A25
col status  FORMAT A10

-- Despliega las restricciones 
SELECT owner, CONSTRAINT_NAME,
    CONSTRAINT_TYPE, status
    FROM user_constraints
    WHERE table_name IN ('TEACH', 'STUDENTINSTUCTOR', 'STUDENTCOURSE', 'COURSEINSTRUCTOR', 'COURSESTUDENT');

spool off