BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
	user_id SERIAL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE brewery (
    brewery_id serial PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(150) NOT NULL,
    established_year INT,
    description TEXT
);

CREATE TABLE beer (
    beer_id serial PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    brewery_id INT,
    style VARCHAR(100),
    abv DECIMAL(4, 2),
    ibu INT,
    description TEXT,
    FOREIGN KEY (brewery_id) REFERENCES brewery(brewery_id)
);

COMMIT TRANSACTION;
