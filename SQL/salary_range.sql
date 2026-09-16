SELECT 
    year, 
    seniority_level,
    CASE WHEN salary_range LIKE '%Menos de R$ 1.000%' THEN 'Até R$ 1.000'
        WHEN salary_range LIKE '%de R$ 101/mês a R$ 2.000%' THEN 'R$ 101 - R$ 2.000'
        WHEN salary_range LIKE '%de R$ 1.001/mês a R$ 2.000%' THEN 'R$ 1.001 - R$ 2.000'
        WHEN salary_range LIKE '%de R$ 2.001/mês a R$ 3.000%' THEN 'R$ 2.001 - R$ 3.000'
        WHEN salary_range LIKE '%de R$ 3.001/mês a R$ 4.000%' THEN 'R$ 3.001 - R$ 4.000'
        WHEN salary_range LIKE '%de R$ 4.001/mês a R$ 6.000%' THEN 'R$ 4.001 - R$ 6.000'
        WHEN salary_range LIKE '%de R$ 6.001/mês a R$ 8.000%' THEN 'R$ 6.001 - R$ 8.000'
        WHEN salary_range LIKE '%de R$ 8.001/mês a R$ 12.000%' THEN 'R$ 8.001 - R$ 12.000'
        WHEN salary_range LIKE '%de R$ 12.001/mês a R$ 16.000%' THEN 'R$ 12.001 - R$ 16.000'
        WHEN salary_range LIKE '%de R$ 16.001/mês a R$ 20.000%' THEN 'R$ 16.001 - R$ 20.000'
        WHEN salary_range LIKE '%de R$ 20.001/mês a R$ 25.000%' THEN 'R$ 20.001 - R$ 25.000'
        WHEN salary_range LIKE '%de R$ 25.001/mês a R$ 30.000%' THEN 'R$ 25.001 - R$ 30.000'
        WHEN salary_range LIKE '%de R$ 30.001/mês a R$ 40.000%' THEN 'R$ 30.001 - R$ 40.000'
        WHEN salary_range LIKE '%Acima de R$ 40.001%' THEN 'Acima de R$ 40.001'
        ELSE 'Outra Opção'
    END as salary_range, 
    SUM(total_professionals) AS total_profissionais
FROM db_tech_challenge.salary_by_seniority
WHERE seniority_level IS NOT NULL 
  AND salary_range IS NOT NULL
GROUP BY year, seniority_level, salary_range
ORDER BY year ASC, seniority_level, total_profissionais DESC;
