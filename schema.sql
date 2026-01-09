-- orders: trades placed by users
CREATE TABLE If NOT EXISTS orders (
    order_id TEXT PRIMARY KEY, -- unique 
    user_id TEXT NOT NULL,
    symbol TEXT NOT NULL,
    side TEXT CHECK(side IN ('buy', 'sell')) NOT NULL,
    qty INTEGER NOT NULL,
    limit_price REAL,
    status TEXT CHECK(status IN ('open', 'pending', 'filled', 'canceled')) NOT NULL DEFAULT 'open',
    timestamp TEXT NOT NULL
);

-- fills: records of completed trades
CREATE TABLE If NOT EXISTS fills (
    fill_id TEXT PRIMARY KEY, -- unique
    order_id TEXT NOT NULL,
    fill_qty INTEGER NOT NULL,
    fill_price REAL NOT NULL,
    fill_timestamp TEXT NOT NULL,

    -- fills must correspond to valid orders
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE IF NOT EXISTS positions (
    user_id TEXT NOT NULL,
    symbol TEXT NOT NULL,
    qty INTEGER NOT NULL,
    average_price REAL NOT NULL,
    updated_timestamp TEXT NOT NULL,
    PRIMARY KEY (user_id, symbol)
);

CREATE INDEX IF NOT EXISTS idx_fills_order_id ON fills(order_id);
CREATE INDEX IF NOT EXISTS idx_orders_user_ts ON orders(user_id, timestamp);
CREATE INDEX IF NOT EXISTS idx_fills_ts ON fills(fill_timestamp);
