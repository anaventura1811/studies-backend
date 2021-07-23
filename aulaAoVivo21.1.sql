-- Queries da Aula ao Vivo
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
