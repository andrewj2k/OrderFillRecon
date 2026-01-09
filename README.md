# OrderFillRecon

This project focuses on basic order/fill reconciliation using SQLite.

- **Recon Summary (Query 1):** Produces one row per order showing `order_qty`, total `filled_qty` (sum of all fills tied to the order), and `remaining_qty` (`order_qty - filled_qty`). It uses a **LEFT JOIN** so orders with **no fills** still appear, and **COALESCE** so missing fill totals show as 0 instead of NULL.

- **Underfilled Orders (Query 2):** Filters the same reconciliation logic to only return orders where `filled_qty < order_qty`. This is a simple ops-style check to identify orders that are still open/partial or missing execution data.