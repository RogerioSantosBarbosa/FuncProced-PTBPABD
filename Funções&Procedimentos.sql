-- Questão 01. Crie um procedimento chamado student_grade_points segundo os critérios mencionados.

CREATE PROCEDURE student_grade_points 



-- Questão 02. Crie uma função chamada return_instructor_location segundo os critérios mencionados.

CREATE FUNCTION dbo.return_instructor_location (@structor_name varchar(20))
RETURNS TABLE 
AS
RETURN (SELECT structor_name, course, 

