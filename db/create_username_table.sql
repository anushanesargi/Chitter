CREATE TABLE Username (id SERIAL PRIMARY KEY, username VARCHAR(50), password VARCHAR(200));

CREATE TABLE Messages (id SERIAL PRIMARY KEY, username VARCHAR(50), message VARCHAR(180), date DATE, time TIME);