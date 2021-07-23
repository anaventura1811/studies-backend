-- Queries da Aula ao Vivo

-- CONCAT, IF
SELECT
  customer_id,
CONCAT
  (first_name, " ", last_name)
  AS
    full_name,
active,
IF
  (active, "Ativo", "Não ativo")
    AS
      status,
IF
    (customer_id <= 100,
      "Parabéns, vc é um dos nossos 100 primeiros clientes!",
      "Olá, vc é um cliente precioso!!")
FROM 
  sakila.customer;

-- DATEDIFF
SELECT DATEDIFF(return_date, rental_date)
  AS rental_duration
FROM sakila.rental
LIMIT 10;

-- GROUP BY:
SELECT rating, MAX(rental_rate)
FROM sakila.film
GROUP BY rating;