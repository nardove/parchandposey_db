CREATE DATABASE IF NOT EXISTS parchandposey;

USE parchandposey;


CREATE TABLE region (
	id integer,
	name VARCHAR(50),
    PRIMARY KEY (id)
);


CREATE TABLE sales_reps (
	id integer,
	name VARCHAR(50),
	region_id integer,
    PRIMARY KEY (id),
    FOREIGN KEY (region_id) REFERENCES region (id)
);


CREATE TABLE accounts (
	id integer,
	name VARCHAR(50),
	website VARCHAR(150),
	lat numeric(11,8),
	lng numeric(11,8),
	primary_poc VARCHAR(50),
	sales_rep_id integer,
    PRIMARY KEY (id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(id)
);


CREATE TABLE orders (
	id integer,
	account_id integer,
	occurred_at timestamp,
	standard_qty integer,
	gloss_qty integer,
	poster_qty integer,
	total integer,
	standard_amt_usd numeric(10,2),
	gloss_amt_usd numeric(10,2),
	poster_amt_usd numeric(10,2),
	total_amt_usd numeric(10,2),
    PRIMARY KEY (id),
	FOREIGN KEY (account_id) REFERENCES accounts(id)
);


CREATE TABLE web_events (
	id integer,
	account_id integer,
	occurred_at timestamp,
	channel VARCHAR(15),
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES accounts(id)
);