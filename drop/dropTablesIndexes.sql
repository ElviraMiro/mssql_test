
ALTER TABLE users DROP INDEX idx_email;
DROP TABLE users;

ALTER TABLE accounts DROP INDEX idx_owner;
ALTER TABLE accounts DROP INDEX idx_currency;
ALTER TABLE accounts DROP INDEX idx_owner_currency;
DROP TABLE accounts;

ALTER TABLE orders DROP INDEX idx_owner;
ALTER TABLE orders DROP INDEX idx_base_currency;
ALTER TABLE orders DROP INDEX idx_quote_currency;
ALTER TABLE orders DROP INDEX idx_currency_pair;
ALTER TABLE orders DROP INDEX idx_side;
ALTER TABLE orders DROP INDEX idx_rate;
ALTER TABLE orders DROP INDEX idx_curr_pair_side;
ALTER TABLE orders DROP INDEX idx_curr_pair_side_timestamp;
ALTER TABLE orders DROP INDEX idx_curr_pair_side_timestamp_rate;
DROP TABLE orders;

ALTER TABLE trades DROP INDEX idx_timestamp;
ALTER TABLE trades DROP INDEX idx_owner;
ALTER TABLE trades DROP INDEX idx_orderID;
ALTER TABLE trades DROP INDEX idx_cross_owner;
ALTER TABLE trades DROP INDEX idx_crossOrderID;
ALTER TABLE trades DROP INDEX idx_base_currency;
ALTER TABLE trades DROP INDEX idx_quote_currency;
ALTER TABLE trades DROP INDEX idx_currency_pair;
ALTER TABLE trades DROP INDEX idx_rate;
ALTER TABLE trades DROP INDEX idx_currency_pair_rate;
DROP TABLE trades; 

ALTER TABLE deposits DROP INDEX idx_timestamp;
ALTER TABLE deposits DROP INDEX idx_currency;
ALTER TABLE deposits DROP INDEX idx_owner_currency;
ALTER TABLE deposits DROP INDEX idx_owner_currency_timestamp;
DROP TABLE deposits;

ALTER TABLE withdraws DROP INDEX idx_timestamp;
ALTER TABLE withdraws DROP INDEX idx_currency;
ALTER TABLE withdraws DROP INDEX idx_owner_currency;
ALTER TABLE withdraws DROP INDEX idx_owner_currency_timestamp;
DROP TABLE withdraws;

ALTER TABLE generalLedger DROP INDEX idx_currency;
ALTER TABLE generalLedger DROP INDEX idx_account;
ALTER TABLE generalLedger DROP INDEX idx_owner;
ALTER TABLE generalLedger DROP INDEX idx_owner_account;
ALTER TABLE generalLedger DROP INDEX idx_order;
ALTER TABLE generalLedger DROP INDEX idx_transactionId;
ALTER TABLE generalLedger DROP INDEX idx_total;
DROP TABLE generalLedger;
    