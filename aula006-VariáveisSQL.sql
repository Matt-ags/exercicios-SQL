--SQL VÁRIAVEIS
--Lembre dos tipos de dados: INT(INTEIRO); FLOAT(DECIMAIS); DATETIME(DATA); VARCHAR (TEXTO/CARACTERES).

SELECT 10 AS 'NÚMERO'

--somas!!!

SELECT 10 + 12

SELECT '10' + '20'

--HMMM:
PRINT 'HELLO WORLD'

--Formas de "manipular os dados":
--"IGNOREI OS DECIMAIS"
SELECT CAST(21.934 AS int)

--Posso alterar com o cast o tipo de dado.
--Abaixo é para dizer qual o tipo da variável, não deu certo...
SELECT 10 AS 'NÚMERO'
SELECT SQL_VARIANT_PROPERTY('NÚMERO')

--FORMAS DE FORMATAR OS DADOS:

SELECT FORMAT(CAST('21/03/2024'...

--Métodos de arredondamento

--...

-- DECLARANDO VÁRIAVEIS!!!

DECLARE @idade INT
SET @idade = 10
SELECT @idade

--executa tudo junto
--Com isso, posso "declarar" descontos, por exemplo, e aplicar em tabelas!
--Váriaveis são importantes para deixar o código vivo!

USE ContosoRetailDW
DECLARE @listanomes VARCHAR(MAX)
SET @listanomes = ''

SELECT 
@listanomes = @listanomes + FirstName + ', ' + CHAR(10)
FROM
DimEmployee
WHERE DepartmentName = 'Marketing'

PRINT LEFT(@listanomes, DATALENGTH(@listanomes) - 3)

--EXERCÍCIOS!!!
--EX 01

DECLARE @valor1 INT, @valor2 INT, @valor3 INT, @valor4 INT
SET @valor1 = 10
SET @valor2 = 5
SET @valor3 = 34
SET @valor4 = 7

--a) 
DECLARE @soma INT
SET @soma = @valor1 + @valor2

--b)
DECLARE @subtracao INT
SET @subtracao = @valor3 + @valor4

--c)
DECLARE @multiplicacao INT
SET @multiplicacao = @valor1 * @valor4

--d) 
DECLARE @resultado float(2)
SET @resultado = @valor3 / @valor4
print @resultado


--EX 2
--a)
DECLARE @produto varchar(50)
SET @produto = 'Celular'
--desde quando um celular por 9.99???

--b)
DECLARE @quantidade int
SET @quantidade = 12

--c)
DECLARE @preco float(10)
SET @preco = 9.99

--d)
DECLARE @faturamento float(10)
SET @faturamento = @quantidade * @preco

--e)
SELECT @produto, @quantidade, @preco, @faturamento

--EX 3
DECLARE @nome varchar(100)
SET @nome = 'André'

DECLARE @nascimento DATETIME
SET @nascimento = '10/02/1998'

DECLARE @qpets INT
SET @qpets = 2

SELECT 'O MEU NOME É ' + @nome + ' NASCI EM ' + FORMAT(CAST(@nascimento AS DATETIME), 'dd/MM/yyyy') + ' TENHO ' + CAST(@qpets AS varchar(10)) + ' PETS'

--Não entendi muito bem como este código funciona..., pq tem que ser varchar???

  --EX 4

USE ContosoRetailDW

DECLARE @lojas VARCHAR(MAX)
SET @lojas = ''

SELECT 
@lojas = @lojas + StoreName + ', '
FROM
DimStore
WHERE CloseDate BETWEEN '20080101' AND '20081212'

PRINT 'As lojas fechadas foram: ' + LEFT(@lojas, DATALENGTH(@lojas))
--Acho que está certo... (apareceu duas lojas)

--EX 05
--Olhei na tabela, e vi que o id para 'lamps' é 46

DECLARE @produto VARCHAR(MAX)
SET @produto = ''

SELECT 
@produto = @produto + ProductName + ', ' + CHAR(10)
FROM
DimProduct
WHERE ProductSubcategoryKey= '46'

PRINT 'Os produtos com a subcategoria LAMPS são: ' + LEFT(@produto, DATALENGTH(@produto) - 3)


