SELECT 
    year, 
    education_level AS nivel_ensino, 
    CASE 
        WHEN experience_time LIKE '%Não tenho experiência%' THEN 'Sem experiência'
        WHEN experience_time LIKE '%Menos de 1 ano%' THEN 'Menos de 1 ano'
        WHEN experience_time LIKE '%de 1 a 2 anos%' THEN '1 a 2 anos'
        WHEN experience_time LIKE '%de 3 a 4 anos%' THEN '3 a 4 anos'
        WHEN experience_time LIKE '%de 5 a 6 anos%' THEN '5 a 6 anos'
        WHEN experience_time LIKE '%de 7 a 10 anos%' THEN '7 a 10 anos'
        WHEN experience_time LIKE '%Mais de 10 anos%' THEN 'Mais de 10 anos'
        WHEN experience_time LIKE '%de 4 a 6 anos%' THEN '4 a 6 anos'
        WHEN experience_time LIKE '%Sênior%' THEN 'Sênior (Nível)'
        ELSE 'Outra Opção'
    END experience_time, 
    SUM(total_professionals) AS total_profissionais
FROM db_tech_challenge.market_maturity
WHERE education_level IS NOT NULL 
  AND experience_time IS NOT NULL
GROUP BY year, education_level, experience_time
ORDER BY year ASC, total_profissionais DESC;
