--SQL CRUD

--EX 01

--A) 
CREATE DATABASE BD_Teste

--B) DELETADO MANUALMENTE

--C) 
CREATE DATABASE Exercicios

--EX 02
USE Exercicios

CREATE TABLE dCliente (
	ID_Cliente INT,
	Nome_Cliente VARCHAR(200),
	Data_de_Nascimento DATE
)

CREATE TABLE dGerente (
ID_Gerente INT, Nome_Gerente VARCHAR (200), Data_de_Contratacao DATE, Salario FLOAT
)

CREATE TABLE fContratos ( ID_Contrato INT, Data_de_Assinatura DATETIME, ID_Cliente INT,
ID_Gerente INT, Valor_do_Contrato FLOAT)

--EX 03

INSERT INTO dCliente (ID_Cliente, Nome_Cliente, Data_de_Nascimento) VALUES
(1, 'André Martins', '1989-02-12'),
(2, 'Bárbara Campos', '1992-05-07'),
(3, 'Carol Freitas', '1985-04-23'),
(4, 'Diego Cardoso', '1994-10-11'),
(5, 'Eduardo Pereira', '1988-11-09'),
(6, 'Fabiana Silva', '1989-09-02'),
(7, 'Gustavo Barbosa', '1993-06-27'),
(8, 'Helen Viana', '1990-02-11');

INSERT INTO dGerente (ID_Gerente, Nome_Gerente, Data_de_Contratacao, Salario) VALUES
(1, 'Lucas Sampaio', '2015-03-21', 6700),
(2, 'Mariana Padilha', '2011-01-10', 9900),
(3, 'Nathália Santos', '2018-10-03', 7200),
(4, 'Otávio Costa', '2017-04-18', 11000);

INSERT INTO fContratos (ID_Contrato, Data_de_Assinatura, ID_Cliente, ID_Gerente, Valor_do_Contrato) VALUES
(1, '20190112', 8, 1, 23000),
(2, '20190210', 3, 2, 15500),
(3, '20190307', 7, 2, 6500),
(4, '20190315', 1, 3, 33000),
(5, '20190321', 5, 4, 11100),
(6, '20190323', 4, 2, 5500),
(7, '20190328', 9, 3, 55000),
(8, '20190404', 2, 1, 31000),
(9, '20190405', 10, 4, 3400),
(10, '20190405', 6, 2, 9200);
--ESTA FORMA DE ADICIONAR COM "DATETIME" DEU CERTINHO DO JEITO QUE ESTÁ, BEM INTERESSANTE

--EX 04
INSERT INTO dCliente (ID_Cliente, Nome_Cliente, Data_de_Nascimento) VALUES
(9, 'Jake Junior', '2000-02-12');

INSERT INTO dGerente (ID_Gerente, Nome_Gerente, Data_de_Contratacao, Salario) VALUES
(5, 'Jake Gamer', '2010-03-21', 100000000);

INSERT INTO fContratos (ID_Contrato, Data_de_Assinatura, ID_Cliente, ID_Gerente, Valor_do_Contrato) VALUES
(11, '20200112', 9, 5, 230000000000);

--EX 05
UPDATE fContratos
SET Data_de_Assinatura = '20190317',
ID_Gerente = 2,
Valor_do_Contrato = 33500
WHERE ID_Contrato = 4

--EX 06
DELETE 
FROM fContratos
WHERE ID_Contrato = 11
