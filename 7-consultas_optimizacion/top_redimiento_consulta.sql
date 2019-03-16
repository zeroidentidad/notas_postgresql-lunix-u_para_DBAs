SELECT 
  (total_time / 1000 / 60) as total_minutes, 
  (total_time/calls) as average_time, 
  query 
FROM pg_stat_statements 
WHERE query NOT LIKE '%pgbench%' and query not like 'BEGIN;%' and query not like 'END;%'
ORDER BY 1 DESC 
LIMIT 5;
