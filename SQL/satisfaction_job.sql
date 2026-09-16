SELECT 
    year, 
    work_model, 
    case when job_satisfaction = 'true' then 1
         when job_satisfaction = 'false' then 0
         else cast(job_satisfaction as bigint)
         end as job_satisfaction, 
    SUM(total_professionals) AS total_profissionais
FROM geo_work_satisfaction
WHERE work_model IS NOT NULL 
  AND length(job_satisfaction) <= 4
GROUP BY year, work_model, job_satisfaction
ORDER BY year ASC, total_profissionais DESC;
