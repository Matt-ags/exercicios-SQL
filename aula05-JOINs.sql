

--Exercícios JOINs

--EX 01

USE ContosoRetailDW

--PASSO A PASSO
--1) DEFINA AS DUAS TABELAS, E DEFINA A PRINCIPAL TB (A DA SITUAÇÃO PROBLEMA / A QUE FALTA INFORMAÇÃO)
SELECT 
	ProductName AS 'NOME DO PRODUTO',
	ProductSubcategoryKey AS 'ID SUBCATEGORIA'
FROM DimProduct A

SELECT 
	ProductSubcategoryKey AS 'ID SUBCATEGORIA',
	ProductSubcategoryName AS 'NOME SUBCATEGORIA'
FROM DimProductSubcategory B

--2) CONSTRUA A TABELA, LEMBRA DE SELECIONAR A CHAVE ESTRANGEIRA DA TABELA "PRINCIPAL", E LIGAR COM A TABELA "2")
--code:
SELECT
	A.ProductName AS 'NOME DO PRODUTO',
	A.ProductSubcategoryKey AS 'ID SUBCATEGORIA',
	B.ProductSubcategoryName AS 'NOME SUBCATEGORIA'
FROM DimProduct A
INNER JOIN DimProductSubcategory B ON A.ProductSubcategoryKey = B.ProductSubcategoryKey

--EX 02

--code
SELECT *
FROM DimProductCategory A
LEFT JOIN DimProductSubcategory B ON A.ProductCategoryKey = B.ProductCategoryKey
--Deu certo? apareceu só 44 linhas...

---EX 03

SELECT 
	A.GeographyKey AS 'ID GEOGRÁFICO',
	A.StoreKey AS 'ID LOJA',
	A.StoreName AS 'NOME LOJA',
	A.EmployeeCount AS 'QNT FUNCIONARIOS'
FROM DimStore A

SELECT 

	B.ContinentName AS 'NOME QNT',
	B.RegionCountryName AS 'NOME REGIÃO/PAÍS' 

FROM DimGeography B

--code:
SELECT 
	A.GeographyKey AS 'ID GEOGRÁFICO',
	A.StoreKey AS 'ID LOJA',
	A.StoreName AS 'NOME LOJA',
	A.EmployeeCount AS 'QNT FUNCIONARIOS',
	B.ContinentName AS 'NOME QNT',
	B.RegionCountryName AS 'NOME REGIÃO/PAÍS' 
FROM DimStore A
LEFT JOIN DimGeography B ON A.GeographyKey = B.GeographyKey

--EX 04

SELECT 
	A.ProductKey AS 'ID PRODUTO',
	A.ProductName AS 'PRODUTO',
	A.ProductDescription AS 'DESCRIÇÃO DO PRODUTO',
	A.ProductSubcategoryKey AS 'ID SUBCATEGORIA'

FROM DimProduct A

SELECT 
	B.ProductSubcategoryDescription AS 'CATEGORIA'
FROM DimProductSubcategory B

--code:
SELECT 
	A.ProductKey AS 'ID PRODUTO',
	A.ProductName AS 'PRODUTO',
	A.ProductDescription AS 'DESCRIÇÃO DO PRODUTO',
	A.ProductSubcategoryKey AS 'ID SUBCATEGORIA',
	B.ProductSubcategoryDescription AS 'CATEGORIA'
FROM DimProduct A 
LEFT JOIN DimProductSubcategory B ON  A.ProductSubcategoryKey = B.ProductSubcategoryKey

--EX 5
--A)

SELECT TOP(100)*
FROM FactStrategyPlan A

SELECT TOP(100)*
FROM DimAccount B

--B)

SELECT
	A.StrategyPlanKey AS 'ID PLANEJAMENTO',
	A.Datekey AS 'DATA',
	A.Amount AS 'QUANTIDADE'
FROM FactStrategyPlan A

SELECT 
	B.AccountKey AS 'ID CONTA',
	B.AccountName AS 'NOME DA CONTA'
FROM DimAccount B

--code:
SELECT 
	A.StrategyPlanKey AS 'ID PLANEJAMENTO',
	A.Datekey AS 'DATA',
	A.Amount AS 'QUANTIDADE',
	B.AccountKey AS 'ID CONTA',
	B.AccountName AS 'NOME DA CONTA'
FROM FactStrategyPlan A
INNER JOIN DimAccount B ON B.AccountKey = A.AccountKey

--EX 06

SELECT TOP(100)
	A.StrategyPlanKey,
	A.Datekey,
	A.Amount
FROM FactStrategyPlan A

SELECT TOP(100)
	B.ScenarioKey,
	B.ScenarioName
FROM DimScenario B

--code:

SELECT 
	A.StrategyPlanKey,
	A.Datekey,
	A.Amount,
	B.ScenarioKey,
	B.ScenarioName
FROM FactStrategyPlan A
INNER JOIN DimScenario B ON A.ScenarioKey = B.ScenarioKey

--EX 07:

SELECT 
	A.ProductName
FROM DimProduct A

SELECT 
	B.ProductSubcategoryKey,
	B.ProductSubcategoryDescription
FROM DimProductSubcategory B

--code:
SELECT
	ProductSubcategoryName
FROM DimProduct 
RIGHT JOIN DimProductSubcategory
 ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
WHERE ProductName IS NULL


--Pulei, usa "anti" acho, volta depois.

--EX 08:

SELECT 
	DISTINCT BrandName,
	ChannelName
FROM DimProduct CROSS JOIN DimChannel
WHERE BrandName IN ('Contoso', 'Fabrikam', 'Litware')

--Não encontrei a tabela certa que mostra o nome da empresa, que tem uma chave do "chanell"

--EX 09:

SELECT TOP(100)
	A.OnlineSalesKey,
	A.DateKey,
	A.SalesAmount
FROM FactOnlineSales A

SELECT TOP(100)
	B.PromotionName
FROM DimPromotion B

--code:

SELECT 
	A.OnlineSalesKey,
	A.DateKey,
	A.PromotionKey,
	A.SalesAmount,
	B.PromotionName
FROM FactOnlineSales A
INNER JOIN DimPromotion B ON A.PromotionKey = B.PromotionKey
WHERE B.PromotionName = 'No Discount'
ORDER BY DateKey ASC


--EX 10:

SELECT *
FROM FactSales A

SELECT *
FROM DimChannel B

SELECT *
FROM DimStore C

SELECT *
FROM DimProduct D

--CODE:
SELECT TOP(100)
	SalesKey,
	ChannelName,
	StoreName,
	ProductName,
	SalesAmount
FROM
	FactSales

INNER JOIN DimChannel
	ON FactSales.channelKey = DimChannel.ChannelKey
INNER JOIN DimStore
	ON FactSales.StoreKey = DimStore.StoreKey
INNER JOIN DimProduct
	ON FactSales.ProductKey = DimProduct.ProductKey
ORDER BY SalesAmount DESC
