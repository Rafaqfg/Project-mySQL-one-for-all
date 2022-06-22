SELECT
  ROUND(MIN(price), 2) AS 'faturamento_minimo',
  ROUND(MAX(price), 2) AS 'faturamento_maximo',
  ROUND(AVG(price), 2) AS 'faturamento_medio',
  ROUND(SUM(price), 2) AS 'faturamento_total'
FROM plan
INNER JOIN
  user ON plan.id = user.plan_id;
