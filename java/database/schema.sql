BEGIN TRANSACTION;
<<<<<<< HEAD

DROP TABLE IF EXISTS user_brewery;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS beer;
DROP TABLE IF EXISTS brewery;

=======
DROP TABLE IF EXISTS brewery, beer, users, user_brewery;
>>>>>>> 77fd02b0447506ba0f3bca9b8640b8efb9b337c7
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
<<<<<<< HEAD
    imageURL VARCHAR(255),
	rating INT
);

=======
    imageURL VARCHAR(255)
);
>>>>>>> 77fd02b0447506ba0f3bca9b8640b8efb9b337c7
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username varchar(50) NOT NULL UNIQUE,
    password_hash varchar(200) NOT NULL,
    role varchar(50) NOT NULL,
    brewery_id INT, -- New column to associate users with breweries
    CONSTRAINT FK_user_brewery FOREIGN KEY (brewery_id) REFERENCES brewery(brewery_id)
);
<<<<<<< HEAD


CREATE TABLE user_brewery (
    user_id INT,
    brewery_id INT,
    CONSTRAINT FK_user FOREIGN KEY (user_id) REFERENCES users(user_id),
=======
CREATE TABLE user_brewery (
    user_id INT,
    brewery_id INT,
    CONSTRAINT FK_users FOREIGN KEY (user_id) REFERENCES users(user_id),
>>>>>>> 77fd02b0447506ba0f3bca9b8640b8efb9b337c7
    CONSTRAINT FK_brewery FOREIGN KEY (brewery_id) REFERENCES brewery(brewery_id),
    PRIMARY KEY (user_id, brewery_id)
);
COMMIT TRANSACTION;