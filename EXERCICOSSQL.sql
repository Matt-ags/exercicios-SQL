-- EXERCICIOS INTRODUÇÃO SQL
-- MATT-AGS

-- EXERCICIO 01:

--1) Verificando cadastro de produtos:

--SELECT ProductKey
--FROM dbo.DimProduct

--Ou seja: Não Houve alteração na quantidade de produtos.

--2) Verificando Clientes

--SELECT CustomerKey
--FROM dbo.DimCustomer

--Ou seja, quantidade de clientes diminuiu.
--DADOS REFERENCIA: 2.517 produtos E 19.500 clientes

--EXERCICIO 02:

--SELECT 

--CustomerKey AS ChaveConsumidor,
--FirstName AS PrimeiroNome,
--EmailAddress AS Email,
--BirthDate AS Nascimento

--FROM dimCustomer

-- DADOS ENCONTRADOS COM SUCESSO!

--EXERCICIO 03:

--1) selecionar primeiros 100 clientes:

--SELECT TOP(100) FirstName
--FROM DimCustomer

--2) Presentear 20% dos Clientes:

--SELECT TOP(20) PERCENT FirstName
--FROM DimCustomer

--3) Refazer 1:

--SELECT TOP(100) FirstName, EmailAddress, BirthDate
--FROM DimCustomer

--4) Renomear:

--SELECT TOP(100)
--FirstName as PrimeiroNome,
--EmailAddress as Email, 
--BirthDate as DataNascimento
--FROM DimCustomer

--EXERCICIO 4:

--SELECT 
--Manufacturer AS Manufaturados
--FROM dbo.DimProduct

--EXERCICO 5:
