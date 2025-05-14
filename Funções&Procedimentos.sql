-- Questão 01. Crie um procedimento chamado student_grade_points segundo os critérios mencionados.

CREATE PROCEDURE student_grade_points
    @conceito VARCHAR(2)
AS
BEGIN
    SELECT 
        e.nome AS NomeEstudante,
        e.departamento AS DepartamentoEstudante,
        c.titulo AS TituloCurso,
        c.departamento AS DepartamentoCurso,
        h.semestre AS SemestreCurso,
        h.ano AS AnoCurso,
        g.pontuacao_alfanumerica,
        g.pontuacao_numerica
    FROM 
        estudantes e
    INNER JOIN historico h ON e.id_estudante = h.id_estudante
    INNER JOIN cursos c ON h.id_curso = c.id_curso
    INNER JOIN notas g ON h.id_nota = g.id_nota
    WHERE 
        g.pontuacao_alfanumerica = @conceito;
END;




-- Questão 02. Crie uma função chamada return_instructor_location segundo os critérios mencionados.

CREATE FUNCTION return_instructor_location (
    @nomeInstrutor VARCHAR(100)
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        i.nome AS NomeInstrutor,
        c.titulo AS CursoMinistrado,
        h.semestre AS Semestre,
        h.ano AS Ano,
        l.predio,
        l.numero_sala
    FROM 
        instrutores i
    INNER JOIN historico_instrutor h ON i.id_instrutor = h.id_instrutor
    INNER JOIN cursos c ON h.id_curso = c.id_curso
    INNER JOIN localizacoes l ON h.id_localizacao = l.id_localizacao
    WHERE 
        i.nome = @nomeInstrutor
);


