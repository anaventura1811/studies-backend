-- Converte o texto da string para CAIXA ALTA
SELECT UCASE('Oi, eu sou uma string');

-- Converte o texto da string para caixa baixa
SELECT LCASE('Oi, eu sou uma string');

-- Substitui as ocorrências de uma substring em uma string
SELECT REPLACE('Oi, eu sou uma string', 'string', 'cadeia de caracteres');

-- Retorna a parte da esquerda de uma string de acordo com o
-- número de caracteres especificado
SELECT LEFT('Oi, eu sou uma string', 3);

-- Retorna a parte da direita de uma string de acordo com o
-- número de caracteres especificado
SELECT RIGHT('Oi, eu sou um string', 6);

-- Exibe o tamanho, em caracteres, da string
SELECT LENGTH('Oi, eu sou uma string');

-- Extrai parte de uma string de acordo com o índice de um caractere inicial
-- e a quantidade de caracteres a extrair
SELECT SUBSTRING('Oi, eu sou uma string', 5, 2);

-- Se a quantidade de caracteres a extrair não for definida,
-- então a string será extraída do índice inicial definido, até o seu final
SELECT SUBSTRING('Oi, eu sou uma string', 5);

SELECT UCASE(title) FROM sakila.film LIMIT 10;
SELECT LCASE(title) FROM sakila.film LIMIT 10;
SELECT REPLACE(title, 'ACADEMY', 'FOO') FROM sakila.film WHERE film_id = 1;
SELECT LEFT(title, 7) FROM sakila.film WHERE film_id = 1;
SELECT RIGHT(title, 8) FROM sakila.film WHERE film_id = 1;
SELECT LENGTH(title) FROM sakila.film WHERE film_id = 1;
SELECT SUBSTRING(title, 5, 2) FROM sakila.film WHERE film_id = 1;
SELECT SUBSTRING(title, 5) FROM sakila.film WHERE film_id = 1;

-- Exercício 1
SELECT UCASE('trybe');

-- Exercício 2
SELECT REPLACE('Você já ouviu falar do DuckDuckGo?', 'DuckDuckGo', 'Google');

-- Exercício 3
SELECT LENGTH('Uma frase qualquer');

-- Exercício 4
SELECT SUBSTRING('A linguagem JavaScript está entre as mais usadas', 12, 11);

-- Exercício 5
SELECT LCASE('RUA NORTE 1500, SÃO PAULO, BRASIL');

-- Aula:
SELECT IF (rental_rate > 0.99, 'CARO', 'BARATO')
AS classificacao_rentals 
FROM sakila.film
LIMIT 12;

SELECT title, IF (rental_rate > 0.99, 'CARO', 'BARATO')
AS rentals_price_range
FROM sakila.film
LIMIT 12;

SELECT title, rental_rate,
  CASE
    WHEN rental_rate = 0.99 THEN 'Barato'
    WHEN rental_rate = 2.99 THEN 'Médio'
    WHEN rental_rate = 4.99 THEN 'Caro'
  ELSE rental_rate = 'Não classificado'
  END AS valor
FROM sakila.film
LIMIT 10;

-- Sintaxe:
SELECT IF(condicao, valor_se_verdadeiro, valor_se_falso);

SELECT IF(idade >= 18, 'Maior de idade', 'Menor de Idade')
FROM pessoas;

SELECT IF(aberto, 'Entrada permitida', 'Entrada não permitida')
FROM estabelecimentos;

-- Exemplo utilizando o banco sakila:
SELECT first_name, IF(active, 'Cliente Ativo', 'Cliente Inativo') AS status
FROM sakila.customer
LIMIT 20;

-- Em situações em que é necessário comparar mais de uma condição, utilizar o CASE
-- Sintaxe:
SELECT CASE
  WHEN condicao THEN valor
  ELSE valor padrao
END;

SELECT
    nome,
    nivel_acesso,
    CASE
        WHEN nivel_acesso = 1 THEN 'Nível de acesso 1'
        WHEN nivel_acesso = 2 THEN 'Nível de acesso 2'
        WHEN nivel_acesso = 3 THEN 'Nível de acesso 3'
        ELSE 'Usuário sem acesso'
    END AS nivel_acesso
FROM permissoes_usuario;

-- Exemplo utilizando a tabela sakila.film:
SELECT
    first_name,
    email,
    CASE
        WHEN 
          email = 'MARY.SMITH@sakilacustomer.org' THEN 'Cliente de baixo valor'
        WHEN
          email = 'PATRICIA.JOHNSON@sakilacustomer.org' THEN 'Cliente de médio valor'
        WHEN 
          email = 'LINDA.WILLIAMS@sakilacustomer.org' THEN 'Cliente de alto valor'
        ELSE 'não classificado'
    END AS valor
FROM sakila.customer
LIMIT 10;

-- Exercício 6 

SELECT
  film_id, title,
IF 
  (title = 'ACE GOLDFINGER', 'Já assisti a esse filme', 'Não conheço o filme')
AS 
  'conheço_o_filme?'
FROM 
  sakila.film;

-- Exercício 7
SELECT title, rating,
	CASE
		WHEN rating = 'G' THEN 'Livre para todos'
        WHEN rating = 'PG' THEN 'Não recomendado para menores de 10 anos'
        WHEN rating = 'PG-13' THEN 'Não recomendado para menores de 13 anos'
        WHEN rating = 'R' THEN 'Não recomendado para menores de 17 anos'
	ELSE 'Proibido para menores de idade'
END AS 'público_alvo'
FROM sakila.film;

-- Adição, subtração, multiplicação e divisão usando sql
SELECT 5 + 5;
SELECT 5 - 5;
SELECT 5 * 5;
SELECT 5 / 5;

SELECT rental_duration + rental_rate FROM sakila.film LIMIT 10;
SELECT rental_duration - rental_rate FROM sakila.film LIMIT 10;
SELECT rental_duration / rental_rate FROM sakila.film LIMIT 10;
SELECT rental_duration * rental_rate FROM sakila.film LIMIT 10;

-- Divisão de números inteiros com DIV:
SELECT 10 DIV 3; -- 3
SELECT 10 DIV 2; -- 5
SELECT 14 DIV 3; -- 4
SELECT 13 DIV 2; -- 6

-- Resto de divisão com MOD - similar ao módulo do JS:
SELECT 10 MOD 3; -- 1
SELECT 10 MOD 2; -- 0
SELECT 14 MOD 3; -- 2
SELECT 13 MOD 2; -- 1
SELECT 10.5 MOD 2; -- 0.5, ou seja, 2 + 2 + 2 + 2 + 2 = 10, restando 0.5

-- Desafios com DIV e MOD:
--> Desafio 1
SELECT IF (15 MOD 2 = 0, 'É par', 'É ímpar')
AS 'par_ou_ímpar';

--> Desafio 2:
SELECT CASE
	WHEN (220 MOD 12) > 0 AND (220 MOD 12 <= 12 )THEN (220 DIV 12) + 1
    WHEN (220 MOD 12) > 0 AND (220 MOD 12 > 12 AND 220 MOD 12 <= 24)  THEN (220 DIV 12) + 2
    ELSE 'Podemos levar' + (220 DIV 12)
    END AS 'podemos levar o seguinte número de grupos completos';

-- Arrendondamento de valores com SQL:
-- Podemos omitir ou especificar quantas casas decimais queremos
SELECT ROUND(10.4925); -- 10
SELECT ROUND(10.5136); -- 11
SELECT ROUND(-10.5136); -- -11
SELECT ROUND(10.4925, 2); -- 10.49
SELECT ROUND(10.4925, 3); -- 10.493

-- Pode ser feito arrendondamento para cima com CEIL:
SELECT CEIL(10.51); -- 11
SELECT CEIL(10.49); -- 11
SELECT CEIL(10.2); -- 11

-- Ou arrendondamento sempre para baixo com FLOOR:
SELECT FLOOR(10.51); -- 10
SELECT FLOOR(10.49); -- 10
SELECT FLOOR(10.2); -- 10

-- Exponenciação e raíz quadrada:
-- > Potência:
SELECT POW(2, 2); -- 4
SELECT POW(2, 3); -- 8

-- > Raíz quadrada:
SELECT SQRT(9); -- 3
SELECT SQRT(16); -- 4

-- Gerando valores aleatórios:
-- Para gerar um valor aleatório entre 0 e 1:
SELECT RAND();

-- Para gerar um valor entre 7 e 13:
SELECT ROUND(7 + (RAND() * 6));

-- O cálculo que é feito é o seguinte: (7 + (0.0 a 1.0 * 6))

-- Monte uma query que gere um valor entre 15 e 20:
SELECT ROUND(15 + (RAND() * 5));

-- Monte uma query que exiba o valor arredondado de 15.7515971 com uma precisão de 5 casas decimais:
SELECT ROUND(15.7515971, 5);

-- Estamos com uma média de 39.494 de vendas de camisas por mês.
-- Qual é o valor aproximado para baixo dessa média?
SELECT FLOOR(39.494);

-- Temos uma taxa de inscrição de 85.234% no curso de fotografia para iniciantes.
-- Qual é o valor aproximado para cima dessa média?
SELECT CEIL(85.234);

-- Datas:
SELECT CURRENT_DATE(); -- YYYY-MM-DD
SELECT NOW(); -- YYYY-MM-DD HH:MM:SS

-- Diferença em dias entre duas datas ou entre dois horários:
-- 30, ou seja, a primeira data é 30 dias depois da segunda
SELECT DATEDIFF('2020-01-31', '2020-01-01');

-- -30, ou seja, a primeira data é 30 dias antes da segunda
SELECT DATEDIFF('2020-01-01', '2020-01-31');

-- -01:00:00, ou seja, há 1 hora de diferença entre os horários
SELECT TIMEDIFF('08:30:10', '09:30:10');

-- Podemos extrair qualquer parte de uma data de uma coluna:
SELECT DATE(data_cadastro); -- YYYY-MM-DD
SELECT YEAR(data_cadastro); -- Ano
SELECT MONTH(data_cadastro); -- Mês
SELECT DAY(data_cadastro); -- Dia
SELECT HOUR(data_cadastro); -- Hora
SELECT MINUTE(data_cadastro); -- Minuto
SELECT SECOND(data_cadastro); -- Segundo

-- CurrentDate e Now para encontrar datas e horários de forma dinâmica:
SELECT YEAR(CURRENT_DATE()); -- retorna o ano atual
SELECT HOUR(NOW()); -- retorna a hora atual

-- Exercícios de Fixação sobre Datas:
-- 1 - Monte uma query que exiba a diferença de dias entre '2030-01-20' e hoje
SELECT DATEDIFF('2030-01-20', '2021-07-23');

-- 2 - Monte uma query exiba a diferença de horas entre '10:25:45' e '11:00:00' 
SELECT TIMEDIFF('10:25:45', '11:00:00');

-- Funções de agregação: SUM, AVG, COUNT, MIN, MAX:
-- Usando a coluna replacement_cost (valor de substituição) vamos encontrar:
SELECT AVG(replacement_cost) FROM sakila.film; -- 19.984000 (Média entre todos registros)
SELECT MIN(replacement_cost) FROM sakila.film; -- 9.99 (Menor valor encontrado)
SELECT MAX(replacement_cost) FROM sakila.film; -- 29.99 (Maior valor encontrado)
SELECT SUM(replacement_cost) FROM sakila.film; -- 19984.00 (Soma de todos registros)
SELECT COUNT(replacement_cost) FROM sakila.film; -- 1000 registros encontrados (Quantidade)

-- Exercícios de fixação sobre Funções de Agregação:
-- 1 - A média de duração dos filmes e dê o nome da coluna de 'Média de Duração'
SELECT AVG(length) AS 'Média de Duração' FROM sakila.film;

-- 2 - A duração mínima dos filmes como 'Duração Mínima';
SELECT MIN(length) AS 'Duração Mínima' FROM sakila.film;

-- 3 - A duração máxima dos filmes como 'Duração Máxima';
SELECT MAX(length) AS 'Duração Máxima' FROM sakila.film;

-- 4 - A soma de todas as durações como 'Tempo de Exibição Total';
SELECT SUM(length) AS 'Tempo de Exibição Total' FROM sakila.film;

-- 5 - A quantidade total de filmes cadastrados na tabela sakila.film como 'Filmes Registrados':
SELECT COUNT(length) AS 'Filmes Registrados' FROM sakila.film;


