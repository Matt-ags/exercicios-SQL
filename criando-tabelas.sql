
-- Criando o banco de dados chamado LojaDB
CREATE DATABASE LojaDB;

-- Usando o banco de dados LojaDB para as próximas operações
USE LojaDB;
-- Criando a tabela Clientes que armazena os dados dos clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,  -- ClienteID é a chave primária, ou seja, identifica unicamente cada cliente
    NomeCliente VARCHAR(100),   -- Nome do cliente, armazenado como uma string de até 100 caracteres
    Cidade VARCHAR(50)          -- Cidade onde o cliente mora, armazenado como uma string de até 50 caracteres
);


-- Criando a tabela Pedidos que armazena os pedidos feitos pelos clientes
CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY,   -- PedidoID é a chave primária, identificando unicamente cada pedido
    ClienteID INT,              -- ClienteID é uma chave estrangeira, associando cada pedido a um cliente
    DataPedido DATE,            -- Data do pedido, armazenada como um valor de data
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)  -- ClienteID é uma chave estrangeira que referencia a chave primária da tabela Clientes
);


-- Criando a tabela Produtos que armazena os dados dos produtos disponíveis
CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY,  -- ProdutoID é a chave primária, identificando unicamente cada produto
    NomeProduto VARCHAR(100),   -- Nome do produto
    CategoriaID INT,            -- CategoriaID é uma chave estrangeira que referencia a tabela Categorias
    Preco DECIMAL(10, 2)        -- Preço do produto, com até 10 dígitos no total e 2 casas decimais
);


-- Criando a tabela Categorias que armazena as categorias dos produtos
CREATE TABLE Categorias (
    CategoriaID INT PRIMARY KEY,  -- CategoriaID é a chave primária, identificando unicamente cada categoria
    NomeCategoria VARCHAR(100)    -- Nome da categoria
);

-- Passo 2: Inserir dados nas tabelas


-- Inserindo clientes na tabela Clientes
INSERT INTO Clientes (ClienteID, NomeCliente, Cidade) VALUES
(1, 'Maria Silva', 'São Paulo'),  -- Cliente com ID 1
(2, 'João Santos', 'Rio de Janeiro'),  -- Cliente com ID 2
(3, 'Ana Costa', 'Belo Horizonte');  -- Cliente com ID 3


-- Inserindo pedidos na tabela Pedidos
INSERT INTO Pedidos (PedidoID, ClienteID, DataPedido) VALUES
(1, 1, '2024-01-15'),  -- Pedido ID 1 feito pelo cliente com ID 1 (Maria Silva)
(2, 2, '2024-01-20'),  -- Pedido ID 2 feito pelo cliente com ID 2 (João Santos)
(3, 1, '2024-02-10');  -- Pedido ID 3 feito pelo cliente com ID 1 (Maria Silva)


-- Inserindo categorias na tabela Categorias
INSERT INTO Categorias (CategoriaID, NomeCategoria) VALUES
(1, 'Eletrônicos'),  -- Categoria com ID 1
(2, 'Vestuário');    -- Categoria com ID 2


-- Inserindo produtos na tabela Produtos
INSERT INTO Produtos (ProdutoID, NomeProduto, CategoriaID, Preco) VALUES
(1, 'Celular', 1, 1500.00),     -- Produto Celular, pertence à categoria Eletrônicos
(2, 'Televisão', 1, 3000.00),   -- Produto Televisão, pertence à categoria Eletrônicos
(3, 'Camiseta', 2, 50.00);      -- Produto Camiseta, pertence à categoria Vestuário

--Passo 3: Exemplos de JOINs

-- Exibindo o nome dos clientes e as datas dos pedidos que eles fizeram
SELECT Clientes.NomeCliente, Pedidos.DataPedido
FROM Clientes
INNER JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID;


-- Exibindo o nome dos clientes e as datas dos pedidos (se houver), incluindo clientes que ainda não fizeram pedidos
SELECT Clientes.NomeCliente, Pedidos.DataPedido
FROM Clientes
LEFT JOIN Pedidos ON Clientes.ClienteID = Pedidos.ClienteID;

-- UNION e  UNION ALL

-- O UNION e o UNION ALL são comandos no SQL usados para combinar os resultados de duas ou mais consultas em uma única lista. Eles são úteis quando você quer juntar dados de diferentes tabelas ou de diferentes consultas em um só resultado. A principal diferença entre eles é como tratam valores duplicados.
-- Selecionando o nome dos clientes que estão na tabela Clientes
SELECT NomeCliente FROM Clientes
UNION
-- Selecionando o nome dos clientes que fizeram pedidos (ligados pelo ClienteID)
SELECT Clientes.NomeCliente
FROM Pedidos
INNER JOIN Clientes ON Pedidos.ClienteID = Clientes.ClienteID;

-- EXERCÍCIOS !!!

--1)
--Objetivo: Exibir o nome de todos os clientes que fizeram pedidos, mostrando também o ID do pedido.

SELECT *
FROM dbo.Clientes A

SELECT *
FROM Pedidos B

--code:

SELECT
	A.NomeCliente,
	B.PedidoID
FROM
	Clientes A
INNER JOIN Pedidos B ON A.ClienteID = B.ClienteID

--2)
--Objetivo: Listar todos os clientes, mesmo aqueles que ainda não fizeram pedidos, e exibir o número do pedido (se houver).

SELECT *
FROM Clientes A

SELECT *
FROM Pedidos B
	
--code: 

SELECT 
	A.NomeCliente,
	B.PedidoID
FROM Clientes A
LEFT JOIN Pedidos B ON A.ClienteID = B.ClienteID

--3)
-- Objetivo: Combinar os resultados de todos os clientes que estão na tabela de Clientes e aqueles que aparecem na tabela de Pedidos (clientes que fizeram pelo menos um pedido). Evite duplicatas.
-- UNION: Usado para combinar resultados entre dois ou mais resultados do SELECT
-- Imagine o union como um "join"

--primeiro selecionamos a tabela "principal":

SELECT 
	A.NomeCliente
FROM Clientes A

UNION

--Logo após, colocamos o select que vai ter a "filtragem"

SELECT 
	A.NomeCliente
FROM Clientes A
INNER JOIN Pedidos B ON A.ClienteID = B.ClienteID

--Até que entendi, mas não entendi o porque do resultado dos dois select serem diferentes, tipo, o segundo select não era pra parecer como o resultado de agr? pois ele esta trazendo os ids dos clientes e seu nome.

-- 4) 
-- Objetivo: Combinar os resultados de todos os clientes da tabela Clientes e aqueles que fizeram pedidos, mostrando todas as ocorrências, inclusive duplicadas.
-- Mesma coisa que o de cima, só trocar pra "all": 

SELECT 
	A.NomeCliente
FROM Clientes A

UNION ALL

SELECT 
	A.NomeCliente
FROM Clientes A
INNER JOIN Pedidos B ON A.ClienteID = B.ClienteID

--5) 
--Objetivo: Exibir o nome dos clientes, os detalhes dos produtos comprados (nome do produto e quantidade), e a data em que os pedidos foram feitos.
--Ele pede vários joins, qual que é o "segredo" para não se perder?
--A cada inner join que for realizado (ou qualquer outro) este se torna o principal, como assim? vamos ver logo abaixo:
-- ex fala: "Exiba NomeCliente, NomeProduto, Quantidade, e DataPedido."
--Como sempre, vendo as tabelas que vamos utilizar:


SELECT *
FROM Clientes A

SELECT *
FROM Pedidos B

SELECT *
FROM DetalhesPedidos C

SELECT *
FROM Produtos D

--Partindo para nova tabela:

SELECT
	A.NomeCliente,
	B.DataPedido,
	C.Quantidade,
	D.ProdutoID
FROM Clientes A

--Agora é ficar fazer a sequencia de joins, respeitajndo a sequencia:

INNER JOIN Pedidos B ON A.ClienteID = B.ClienteID

--dai vc pensa, "o que a tabela anterior, que dei o join, tem em comum com a próxima? é tal coisa, faz um join com está

INNER JOIN DetalhesPedidos C ON C.PedidoID = B.PedidoID

INNER JOIN Produtos D ON D.ProdutoID = C.ProdutoID

--acho que está certo, só achei estranho que a maria apareceu 3 vezes...

--6)
--Objetivo: Mostrar quantos tipos de produtos diferentes cada cliente já comprou.
-- Mostrar quantos tipos de produtos diferentes cada cliente já comprou.

SELECT *
FROM Clientes A

SELECT *
FROM Pedidos B

SELECT *
FROM DetalhesPedidos C

SELECT *
FROM Produtos D

-- CODE:

SELECT
	A.NomeCliente,

	--EX Passa o "cont" abaixo:

	COUNT(DISTINCT C.ProdutoID) AS 'quantidade diferentes de produtos compradas'
FROM DetalhesPedidos C
INNER JOIN Pedidos B ON C.PedidoID = B.PedidoID

--Percebe que o exercício pede o nome junto com a quantidade, mas o nome está na tabela CLIEENTES, e não tem nada na tabela CETALHES, que se refere a ela
-- ASSIM, percorre um caminho para chegar até ela!

INNER JOIN Clientes A ON B.ClienteID = A.ClienteID

--group by é para que o "count" funcione:

GROUP BY NomeCliente

--7)
--Mostrar a média de itens comprados em cada pedido.

SELECT *
FROM Clientes A

SELECT *
FROM Pedidos B

SELECT *
FROM DetalhesPedidos C

SELECT *
FROM Produtos D

--code: 

SELECT
	B.PedidoID,
	AVG(C.Quantidade) AS 'média itens'
FROM DetalhesPedidos C
INNER JOIN Pedidos B ON C.PedidoID = B.PedidoID
GROUP BY B.PedidoID

--8)
-- Objetivo: Exibir quantos pedidos foram feitos em cada mês.

SELECT *
FROM Clientes A

SELECT *
FROM Pedidos B

SELECT *
FROM DetalhesPedidos C

SELECT *
FROM Produtos D

--ex passa alguns tipos de "group by" que nunca vi, mas ok né

SELECT

	MONTH(B.DataPedido) AS 'Mês',
	COUNT(B.PedidoID) AS 'Numero de pedidos'

FROM Pedidos B
GROUP BY YEAR(B.DataPedido), MONTH(B.DataPedido)

--9)
--Objetivo: Mostrar o valor total vendido de produtos, agrupado por categoria de produto.


SELECT *
FROM Clientes A

SELECT *
FROM Pedidos B

SELECT *
FROM DetalhesPedidos C

SELECT *
FROM Produtos D

SELECT *
FROM Categorias E

--CODE: 

SELECT

	E.NomeCategoria,
	SUM(C.Quantidade * D.Preco) AS 'Valor total vendido'

FROM DetalhesPedidos C
INNER JOIN Produtos D ON C.ProdutoID = D.ProdutoID
INNER JOIN Categorias E ON D.CategoriaID = E.CategoriaID
GROUP BY E.NomeCategoria 

--10)
--Objetivo: Exibir o valor total do pedido mais caro de cada cliente.

--1° PEDE PARA ADICIONAR UMA NOV A COLUNA:

ALTER TABLE Pedidos ADD Total DECIMAL(10, 2);


UPDATE Pedidos
SET Total = (
    SELECT SUM(DetalhesPedidos.Quantidade * Produtos.Preco)
    FROM DetalhesPedidos
    INNER JOIN Produtos ON DetalhesPedidos.ProdutoID = Produtos.ProdutoID
    WHERE DetalhesPedidos.PedidoID = Pedidos.PedidoID
);

SELECT *
FROM Clientes A

SELECT *
FROM Pedidos B

SELECT *
FROM DetalhesPedidos C

SELECT *
FROM Produtos D

SELECT *
FROM Categorias E

--code:

SELECT
	A.NomeCliente,
	MAX(B.Total) AS 'Pedido mais caro'
FROM Clientes A
INNER JOIN Pedidos B ON A.ClienteID = B.ClienteID
GROUP BY A.NomeCliente
