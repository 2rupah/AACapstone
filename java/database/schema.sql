BEGIN TRANSACTION;

DROP TABLE IF EXISTS user_brewery;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS beer;
DROP TABLE IF EXISTS brewery;

CREATE TABLE brewery (
    brewery_id serial PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(150) NOT NULL,
    established_year INT,
    description TEXT,
    imageURL VARCHAR(255)
);

CREATE TABLE beer (
    beer_id serial PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    brewery_id INT,
    style VARCHAR(100),
    abv DECIMAL(4, 2),
    ibu INT,
    description TEXT,
    FOREIGN KEY (brewery_id) REFERENCES brewery(brewery_id),
    imageURL VARCHAR(255),
	rating INT
);

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username varchar(50) NOT NULL UNIQUE,
    password_hash varchar(200) NOT NULL,
    role varchar(50) NOT NULL,
    brewery_id INT, -- New column to associate users with breweries
    CONSTRAINT FK_user_brewery FOREIGN KEY (brewery_id) REFERENCES brewery(brewery_id)
);


CREATE TABLE user_brewery (
    user_id INT,
    brewery_id INT,
    CONSTRAINT FK_user FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT FK_brewery FOREIGN KEY (brewery_id) REFERENCES brewery(brewery_id),
    PRIMARY KEY (user_id, brewery_id)
);

COMMIT TRANSACTION;
