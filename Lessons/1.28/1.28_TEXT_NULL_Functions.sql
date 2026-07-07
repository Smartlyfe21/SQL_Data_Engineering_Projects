SELECT CHAR_LENGTH('SQL');


SELECT LOWER('SQL');

SELECT UPPER('sql');

SELECT SUBSTRING('SQL', 2, 1);

SELECT CONCAT('SQL', '-', 'Functions');

SELECT 'SQL' ||'-' || 'Functions';

SELECT TRIM(' SQL ');

SELECT REPLACE('SQL', 'Q', '-');

SELECT REGEXP_REPLACE('data.nerd@gmail.com', '^.*(@)', '\1');

-- Final example -cleanup this using Text Functions
WITH title_lower AS (
    SELECT
         job_title,
         LOWER(TRIM(job_title)) AS job_title_clean
    FROM     job_postings_fact     
)



SELECT
    job_title,
    CASE
        WHEN job_title_clean LIKE '%data%'
         AND job_title_clean LIKE '%analysts%' THEN 'Data Analyst'
        WHEN job_title_clean LIKE '%data%'
         AND job_title_clean LIKE '%scientists%' THEN 'Data Scientist'
        WHEN job_title_clean LIKE '%data%'
         AND job_title_clean LIKE '%engineer%' THEN 'Data Engineer'  
        ELSE 'Other'
    END AS salary_category
FROM title_lower
ORDER BY RANDOM()
LIMIT 30; 



SELECT NULLIF(10, 20);

SELECT 
        NULLIF(salary_year_avg, 0),
        NULLIF(salary_hour_avg, 0)
FROM
    job_postings_fact
WHERE salary_hour_avg IS NOT NULL OR salary_year_avg IS NOT NULL
ORDER BY salary_year_avg
LIMIT 10;            


SELECT COALESCE(NULL, 1, 2);
---Final Example simplify with coalesce


SELECT
  job_title_short,
  salary_year_avg,
  salary_hour_avg,
  COALESCE(salary_year_avg, salary_hour_avg * 2080) AS standardized_salary,
  CASE
    WHEN COALESCE(salary_year_avg, salary_hour_avg * 2080) IS NULL THEN 'Missing'
    WHEN COALESCE(salary_year_avg, salary_hour_avg * 2080) < 75000 THEN 'Low'
    WHEN COALESCE(salary_year_avg, salary_hour_avg * 2080) < 150000 THEN 'Mid'
    ELSE 'High'
  END AS salary_bucket
FROM job_postings_fact
ORDER BY standardized_salary DESC;   





