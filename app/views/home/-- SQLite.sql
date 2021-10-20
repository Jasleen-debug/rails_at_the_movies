-- SQLite
SELECT COUNT(*) AS movie_count, production_companies.id, production_companies.name
FROM production_companies
JOIN movies ON movies.production_company_id = production_companies.id
GROUP BY production_companies.id, production_companies.name
ORDER BY movie_count DESC;