-- Queries com JOIN:
SELECT
  city.city, city.country_id, country.country
FROM
  sakila.city
AS
  city
INNER JOIN
  sakila.country
AS
  country
ON
  city.country_id = country.country_id;

-- Querie 2:
SELECT
  f.title, f.language_id, l.name
FROM
  sakila.film
AS
  f
INNER JOIN
  sakila.language
AS
  l
ON
  f.language_id = l.language_id;