BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

-- INSERT brewery

INSERT INTO brewery (name, location, established_year, description, imageURL, latitude DECIMAL(10, 6), longitude DECIMAL(10, 6)) VALUES
('Hoof Hearted Brewery and Kitchen', '850 N 4th St, Columbus, OH 43215', 2011, 'Quirky brewery & restaurant offering craft beers, inventive pub fare & a large patio.','https://images.squarespace-cdn.com/content/v1/530fa82ae4b059649e4b5d3c/1394423334322-L2RLZT2CSZEFC4S7XDTI/HHB_ROUND_flat_RGB.jpg?format=1500w', 39.980070, -82.998010),
('Wolfs Ridge Brewing', '215 N 4th St, Columbus, OH 43215', 2013, 'Modern brewpub serving a range of craft beers & elevated pub fare in a sleek, industrial setting.', 'https://i0.wp.com/www.dublinarts.org/wp-content/uploads/2016/10/WRB-Element_02LogoWolf.png?fit=2400%2C2400&ssl=1', 39.967312, -82.997353),
('Knotty Pine Brewing', '1765 W 3rd Ave, Columbus, OH 43212', 2017, 'Brewpub serving housemade craft beers & American eats in a cozy space with a woodsy vibe.', 'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1200,height=672,format=auto/https://doordash-static.s3.amazonaws.com/media/restaurant/cover_square/b3b1bcfa-578c-44fe-afbd-0e7be697a034.png',39.985340, -83.052963),
('Barleys Brewing Company', '467 N High St, Columbus, OH 43215', 1992, 'Longtime brewpub serving housemade beers & classic pub fare in a cozy, brick-walled space.', 'https://popmenucloud.com/apxqvlfc/a2ee7f33-6b54-4193-b5c1-6da023bc3221.png', 39.971920, -83.002808),
('Columbus Brewing Company', '2555 Harrison Rd, Columbus, OH 43204', 1988, 'Columbus Brewing Company is an independent craft brewery dedicated to exploring the flavors of American hops. Best known for Columbus IPA and Bodhi.', 'https://beerpulse.com/wp-content/uploads/2011/02/CBC_CMYK_square_burgandy_sm.png', 39.967640, -83.069710),
('Olentangy River Brewing Company', '303 Green Meadows Dr S, Lewis Center, OH 43035', 2008, 'Olentangy River Brewing Company, nestled in Ohio, offers a vibrant array of handcrafted brews, reflecting the regions spirit and heritage, all within a welcoming and community-focused atmosphere.', 'https://images.squarespace-cdn.com/content/v1/6192e85d8c6bc27fc2530eec/473350b2-03fb-4fd4-855e-2783d465337c/Logo_Badge.png?format=1500w', 40.155400, -83.012510),
('Thunderwing Brewing Company', '2419 Scioto Harper Dr, Columbus, OH 43204', 2023, 'Thunderwing Brewing is an American Craft brewery which is operating out of the west side of Columbus . Focusing on a wide variety of offerings, from light easy drinkers, to dark robust ales with plenty of hoppy options as well!', 'https://thunderwingbrewing.com/wp-content/uploads/2023/07/ThunderWing-Full-1.png', 39.967010, -83.066930),
('Seventh Son Brewing Co', '1101 N 4th St, Columbus, OH 43201', 2013, 'Comfortable tap room and patio with a rotating schedule of food trucks. Since April of 2013 Seventh Son has brewed over 225 different beers and has been consistently voted Columbus best brewery', 'https://drinkupcolumbus.com/wp-content/uploads/2012/04/seventh-son.png', 39.985329, -82.999649);

-- INSERT beer
INSERT INTO beer (name, brewery_id, style, abv, ibu, description, imageURL) VALUES
('60$ Nachos', 1, 'Double IPA', 8.0, 80, 'Intensely hoppy ale with a bold bitterness and tropical fruit flavors.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/american-india-pale-ale.jpg',
('$120 Nachos', 1, 'Triple IPA', 12, 80, 'Triple Dry-Hopped Triple IPA with Citra Hops', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/imperial-india-pale-ale.jpg'),
('Fitness Freak', 1, 'Berliner Weisse', 4.0, 5, 'Tart and refreshing wheat beer with a clean, crisp finish.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/berliner-style-weisse.jpg'),
('Belloq', 1, 'Stout with Coffee and Vanilla', 4.2, 10, 'Smooth caramel & chocolate notes get a massive coffee rogering. Competitively intellectual flavor that makes you feel smarter than you look.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/coffee-beer.jpg',
('Club Paradise', 1, 'Sour Ale', 8, 20, 'Our Rotating Tiki Cocktail Inspired Sour IPA brewed with Fruit Purée, Vanilla & Milk Sugar', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/honey-beer.jpg'),
('Are we Having Fun Yet?', 1, 'American Pale Ale', 6, 35, 'Double dry-hopped with Belma, Citra & Mosaic, this pillowy soft ale delivers massive notes of strawberry, melon & papaya.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/english-style-pale-ale-esb.jpg'),

('Dire Wolf', 2, 'Porter', 10.5, 35, 'Smooth and velvety ale with notes of roasted malt, dark chocolate, and a hint of smoke.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/robust-porter.jpg'),
('Daybreak', 2, 'Coffee Vanilla Cream Ale', 5, 14, 'Light-bodied brilliant clarity iced coffee beer.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/coffee-beer.jpg'),
('Wolfs Ridge Brewery IPA', 2, 'American IPA', 6.8, 70, 'This year-round unfiltered American IPA is all about the hops in every way. Layered hopping techniques provide a perfect balance of hop flavor, aroma, and bitterness, ranging from tropical citrus fruit to hints of sticky pine.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/american-india-pale-ale.jpg'),
('Hazy IPA', 2, 'Hazy IPA', 6.5, 25, 'Our new core Hazy IPA is all about the hops, featuring Simcoe and Mosaic for classic citrus and pine flavors, as well as late-addition Cryo Amarillo for an extra aromatic punch of tropical fruit and berry. A soft, pillowy mouthfeel keeps our Hazy from imparting too much lingering bitterness, a perfectly balanced brew to enjoy for any occasion, any time of year!', 'http://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/new-england-ipa.jpg'),
('Walking Taco', 2, 'Mexican-style Lager with Lime', 4.5, 9,'A classic Mexican brew gets the Midwestern treatment! Like tasty tacos crunched up in your favorite bag of chips, our Mexican-style lager with lime is sure to be a crushable crowd pleaser for any occasion. Whether you’re on the go or posted up on a patio, there’s nothing like a Walking Taco!', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/german-style-kolsch.jpg'),
('Dream Boat', 2, 'Oatmeal Stout', 5.2, 21, 'How do you make a "dreamy" stout?  Just add oats! We took a classic stout recipe and brewed it with 800 lbs of flaked oats, providing an ultra creamy body and smooth mouthfeel. Rich flavors of bakers chocolate and coffee will gently float along your palate; one sip is all it takes to fall in love!', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/irish-style-dry-stout.jpg'),


('Knotty Pine Amber Ale', 3, 'Amber Ale', 5.5, 20, 'A moderate, hoppy beer with a distinct caramel malty flavor.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/american-amber-lager.jpg', 2),
('Knotty Pine Jays', 3, 'German Pils', 4.5, 10, 'Light, crisp, maltiness and a clean heady finish are just a taste of what to expect from "Jays" German Lager', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/vienna-style-lager.jpg'),
('Knotty Pine Drip So Hard', 3, 'American Porter', 5.8, 35, 'The "Drip so Hard" Coffee Porter is a smooth drinking porter with an abundance of coffee notes throughout and a delicious chocolate finish.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/smoke-porter.jpg'),
('Knotty Pine Seren-DIPA-ty', 3, 'Double IPA', 8.2, 20, 'An intensely hoppy pale ale with minimal malt character, designed to showcase its strong hop flavors.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/imperial-india-pale-ale.jpg'),
('Knotty Pine Lite', 3, 'American Lite Lager', 5, 10, 'A low calorie and a low alcohol craft brew thats light tasting and perfect game day drinking.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/session-beer.jpg'),
('Knotty Pine One More', 3, 'American Pale Ale', 4.5, 10, 'A moderate, refreshing ale with noticeable hop aroma balanced by supporting malt flavors.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/english-style-pale-ale-esb.jpg'),

('Wild Card Saison', 4, 'Saison', 6.1, 25, 'Wild Card is a hazy pale orange French farmhouse style ale brewed with a kiss of cardamom. Calais yeast produces fruity, peppery esters that play well with the piney, fruity spice,', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/honey-beer.jpg'),
('Imperial Stout', 4, 'Stout', 7.6, 35, 'Dark and roasty ale with flavors of coffee, chocolate, and a hint of smoke.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/specialty-beer.jpg', 4),
('Bourbon Meyer Buckeye Stout (Tulip)',  4, 'Stout', 9.6, 40, 'BMBS starts with our Russian Imperial Stout at its base. We age it in wet bourbon barrels and add organic cacao nib and peanut butter.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/specialty-beer.jpg'),
('Rye Eye Eye IIPA', 4, 'Double IPA', 8.2, 15, 'This golden Double IPAs mash bill includes a copious amount of American rye, which contributes notes of spice and dill. The bulk of the mash is Pale Ale malt from Montana with a smidgen of toasted malt to emphasize the bready malt flavor.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/imperial-india-pale-ale.jpg'),
('Hazy Odyssey', 4, 'Juicy/ Hazy IPA', 6, 15, 'Barleys take on the juicy/hazy IPA that has a pleasant hop profile evoking flavors of mango and pineapple with a slight bitterness that is mellowed by the addition of lactose.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/california-common.jpg'),
('Frost Hop Cold IPA', 4, 'Crisp IPA', 7.4, 10, 'This super crisp IPA is piney, spicy, and bursting with citrus. Liam, Barleys Assistant Brewer, suggested we brew our first Cold IPA and include resinous Chinook hops paired with Citra and Mosaic.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/american-india-pale-ale.jpg'),


('Bodhi', 5, 'Double IPA', 8.5, 80, 'Bodhi is a classic double IPA from Columbus Brewing Company, known for its bold hop flavors and citrusy aroma.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/imperial-india-pale-ale.jpg'),
('Creeper', 5, 'Imperial Stout', 10.2, 65, 'Creeper is a rich and robust imperial stout brewed by Columbus Brewing Company, featuring notes of chocolate, coffee, and caramel.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/chocolate-beer.jpg'),
('Devils Kush', 5, 'IPA', 6.66, 15, 'The king of the dank side—Devils Kush brings the hops through a blend of Pacific Northwest hops including Simcoe, Idaho 7, Strata and Chinook. It is intensely hoppy with subtle notes of citrus and tropical fruit backed up by a sinister 6.66% ABV.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/american-india-pale-ale.jpg'),
('Columbus Lager', 5, 'Lager', 4.6, 18, 'Columbus Lager is an instant classic. The 2022 World Beer Cup Bronze winner pours with a timeless, bright golden hue with a lofty white head. A clean and crisp beer with each element working in perfect harmony, which retains the history and tradition of the style.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/german-style-kolsch.jpg'),
('Nug Wizard', 5, 'Experimental IPA', 7.6, 22, '5 nugs to rule them all! Nug Wizard is a magical brew featuring a 5-hop alchemy of experimental varieties that rain down notes of citrus and stone fruit.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/american-india-pale-ale.jpg', 2),
('Margarita Playa', 5, 'Tart Ale with Lime and Salt', 4.6, 7, 'A refreshing, tart ale to put you in vacation mode. Every sip of Margarita Playa tastes like the perfect beach day with aromas of freshly-squeezed margarita and salty ocean air. Brewed with lime concentrate and salt, it resembles the bright sunshine and refreshes your taste buds.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/vienna-style-lager.jpg'),

('Susie', 6, 'New England IPA', 7, 37, 'Juicy hazy New England IPA with prominent notes of grapefruit', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/new-england-ipa.jpg'),
('Belgian Aloha', 6, 'Belgian Tripel', 9.6, 28, 'Brewed with Hibiscus with a floral flavor reminiscent of rose wine. 2019 Ohio Craft Brewers Cup Medal Winner', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/belgian-style-quadrupel.jpg'),
('Alum Creek', 6, 'Beach Blonde', 5.4, 27, 'Refreshing and crisp Blonde Ale. Perfect for a hot day or casual drinking.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/belgian-style-saison.jpg'),
('Dustys Done Deal', 6, 'Double New England IPA', 9.2, 47, 'Delicious hazy IPA that is light in flavor and body. Careful this ones sneaky.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/new-england-ipa.jpg'),
('Roosevelt Coffee Stout', 6, 'Coffee Stout', 5.5, 20, 'This beer is light in body and brewed with Olentangy River Brewing Companys cold brew concentrate. *Does contain a bit of caffiene.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/american-imperial-stout.jpg'),
('Ol n Tangy Classico', 6, 'Gose', 4.8, 25, 'A crisp tart sour brewed with salt made to be very refreshing. One that you can always come back to.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/american-sour.jpg'),

('Anchors Up', 7, 'California Common', 5.2, 37, 'SET SAIL! Biscuit & Caramel with herbal & minty hops. LEGENDARY!', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/california-common.jpg'),
('Bolt', 7, 'Golden Ale', 5.8, 19, 'ELECTRIC! Light, Crisp and Refreshing. TAKE CHARGE!', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/honey-beer.jpg'),
('Arise', 7, 'American IPA', 6.7, 66, 'FIND PASSION! Abundant Citrus and Tropical Fruit. RISE UP!', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/american-india-pale-ale.jpg'),
('Starseed', 7, 'Hazy IPA', 6.8, 42, 'DEFY GRAVITY! Tropical and Citrus Atoms Collide. WELCOME TO THE STARS!', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/belgian-style-saison.jpg'),
('Midnight Ride', 7, 'American Stout', 6.5, 40, 'SADDLE UP! A Bold Blend of Dark Chocolate and Coffee Notes. DRINK THE MOON!', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/irish-style-dry-stout.jpg'),
('Blackbird', 7, 'Blackberry Wheat', 5.56, 20, 'STAY CALM and BRAMBLE ON!', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/belgian-style-wit.jpg'),

('Proliferous', 8, 'Double IPA', 8.3, 26, '','https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/american-india-pale-ale.jpg'),
('Seventh Son', 8, 'Strong Ale', 7.7, 33, '', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/belgian-style-golden-strong-ale.jpg'),
('Kitty Paw', 8, 'Hard Seltzer', 4.2, 0, '', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/german-style-schwarzbier.jpg'),
('Assistant Manager', 8, 'Golden Ale', 5.2, 22, '', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/blonde-ale.jpg'),
('The Scientist', 8, 'IPA', 7, 27, '', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/american-india-pale-ale.jpg'),
('Oubliette', 8, 'Imperial Stout', 12, 33, '','https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/specialty-beer.jpg');

COMMIT TRANSACTION;
