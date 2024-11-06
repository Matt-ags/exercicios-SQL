-- AULA 04 /// AGRUPAMENTOS

/*Mostrar um "resumo " de tabela:*/

SELECT 
	DepartmentName,
	COUNT(DepartmentName) AS 'TOTAL DE FUNCIONARIOS'
From DimEmployee
GROUP BY DepartmentName


/*
WHERE USA EM TABELA PRINCIPAL

HAVING EM TABELA SECUNDÁRIA, DEPOIS DA FILTRAGEM
*/

/*EXERCICIOS*/

--EX01
--A) 

SELECT
	channelKey,
	SUM(SalesQuantity)
FROM 
	FactSales

GROUP BY channelKey

--b)

SELECT
	StoreKey,
	SUM(SalesQuantity),
	SUM(ReturnQuantity)
FROM
	FactSales

GROUP BY StoreKey

--C)

SELECT
	channelKey,
	SUM(SalesQuantity)
FROM
	FactSales
WHERE DateKey BETWEEN '01/01/2007' AND '31/12/2007'
GROUP BY channelKey

--EX 02
--A)

SELECT 
	ProductKey,
	SalesAmount

FROM FactSales
WHERE SalesAmount > '5000'

--GABARITO:

SELECT
	ProductKey,
	SUM(SalesAmount)
FROM 
	FactSales
GROUP BY ProductKey
HAVING SUM(SalesAmount) >= 5000000
ORDER BY SUM(SalesAmount) DESC

--B)

SELECT top(10)
	ProductKey,
	SUM(SalesAmount)

FROM FactSales
GROUP BY ProductKey
ORDER BY SUM(SalesAmount) DESC



--EX 03
--A)

SELECT *
FROM FactOnlineSales

SELECT TOP(1)
	CustomerKey AS 'ID_CLIENTE',
	SUM(SalesQuantity) 
FROM 
	FactOnlineSales

GROUP BY CustomerKey
ORDER BY SUM(SalesQuantity) DESC


--B)

SELECT
TOP(3)
ProductKey AS 'ID DO PRODUTO',
SUM(SalesQuantity) AS 'TOTAL VENDIDO'

FROM
FactOnlineSales
WHERE CustomerKey = 19037
GROUP BY ProductKey
ORDER BY SUM(SalesQuantity) DESC

--EX 04
--A)

SELECT
	BrandName AS 'MARCA',
	COUNT(BrandName) AS 'TOTAL DE PRODUTOS'
FROM 
	DimProduct
GROUP BY BrandName

--B)

SELECT 
	ClassName,
	AVG(UnitPrice) AS 'Média de preços'
FROM DimProduct
GROUP BY ClassName


--C)

SELECT 
	ColorName AS 'COR',
	SUM(Weight) AS 'PESO TOTAL'
FROM DimProduct
GROUP BY ColorName

--EX 05
--A

SELECT 
	StockTypeName AS 'PRODUTO',
	SUM(Weight) AS 'PESO TOTAL'
FROM DimProduct
WHERE BrandName = 'Contoso'
GROUP BY StockTypeName

--EX 06
--A)

SELECT
	BrandName AS 'MARCA',
	COUNT(DISTINCT ColorName) AS 'CORES'
FROM 
	DimProduct

GROUP BY BrandName

--nenhuma marca

--EX 7
--A) 

SELECT
	Gender AS 'SEXO',
	COUNT(Gender) AS 'TOTAL'
FROM
	DimCustomer

WHERE Gender IS NOT NULL
GROUP BY Gender
ORDER BY COUNT(Gender) DESC

-- EX 8
-- A)

SELECT
	Education AS 'Educação',
	COUNT(Education) AS 'QNT. total por educação',
	AVG(YearlyIncome) AS 'Média salarial'
FROM 
	DimCustomer
WHERE Education IS NOT NULL
GROUP BY Education

-- EX 9
-- A)

SELECT
	DepartmentName AS 'Departamento',
	COUNT(Status) AS 'Quantidade de empregados'
FROM 
	DimEmployee

WHERE Status = 'Current'
GROUP BY DepartmentName

--ex 10
--a) ?? estranho...

SELECT *
FROM DimEmployee

SELECT 
	Title,
	SUM(VacationHours) AS 'TOTAL HORAS DE FÉRIAS'
FROM 
DimEmployee

WHERE Gender = 'F' 
AND DepartmentName IN ('Production', 'Marketing', 'Engineering', 'Finance') 
AND HireDate BETWEEN '1999/01/01' AND '2000/12/31'
--não entendo a forma da data...
GROUP BY Title
