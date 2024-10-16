--ESTUDOS JOIN

--Na tabela de fact sales, temos o id do produto, mas não sabemos que produto é este, como podemos mostrar?
--Usando o join (No caso, seria o inner join, o mais basiquin)

--Certo, primeiro nos selecionamos a tabela com base no nosso problema:

SELECT 
	SalesKey AS 'ID DA VENDA',
	DateKey AS 'DATA DA VENDA',
	ProductKey AS 'ID PRODUTO',
	SalesQuantity AS 'QUANTIDADE VENDAS'

FROM dbo.FactSales A
--ESTE  "A" APÓS O FACTSALES É INTERESSANTE, é uma forma de nós darmos um nome pra ela, UM APELIDO, vai ajudar mais ora frente.
--Agora a segunda tabela, que tem o dado que queremos, o nome do produto!

SELECT 
	ProductKey AS 'ID PRODUTO',
	ProductName AS 'NOME DO PRODUTO'
FROM DimProduct B

--Novamente damos um nome pra tabela.
--Agora vamos pra mágica, o uso do JOIN, vamos criar uma nova tabela, preste atenção

SELECT 
    A.SalesKey AS 'ID DA VENDA',
    A.DateKey AS 'DATA DA VENDA',
    A.ProductKey AS 'ID PRODUTO',
    B.ProductName AS 'NOME DO PRODUTO',
    A.SalesQuantity AS 'QUANTIDADE VENDAS'

--Olha que legal, na nova tabela, queremos mostrar algo que queremos que não mostra nela (NOME DO PRODUTO) Portato (lembra do apelido?) chamamos o apelido e o que queremos dela, como assim?
-- "A.ProductName significa => "Eu quero, da tabela "A", se quisermos, podemos escrever "DimProduct" a entidade ProductName.

FROM dbo.FactSales A

--Percebe que chamamos a tabela que não tem o que queremos acima né?
--Agora começa a parte legal

INNER JOIN DimProduct B ON A.ProductKey = B.ProductKey
WHERE A.SalesKey BETWEEN '1' AND '100'

--esse where é só pra deixar um intervalo, da pra tirar, é que senão fica mais de 3 milhões de linhas.
-- INNER JOIN diz "Vamos juntar" a tabela "DIM PREDUCT B" importante deixar o apelido,  
-- O "ON" é COMO estas tabelas vão se juntar, os dois valores no igual (A.ProductKey = B.ProductKey) é uma forma em que confirma os dados, ou seja, chamou a tabela A com a entidade product key e essa comparando se existe este mesmo dado na tabela B
--Parece um pouco conmfuso, mas tenha em mente que é uma forma de confirmar os dados em ambas as tabelas.

--E PRONTO, uma nova tabela mostrando o nome do produto!

SELECT *
FROM FactOnlineSales

SELECT *
FROM DimCustomer

--Objetivo: ver nome/id de pessoas que nunca comparam online

--1° Definindo tabelas:

SELECT 
	CustomerKey AS 'ID CLIENTE',
	FirstName AS 'NOME',
	LastName AS 'SOBRENOME'
FROM DimCustomer A

SELECT 
	OnlineSalesKey AS 'ID COMPRA',
	DateKey AS 'DATA DA COMPRA',
	ProductKey AS 'ID PRODUTO',
	CustomerKey AS 'ID CLIENTE'
FROM FactOnlineSales B

--2° Construindo nova tabela

SELECT 

    A.CustomerKey AS 'ID CLIENTE',
    A.FirstName AS 'NOME',
    A.LastName AS 'SOBRENOME'

FROM DimCustomer A

RIGHT JOIN FactOnlineSales B ON A.CustomerKey = B.CustomerKey
WHERE A.CustomerKey IS NULL;

--Algumas informações importantes:
--Pelo que testei, o sql server não tem o "RIGHT ANTI JOIN" então tive que fazer uma gambiarra, peguei os dois valores da direita e queria os que estivessem nulos (compras que não tivessem um id de cliente)
--O por que de usar o right join, eu peguei a tabela da direita (a B) E COMPAREI COM A ESQUERDA, OU SEJA, ELE COMPAROU SE TEM UMA COMPRA SEM UM ID DE CLIENTE. (A ESTÁ A ESQUERDA E B A DIREITA)
--Mas como neste caso ele comparou compra com id, então não sei se ficou "legal", abaixo tem a forma que compara cliente e compra, só troquei as posições, e a tabela:
--AMBOS OS CASOS RETORNAM TABELAS VAZIAS, OU SEJA, TODOS OS CLIENTES COMPRARAM PELO MENOS UMA COISA ONLINE.
SELECT 

    A.CustomerKey AS 'ID CLIENTE',
    A.FirstName AS 'NOME',
    A.LastName AS 'SOBRENOME'

FROM FactOnlineSales B

RIGHT JOIN DimCustomer A ON A.CustomerKey = B.CustomerKey
WHERE B.CustomerKey IS NULL;

