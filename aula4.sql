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
--A) ???

--EX 02
--A)

SELECT 
	ProductKey,
	SalesAmount

FROM FactSales
WHERE SalesAmount > '5000'

--B)

SELECT top(10)
	ProductKey,
	SalesAmount

FROM FactSales
ORDER BY SalesAmount DESC

--EX 03
--A)

SELECT *
FROM FactOnlineSales

SELECT TOP(1)
	CustomerKey AS 'ID_CLIENTE',
	COUNT(CustomerKey) AS 'Total de Compras'
FROM 
	FactOnlineSales

GROUP BY CustomerKey
ORDER BY COUNT(CustomerKey) DESC


--B)

SELECT *
FROM FactOnlineSales

SELECT TOP(3)
	CustomerKey AS 'ID_CLIENTE',
	ProductKey AS 'PRODUTO',
	SalesQuantity,
	COUNT(ProductKey) AS 'TOTAL COMPRADO'
FROM 
	FactOnlineSales

WHERE CustomerKey = '19037'
GROUP BY CustomerKey
ORDER BY COUNT(ProductKey) DESC

--não sei como raios esta dando errado.

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

--EX 7
--A) ??

-- EX 8
-- A)

SELECT *
FROM DimCustomer

SELECT
	Education AS 'Educação',
	AVG(YearlyIncome) AS 'Média salarial'
FROM 
	DimCustomer
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
	SUM(VacationHours) AS 'TOTAL HORAS DE FÉRIAS',
	Title AS 'CARGO'
FROM DimEmployee

WHERE Gender = 'F' AND DepartmentName = 'Production' 
GROUP BY Title
