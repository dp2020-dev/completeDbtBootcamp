{{
  config(
    materialized = 'view'
  )
}}

WITH src_hosts AS (
    SELECT * FROM {{ref ('src_hosts')}}
)
SELECT 
created_at,
host_id,
is_superhost,
CASE
    WHEN host_name is null THEN 'ANONYMOUS'
    ELSE host_name
    END AS host_name,
updated_at
FROM 
    src_hosts