
SELECT
  query,
  total_bytes_processed AS processed_bytes,
  total_bytes_processed / 1024 / 1024  AS processed_MB,
  total_bytes_processed / 1024 / 1024 / 1024  * 1 AS Charges_yen,
  end_time-start_time,
  start_time,
  end_time,
  cache_hit,
  total_bytes_billed / 1024 / 1024 AS billed_MB,
FROM
`region-us-central1`.INFORMATION_SCHEMA.JOBS_BY_PROJECT
WHERE
  query like '%pf%ml_dataset%'  and query not like '%INFORMATION_SCHEMA%'
ORDER BY DATETIME(creation_time)  DESC
LIMIT 1;

