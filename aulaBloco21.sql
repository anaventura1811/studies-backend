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
