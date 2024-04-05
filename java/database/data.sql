BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

-- INSERT brewery
INSERT INTO breweries (name, location, established_year, description, rating) VALUES
('Hoof Hearted Brewery and Kitchen', '850 N 4th St, Columbus, OH 43215', 2011, 'Quirky brewery & restaurant offering craft beers, inventive pub fare & a large patio.', 4.4),
('Wolfs Ridge Brewing', '215 N 4th St, Columbus, OH 43215', 2013, 'Modern brewpub serving a range of craft beers & elevated pub fare in a sleek, industrial setting.', 4.6),
('Knotty Pine Brewing', '1765 W 3rd Ave, Columbus, OH 43212', 2017, 'Brewpub serving housemade craft beers & American eats in a cozy space with a woodsy vibe.', 4.2),
('Barley''s Brewing Company', '467 N High St, Columbus, OH 43215', 1992, 'Longtime brewpub serving housemade beers & classic pub fare in a cozy, brick-walled space.', 4.1);

-- INSERT beer
INSERT INTO beers (name, brewery_id, style, abv, ibu, description) VALUES
('Double IPA', 1, 'Double IPA', 8.0, 80, 'Intensely hoppy ale with a bold bitterness and tropical fruit flavors.'),
('Berliner Weisse', 1, 'Berliner Weisse', 4.0, 5, 'Tart and refreshing wheat beer with a clean, crisp finish.'),

('Porter', 2, 'Porter', 6.2, 35, 'Smooth and velvety ale with notes of roasted malt, dark chocolate, and a hint of smoke.'),
('Belgian Tripel', 2, 'Belgian Tripel', 9.0, 30, 'Strong and complex ale with fruity esters, spicy phenols, and a dry finish.'),

('Blonde Ale', 3, 'Blonde Ale', 4.5, 20, 'Light and crisp ale with a subtle malt sweetness and a clean, refreshing finish.'),
('Cream Ale', 3, 'Cream Ale', 5.0, 15, 'Smooth and easy-drinking ale with a hint of sweetness and a mild hop bitterness.');

('Irish Red Ale', 4, 'Irish Red Ale', 5.0, 25, 'Smooth and malty ale with a rich caramel flavor and a dry, roasted finish.'),
('Scottish Stout', 4, 'Stout', 6.0, 35, 'Dark and roasty ale with flavors of coffee, chocolate, and a hint of smoke.');

COMMIT TRANSACTION;
