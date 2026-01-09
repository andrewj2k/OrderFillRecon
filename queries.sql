-- Q1: summary per order 
SELECT
  o.order_id,
  o.user_id,
  o.symbol,
  o.qty AS order_qty,
  COALESCE(SUM(f.fill_qty), 0) AS filled_qty,
  o.qty - COALESCE(SUM(f.fill_qty), 0) AS remaining_qty
FROM orders o
LEFT JOIN fills f ON f.order_id = o.order_id
GROUP BY o.order_id, o.user_id, o.symbol, o.qty
ORDER BY o.order_id;

-- Q2: Underfilled orders 
SELECT
  o.order_id,
  o.user_id,
  o.symbol,
  o.qty AS order_qty,
  COALESCE(SUM(f.fill_qty), 0) AS filled_qty,
  o.qty - COALESCE(SUM(f.fill_qty), 0) AS remaining_qty
FROM orders o
LEFT JOIN fills f ON f.order_id = o.order_id
GROUP BY o.order_id, o.user_id, o.symbol, o.qty
HAVING COALESCE(SUM(f.fill_qty), 0) < o.qty
ORDER BY o.order_id;