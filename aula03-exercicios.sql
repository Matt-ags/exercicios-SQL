/*F u n ç õ e s d e A g r e g a ç ã o*/

SELECT 
COUNT(CustomerKey) AS 'QTD. MULHERES'
FROM DimCustomer

WHERE Gender = 'F'

-- ACIMA SERVE PARA CONTAR "VALORES"

--Para contar dados de forma distinta:
SELECT
COUNT(DISTINCT DepartmentName) AS 'QNT AREAS'
FROM DimEmployee

--E se eu quiser a soma? Não a quantidade?

SELECT 
SUM(SalesQuantity) AS 'TOTAL VENDAS'
FROM FactSales

--PODEMOS ATE COLOCAR FILTROS

--E para eu conseguir ver a média?

SELECT 
AVG(SalesQuantity) AS 'Média de vendas'
FROM FactSales

WHERE UnitPrice >= 100

--E se eu quiser ver vaor maximo e minimo de uma tabela?

--minimo:
SELECT 
MIN(SalesQuantity) AS 'VENDA MINIMA'
FROM FactSales

--maximo:
SELECT 
MAX(SalesQuantity) AS 'VENDA MAXIMA'
FROM FactSales

-----------EXERCICIOS------------------

--EX 1
--A)

SELECT 
COUNT(DiscountAmount) AS 'QUANTIDADE DE DESCONTOS',
COUNT(SalesAmount) AS 'QUANTIDADE DE VENDAS'
FROM FactSales
WHERE channelKey IN ('1')

--EX 2
--A)

SELECT
AVG(YearlyIncome) AS 'SALÁRIO ANUAL - MÉDIA'
FROM DimCustomer

--EX 03
--A)

SELECT 
MIN(EmployeeCount) AS 'FUNCIONARIOS MIN'
FROM DimStore

--maximo:

SELECT 
MAX(EmployeeCount) AS 'FUNCIONARIOS MAX'
FROM DimStore

SELECT *
FROM DimStore

--Ainda não consegui aparecer o nome e quantidade juntas, talvez de certo usando o order by, e aquilo com o "top"

--ex 4:
--A)

SELECT *
FROM DimEmployee
