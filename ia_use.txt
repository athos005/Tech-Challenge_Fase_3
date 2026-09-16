SELECT 
    year, 
    industry AS setor, 
    CASE 
        WHEN ai_priority LIKE 'Sim, é nossa principal prioridade como empresa%' THEN 'Prioridade Máxima (Atual)'
        WHEN ai_priority LIKE 'Sim, está entre nossas principais prioridades para os próximos 2-4 anos%' THEN 'Prioridade Alta próximos anos'
        WHEN ai_priority LIKE 'Mais ou menos...%' THEN 'Prioridade Moderada / Secundária'
        WHEN ai_priority LIKE 'Não é uma iniciativa que estamos focando%' THEN 'Sem Foco / Não Prioritário'
        WHEN ai_priority LIKE 'Não sei opinar%' THEN 'Não Sabe / Não Respondeu'
        ELSE 'Outra Opção'
    END AS ai_priority, 
    SUM(total_companies) AS total_empresas
FROM db_tech_challenge.ai_adoption_impact
WHERE industry IS NOT NULL 
  AND ai_priority IS NOT NULL
GROUP BY year, industry, ai_priority
ORDER BY year ASC, total_empresas DESC;
