--ESTUDOS "LOOPS"

--nota pra mim: LOOP É UM BETWEEN MEGA ULTRA POWER
--Estruturas de repetição (tipo o while do js)
--Vai executar um bloco de código com base em uma condição.
--WHILE condicao
--BEGIN
--   <codigo_sql>
--END

DECLARE @x varchar(max)
SET @x = 0

--Exemplo simples:

--Realizar uma contagem:
WHILE (@x <= 10)
BEGIN
	PRINT @x + '!'
	SET @x = @x + 1
	--IMPORTANTE, AS POSIÇÕES EM QUE VC COLOCA AS "AÇÕES" IMPORTAM, SE TROCAR A POSIÇÃO ACIMA, O 11 APARECE!
END

--Certo, mas e outras formas de usar???
--Poso usar para "imprimir" na tela nomes, idade, etc, tudo junto, com base  um um parametro!
--Por exemplo: "Imprima o nome, idade e cidade de pessoas com o id entre 1 a 20"
--Tambem consgo colocar vários dados em um banco de dados de fomrama simples.

--Vamos tentar usar o contoso:
--anotação pra mim: acho que da pra usar com aqueles dois ultimos exercícios que realizamos em "variáveis"
USE ContosoRetailDW

DECLARE @userID VARCHAR(MAX)
SET @userID = 10

WHILE @userID < 21
	BEGIN
		SELECT CustomerKey AS 'ID CLIENTE', FirstName AS 'PRIMEIRO NOME', LastName AS 'SOBRENOME'
		FROM DimCustomer
		WHERE CustomerKey = @userID
		--Percebe que declaramos a váriavel como id do cliente? (Meio óbvio, mas não achava que dava pra fazer)
		SET @userID = @userID + 1
		--DESTA FORMA, TEMOS UMA INTERAÇÃO ID CLIENTE E A VARIÁVEL!
	END;

--ACIMA É UMA FORMA DE PESQUISAR CLIENTES, BEM LEGAL.
--Voce pode pensar que o código acima da pra fazer com o betweem, por exemplo, mas lembre que ao usar variáveis e uma condição, deixa ele mais "vivo"

--Abaixo, vou tenta usar o loop na contoso com base nos dois ultimos exercícios:

--(EX 04) Encontrar empresas que fecharam no ano de 2008

--CODE OFC:

DECLARE @lojas VARCHAR(MAX)
SET @lojas = ''

SELECT 
@lojas = @lojas + StoreName + ', '
FROM
DimStore
WHERE CloseDate BETWEEN '20080101' AND '20081212'

PRINT 'As lojas fechadas foram: ' + LEFT(@lojas, DATALENGTH(@lojas))

--Forma com loop:
--minha tentativa:

DECLARE @lojasC VARCHAR(MAX)
SET @lojasC = ''

WHILE @lojasC BETWEEN '20080101' AND '20081212'
	BEGIN
		SELECT StoreName AS 'LOJA', CloseDate AS 'DATA DE FECHAMENTO'
		FROM DimStore
		WHERE CloseDate = @lojasC

		SET @lojasC = @lojasC + 1

	END;

--abaixo é a do gpt:
DECLARE @lojasC DATE = '20080101'; -- Inicializa a variável de data
DECLARE @lojas VARCHAR(MAX) = ''; -- Inicializa a variável para armazenar nomes das lojas

WHILE @lojasC <= '20081212' -- Enquanto a data for menor ou igual a 20081212
BEGIN
    -- Seleciona os nomes das lojas com a data de fechamento igual à data atual
    SELECT @lojas = @lojas + StoreName + ', ' 
    FROM DimStore
    WHERE CloseDate = @lojasC;

    -- Incrementa a data em um dia
    SET @lojasC = DATEADD(DAY, 1, @lojasC);
END;

-- Remove a última vírgula e espaço
SET @lojas = LEFT(@lojas, LEN(@lojas) - 1); 

-- Exibe o resultado
PRINT 'As lojas fechadas foram: ' + @lojas;


--Não está completo, mas é por ai
--DA PRA USAR O WHILE PARA ALTERAR O NOME DE ALGO EM UMA CÉLULA EM UMA TABELA! (ALTERA O NULL PARA NULO, ETC)

--acima foi a estrutura de repetição WHILE.
--ESTRUTURA DE REPETIÇÃO (Um bloco de código que vai ser executado várias vezes até chegar em um resultado;)
--loop for e loop while

--LOOP:
-- [<rótulo>:] LOOP
-- declarações
-- END LOOP [<rótulo>];
-- RÓTULO É USADO PARA FZER REFERENCIA DELE EM OUTROS BLOCOS DE CÓDIGO.
-- Mas é opcional
--LOOP, FOR LOOP NÃO TEM NO SQL SERVER, TALVEZ SÓ EXPLICAR MAIS.

--Certo, temos um exemplo de while com a contoso, agora vamos partir pra clínica:
--ideia: Criar um while para listar médicos de acordo com sua especialidade (ou funcionario) 
