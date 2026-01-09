-- Orders
INSERT INTO orders (order_id, user_id, symbol, side, qty, limit_price, status, timestamp) VALUES
  ('O1', 'U100', 'AAPL', 'buy',  10, 190.00, 'filled',  '2026-01-08T19:00:00Z'),
  ('O2', 'U100', 'AAPL', 'buy',  20, 191.50, 'pending', '2026-01-08T19:05:00Z'),
  ('O3', 'U100', 'TSLA', 'sell',  5,  NULL,   'open',    '2026-01-08T19:10:00Z'),
  ('O4', 'U200', 'MSFT', 'buy',  15, 370.00, 'pending', '2026-01-08T19:12:00Z'),
  ('O5', 'U200', 'NVDA', 'buy',   8,  555.00, 'filled',  '2026-01-08T19:20:00Z');

-- Fills
-- O1: fully filled
INSERT INTO fills (fill_id, order_id, fill_qty, fill_price, fill_timestamp) VALUES
  ('F1', 'O1', 10, 189.80, '2026-01-08T19:00:05Z');

-- O2: partially filled 
INSERT INTO fills (fill_id, order_id, fill_qty, fill_price, fill_timestamp) VALUES
  ('F2', 'O2',  7, 191.40, '2026-01-08T19:05:10Z'),
  ('F3', 'O2',  5, 191.55, '2026-01-08T19:05:40Z');

-- O3: unfilled 

-- O4: overfilled 
INSERT INTO fills (fill_id, order_id, fill_qty, fill_price, fill_timestamp) VALUES
  ('F4', 'O4', 10, 369.90, '2026-01-08T19:12:08Z'),
  ('F5', 'O4',  6, 370.10, '2026-01-08T19:12:30Z');

-- O5: filled via multiple fills 
INSERT INTO fills (fill_id, order_id, fill_qty, fill_price, fill_timestamp) VALUES
  ('F6', 'O5',  3, 554.80, '2026-01-08T19:20:10Z'),
  ('F7', 'O5',  5, 555.10, '2026-01-08T19:20:25Z');

-- Positions 
INSERT INTO positions (user_id, symbol, qty, average_price, updated_timestamp) VALUES
  ('U100', 'AAPL', 22, 190.90, '2026-01-08T19:06:00Z'),
  ('U100', 'TSLA', -5, 0.00,   '2026-01-08T19:10:00Z'),
  ('U200', 'MSFT', 16, 370.00, '2026-01-08T19:13:00Z'),
  ('U200', 'NVDA',  8, 555.00, '2026-01-08T19:21:00Z');