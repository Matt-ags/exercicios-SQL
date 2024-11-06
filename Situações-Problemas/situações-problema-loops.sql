--CONTOSO:

USE ContosoRetailDW

DECLARE @lojasC DATE = '20080101'; 
DECLARE @lojas VARCHAR(MAX) = ''; 
WHILE @lojasC <= '20081212' 
BEGIN
    SELECT @lojas = @lojas + StoreName + ', ' 
    FROM DimStore
    WHERE CloseDate = @lojasC;
    SET @lojasC = DATEADD(DAY, 1, @lojasC);
END;
SET @lojas = LEFT(@lojas, LEN(@lojas) - 1); 

PRINT 'As lojas fechadas foram: ' + @lojas;

--VISÃO VITALÍCIA:

USE Visao_Vitalicia

--EX 1:

USE Visao_Vitalicia

DECLARE @cidade VARCHAR(MAX);
SET @cidade = 'São Paulo'; 

DECLARE @i VARCHAR(MAX);
SET @i = @cidade;

DECLARE @clientes INT;

WHILE @cidade = @i
BEGIN

    SELECT @clientes = COUNT(*)
    FROM Cliente c
    JOIN Endereco e ON c.ID_Endereco = e.ID_Endereco
    WHERE e.Cidade = @cidade;

    SELECT 'A cidade ' + @cidade + ' possui ' + CAST(@clientes AS VARCHAR) + ' clientes.' AS 'Clientes na Cidade';

    SET @cidade = NULL;
END;


--EX2:

USE Visao_Vitalicia

DECLARE @cirurgia VARCHAR(MAX) = '';
DECLARE @index INT = 1;
DECLARE @nomeMedico VARCHAR(MAX);
DECLARE @totalMedicos INT;

SELECT @totalMedicos = COUNT(DISTINCT a.Nome)
FROM Funcionarios a
JOIN Agendamento b ON a.ID_Funcionario = b.ID_Funcionario
WHERE b.Tipo_Agendamento = 'Cirurgia';

WHILE @index <= @totalMedicos
BEGIN
    
    SET @nomeMedico = (SELECT DISTINCT TOP 1 a.Nome
                       FROM Funcionarios a
                       JOIN Agendamento b ON a.ID_Funcionario = b.ID_Funcionario
                       WHERE b.Tipo_Agendamento = 'Cirurgia'
                       AND a.Nome NOT IN (SELECT TOP (@index - 1) a.Nome
                                          FROM Funcionarios a
                                          JOIN Agendamento b ON a.ID_Funcionario = b.ID_Funcionario
                                          WHERE b.Tipo_Agendamento = 'Cirurgia'
                                          ORDER BY a.Nome));

    SET @cirurgia = @cirurgia + @nomeMedico + ', ' + CHAR(10);

    SET @index = @index + 1;
END;

PRINT 'Os doutores que irão realizar cirurgias esta semana são: ' + LEFT(@cirurgia, DATALENGTH(@cirurgia) - 3);

--EX3

USE Visao_Vitalicia

DECLARE @doutor varchar(max)
SET @doutor = '2'
--Altera a variável acima para encontrar o funcionário desejado

DECLARE @i varchar(max)
SET @i = @doutor

DECLARE @consultas INT
DECLARE @nomeDoutor varchar(max)

WHILE @doutor <= @i

BEGIN
    SELECT @consultas = COUNT(*),
           @nomeDoutor = (SELECT Nome FROM Funcionarios WHERE ID_Funcionario = @doutor)
    FROM Agendamento
    WHERE ID_Funcionario = @doutor;

    SELECT 'Doutor(a) ' + @nomeDoutor + ' possui ' + CAST(@consultas AS VARCHAR) + ' consultas esta semana.' AS 'CONSULTAS DO DOUTOR:';
    SET @doutor = @doutor + 1;
END;
