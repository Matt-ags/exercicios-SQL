--	Aula 2
-- Ordenando dados:
-- Usando o "ORDER BY" e chamando quem vai ordenar, da pra ordenar:
-- Tirando o DESC fica crescente

/* SELECT *
FROM dbo.DimCustomer

ORDER BY CustomerKey */

--Organizando de forma composta:

/*
SELECT TOP(100)

	ProductName,
	Weight,
	UnitCost
FROM DimProduct
--Ordena de forma crescente de A a Z
--Veja que organizamos uma crescente e outra não, como não fica desorganizado? É pq o sql organiza, tipo, primeiro ele pega os valores repetidos do UnitCost, e vai organizando o Weight, bel legal.
ORDER BY UnitCost DESC, Weight ASC
*/

/*
--Buscando por meio de caracteres:
SELECT 
*
FROM
DimProduct

WHERE ProductName LIKE '%MP3%'

--Selecionei uma tabela, e disse (ONDE O NOME DO PRODUTO TENHA/SEJA COM X CARACTERES A ESQUERDA, MP3 ENTRE E TERMINA COM QAULQUER COISA)
*/

/*
--Abaixo, busquei pela marca e cor desejada:
SELECT*FROM DimProduct

WHERE BrandName='Contoso' AND ColorName='Silver'
--Isso não sabia, usar o "="
*/

/*
SELECT*FROM DimProduct

--ESTOU BUSCANDO COM VÁRIAS CONDIÇÕES!
WHERE ColorName='Blue' OR ColorName='Silver' OR ColorName='Red'
*/

/*
SELECT*FROM DimProduct

--Agora disse um "não"
WHERE NOT ColorName='Blue'
*/

/*
SELECT*FROM DimProduct

--Agora, para refinar minha busca, e não precisar ficar repetindo a coluna, uso parentreses:
WHERE ColorName IN ('Blue', 'Silver')
*/

/*
SELECT*FROM DimProduct

--Agora para dizer a "não busca"
WHERE ColorName NOT IN ('Blue', 'Silver')
*/

/*
--Abaixo é muito legal, faço uma busca entre dois valores, posso usar em datas tambem!
--É daora para por exemplo buscar "vendas entre 1 de agosto até 3 de outubro, legal!"

SELECT TOP(100)*FROM FactSales

WHERE SalesQuantity BETWEEN 10 AND 15
*/

/*
--Agora, para buscar valores nulos, caso eu não queira nulos, coloco "IS NOT NULL"
SELECT*FROM DimCustomer
WHERE FirstName IS NULL
*/

----------------------*/*/*/*/*/*/*/*/*/-------------------------
-- EXERCICIOS:

-- EX 01:
--A)


SELECT 
	TOP(100) 
SalesAmount
From FactSales
ORDER BY SalesAmount DESC

--Selecionei e ordenei os 100 com maiores vendas, de ordem decrescente.


--EX 02:

-- Gabarito:

/*
SELECT TOP(10) * FROM DimProduct
ORDER BY UnitPrice DESC, Weight DESC

SELECT TOP(10) * FROM DimProduct
ORDER BY UnitPrice DESC, Weight DESC, AvailableForSaleDate ASC
*/
--A)


 SELECT TOP(10) 

 	UnitPrice,
	Weight,
	Size,
	ProductKey,
	StyleID,
	ColorName

FROM DimProduct
ORDER BY UnitPrice DESC, Size DESC, ProductKey DESC, StyleID ASC, ColorName ASC, Weight DESC


--A forma que achei melhor organizar:

--EX 03:

--gabarito:

/*
SELECT 
	ProductName AS 'Nome do produto'
	Weight  AS 'Peso (libras)'
FROM DimProduct
--Transformei 100 quilos em libras (220)
WHERE Weight>100
ORDER BY Weight DESC
*/

--A)

SELECT 
ProductName,
Weight

FROM DimProduct
--Transformei 100 quilos em libras (220)
WHERE Weight>220


--B)



SELECT 
ProductName AS 'Nome Do Produto',
Weight AS 'Peso'

FROM DimProduct
--Transformei 100 quilos em libras (220)
WHERE Weight>220


--C)


SELECT 
ProductName AS 'Nome Do Produto',
Weight AS 'Peso'
FROM DimProduct

--Transformei 100 quilos em libras (220)
WHERE Weight>220
ORDER BY Weight DESC


--EX 04:
--Gabarito:
/*
SELECT
	StoreName AS 'NOME DA LOJA',
	OpenDate AS 'DATA DE ABERTURA',
	EmployeeCount AS 'QTD FUNCIONARIOS'
FROM
	DimStore
WHERE StoreType = 'Store' AND Status = 'On'
*/
--A)

--Temos 306 lojas

SELECT 
DISTINCT
StoreName, OpenDate, EmployeeCount
FROM DimStore

--B)



SELECT 

DISTINCT
	StoreName AS 'Nome da Loja',
	OpenDate AS 'Data de Abertura',
	EmployeeCount AS 'Quantidade de empregados'
FROM DimStore

WHERE CloseDate IS NOT NULL

--TEMOS 12 LOJAS ATIVAS



--EX 05:
--A)


SELECT *
FROM DimProduct

WHERE ProductName LIKE '%home theater%'
AND BrandName = 'Litware' 
AND AvailableForSaleDate ='15/03/2009'
--O problema era a organização da data:


--EX06:

--A)


SELECT *
FROM DimStore

WHERE Status = 'Off'


--b) 


SELECT *
FROM DimStore

WHERE CloseDate IS NOT NULL


--ex07:
--A)


SELECT * 

FROM dbo.DimStore

WHERE EmployeeCount  BETWEEN 1 AND 20

SELECT * 

FROM dbo.DimStore

WHERE EmployeeCount  BETWEEN 21 AND 50

SELECT * 

FROM dbo.DimStore

WHERE EmployeeCount > 51

--Realizei desta forma pois mostra todas as tres tabelas de uma só vez.


--ex08:
--A)

SELECT 
	ProductKey,
	ProductName,
	UnitCost
FROM DimProduct
WHERE ProductName LIKE '%LCD%'

--ex09:
--A)

SELECT 
*
FROM DimProduct
--Forma de pesquisa com parenteses:
WHERE ColorName IN ('Green', 'Orange', 'Black', 'Silver', 'Pink') 
AND Brandname IN ('Contoso', 'Litware', 'Fabrikam')

--ex10:
--A)

SELECT 
*
FROM DimProduct
--Forma de pesquisa com parenteses:
WHERE ColorName IN ('Silver') 
AND Brandname IN ('Contoso')
AND UnitPrice  BETWEEN 10 AND 30
ORDER BY UnitPrice DESC
--Aparentemente o código para aparecer 16 é trocando a condição de preço para peso.
