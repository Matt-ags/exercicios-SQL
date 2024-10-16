
--TABELA DE PROMOÇÕES
  SELECT 
	PromotionKey AS 'ID PROMOÇÃO',
	PromotionName AS 'Tipo de promoção'
  FROM DimPromotion A

--TABELA DE VENDAS
  SELECT 
	SalesKey AS 'ID VENDA',
	PromotionKey AS 'ID PROMOÇÃO'
  FROM FactSales B


--Tentei realizar do jeito "classico" com o distinct, mas deu erro, tentar mais tarde...

--Objetivo, encontrar uma promoção que nunca tenha sido usada

SELECT

	B.PromotionKey,
	B.SalesKey

FROM FactSales B

RIGHT JOIN DimPromotion A ON A.PromotionKey = B.SalesKey
WHERE B.SalesKey IS NULL;

--gerou uma tabela vazia

--gabarito:

SELECT
    A.PromotionKey AS 'ID PROMOÇÃO',
    A.PromotionName AS 'TIPO DE PROMOÇÃO',
    B.SalesKey AS 'ID VENDA'
FROM FactSales B
RIGHT JOIN DimPromotion A ON A.PromotionKey = B.PromotionKey
WHERE B.PromotionKey IS NULL;
