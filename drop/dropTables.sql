
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
DROP TABLE orders;
DROP TABLE trades; 
DROP TABLE deposits;
DROP TABLE withdraws;
DROP TABLE generalLedger;
