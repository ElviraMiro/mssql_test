
CREATE TABLE users (ID varchar(64) UNIQUE,email varchar(64),PRIMARY KEY (ID));
CREATE INDEX idx_email ON users (email);

CREATE TABLE accounts (ID varchar(64) UNIQUE,owner varchar(64),currency varchar(3),PRIMARY KEY (ID),FOREIGN KEY (owner) REFERENCES users(ID));
CREATE INDEX idx_owner ON accounts (owner);
CREATE INDEX idx_currency ON accounts (currency); 
CREATE INDEX idx_owner_currency ON accounts (owner, currency);


CREATE TABLE orders (ID varchar(64) UNIQUE,timestamp INT,owner varchar(64),baseCurrency varchar(3),quoteCurrency varchar(3),amount float,rate float,side varchar(4),PRIMARY KEY (ID),FOREIGN KEY (owner) REFERENCES users(ID));
CREATE INDEX idx_owner ON orders (owner); 
CREATE INDEX idx_base_currency ON orders (baseCurrency); 
CREATE INDEX idx_quote_currency ON orders (quoteCurrency); 
CREATE INDEX idx_currency_pair ON orders (baseCurrency, quoteCurrency); 
CREATE INDEX idx_side ON orders (side); 
CREATE INDEX idx_rate ON orders (rate); 
CREATE INDEX idx_curr_pair_side ON orders (baseCurrency, quoteCurrency, side); 
CREATE INDEX idx_curr_pair_side_timestamp ON orders (timestamp, baseCurrency, quoteCurrency, side);
CREATE INDEX idx_curr_pair_side_timestamp_rate ON orders (timestamp, baseCurrency, quoteCurrency, side, rate);


CREATE TABLE trades (ID varchar(64) UNIQUE,timestamp INT,orderID varchar(64),owner varchar(64),crossOrderID varchar(64),crossOwner varchar(64),baseCurrency varchar(3),quoteCurrency varchar(3),amount float,rate float(10,4),PRIMARY KEY (ID),FOREIGN KEY (owner) REFERENCES users(ID),FOREIGN KEY (orderID) REFERENCES orders(ID),FOREIGN KEY (crossOwner) REFERENCES users(ID),FOREIGN KEY (crossOrderID) REFERENCES orders(ID));
CREATE INDEX idx_timestamp ON trades (timestamp); 
CREATE INDEX idx_owner ON trades (owner); 
CREATE INDEX idx_orderID ON trades (orderID); 
CREATE INDEX idx_cross_owner ON trades (crossOwner); 
CREATE INDEX idx_crossOrderID ON trades (crossOrderID); 
CREATE INDEX idx_base_currency ON trades (baseCurrency); 
CREATE INDEX idx_quote_currency ON trades (quoteCurrency); 
CREATE INDEX idx_currency_pair ON trades (baseCurrency, quoteCurrency); 
CREATE INDEX idx_rate ON trades (rate);
CREATE INDEX idx_currency_pair_rate ON trades (baseCurrency, quoteCurrency, rate); 


CREATE TABLE deposits (ID varchar(64) UNIQUE,timestamp INT,owner varchar(64),currency varchar(3),amount float,PRIMARY KEY (ID),FOREIGN KEY (owner) REFERENCES users(ID));
CREATE INDEX idx_timestamp ON deposits (timestamp); 
CREATE INDEX idx_currency ON deposits (currency); 
CREATE INDEX idx_owner_currency ON deposits (owner, currency); 
CREATE INDEX idx_owner_currency_timestamp ON deposits (owner, currency, timestamp);


CREATE TABLE withdraws (ID varchar(64) UNIQUE,timestamp INT,owner varchar(64),currency varchar(3),amount float, PRIMARY KEY (ID),FOREIGN KEY (owner) REFERENCES users(ID));
CREATE INDEX idx_timestamp ON withdraws (timestamp); 
CREATE INDEX idx_currency ON withdraws (currency); 
CREATE INDEX idx_owner_currency ON withdraws (owner, currency); 
CREATE INDEX idx_owner_currency_timestamp ON withdraws (owner, currency, timestamp);


CREATE TABLE generalLedger (ID varchar(64) NOT NULL UNIQUE,timestamp INT NOT NULL,transactionID varchar(64) NOT NULL,account varchar(3) NOT NULL,currency varchar(3) NOT NULL,owner varchar(64),debet float,credit float,orderID varchar(64),PRIMARY KEY (ID),FOREIGN KEY (owner) REFERENCES users(ID),FOREIGN KEY (orderID) REFERENCES orders(ID));
CREATE INDEX idx_currency ON generalLedger (currency); 
CREATE INDEX idx_account ON generalLedger (currency, account); 
CREATE INDEX idx_owner ON generalLedger (currency, owner); 
CREATE INDEX idx_owner_account ON generalLedger (currency, owner, account); 
CREATE INDEX idx_order ON generalLedger (currency, orderID); 
CREATE INDEX idx_transactionId ON generalLedger (currency, transactionID); 
CREATE INDEX idx_total ON generalLedger (currency, account, owner, orderID, debet, credit);
    