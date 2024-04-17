BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

-- INSERT brewery

INSERT INTO brewery (name, location, established_year, description, imageURL, mapURL, longitude, latitude) VALUES
('Hoof Hearted Brewery and Kitchen', '850 N 4th St, Columbus, OH 43215', 2011, 'Quirky brewery & restaurant offering craft beers, inventive pub fare & a large patio.','https://images.squarespace-cdn.com/content/v1/530fa82ae4b059649e4b5d3c/1394423334322-L2RLZT2CSZEFC4S7XDTI/HHB_ROUND_flat_RGB.jpg?format=1500w', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3057.251963376068!2d-83.00065082419543!3d39.98047427151304!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88388ed3fe9f69d1%3A0x1fb02f69eba443e1!2sHoof%20Hearted%20Brewery%20and%20Kitchen!5e0!3m2!1sen!2sus!4v1713208195595!5m2!1sen!2sus',CAST(-82.998009 AS DECIMAL(10, 6)),CAST(39.980068 AS DECIMAL(10, 6))),
('Wolfs Ridge Brewing', '215 N 4th St, Columbus, OH 43215', 2013, 'Modern brewpub serving a range of craft beers & elevated pub fare in a sleek, industrial setting.', 'https://i0.wp.com/www.dublinarts.org/wp-content/uploads/2016/10/WRB-Element_02LogoWolf.png?fit=2400%2C2400&ssl=1','https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d24462.52699608176!2d-83.05841504181831!3d39.96786917694444!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88388f2c353c2bdd%3A0x28b696ba7106a90!2sWolf;s%20Ridge%20Brewing!5e0!3m2!1sen!2sus!4v1713208249245!5m2!1sen!2sus',CAST(-82.997353 AS DECIMAL(10, 6)) ,CAST(39.967312 AS DECIMAL(10, 6))),
('Knotty Pine Brewing', '1765 W 3rd Ave, Columbus, OH 43212', 2017, 'Brewpub serving housemade craft beers & American eats in a cozy space with a woodsy vibe.', 'https://img.cdn4dd.com/cdn-cgi/image/fit=contain,width=1200,height=672,format=auto/https://doordash-static.s3.amazonaws.com/media/restaurant/cover_square/b3b1bcfa-578c-44fe-afbd-0e7be697a034.png', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3057.037201431978!2d-83.05552092419516!3d39.98527397151228!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88388e492fe8207f%3A0xde42b5db95f33551!2sKnotty%20Pine%20Brewing!5e0!3m2!1sen!2sus!4v1713208298094!5m2!1sen!2sus', CAST(-83.052963 AS DECIMAL(10, 6)), CAST(39.985340 AS DECIMAL(10, 6))),
('Barleys Brewing Company', '467 N High St, Columbus, OH 43215', 1992, 'Longtime brewpub serving housemade beers & classic pub fare in a cozy, brick-walled space.', 'https://popmenucloud.com/apxqvlfc/a2ee7f33-6b54-4193-b5c1-6da023bc3221.png', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3057.6351409227395!2d-83.00547072419586!3d39.9719094715146!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88388f289220bced%3A0xea496178b8e8bce6!2sBarley;s%20Brewing%20Company!5e0!3m2!1sen!2sus!4v1713208843827!5m2!1sen!2sus', CAST(-83.002808 AS DECIMAL(10, 6)) , CAST(39.971920 AS DECIMAL(10, 6))),
('Columbus Brewing Company', '2555 Harrison Rd, Columbus, OH 43204', 1988, 'Columbus Brewing Company is an independent craft brewery dedicated to exploring the flavors of American hops. Best known for Columbus IPA and Bodhi.', 'https://beerpulse.com/wp-content/uploads/2011/02/CBC_CMYK_square_burgandy_sm.png', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d48925.377467960294!2d-83.14548385136723!3d39.96741719999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88388fdac1305edb%3A0x6a88bcef9bbd49e4!2sColumbus%20Brewing%20Company!5e0!3m2!1sen!2sus!4v1713208929788!5m2!1sen!2sus',CAST(-83.069710 AS DECIMAL(10, 6)) ,CAST(39.967640 AS DECIMAL(10, 6))),
('Olentangy River Brewing Company', '303 Green Meadows Dr S, Lewis Center, OH 43035', 2008, 'Olentangy River Brewing Company, nestled in Ohio, offers a vibrant array of handcrafted brews, reflecting the regions spirit and heritage, all within a welcoming and community-focused atmosphere.', 'https://images.squarespace-cdn.com/content/v1/6192e85d8c6bc27fc2530eec/473350b2-03fb-4fd4-855e-2783d465337c/Logo_Badge.png?format=1500w', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3049.409447249634!2d-83.0150228241863!3d40.1554365714828!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8838f395ceefffff%3A0xb4503eb1b1af7c54!2sOlentangy%20River%20Brewing%20Company!5e0!3m2!1sen!2sus!4v1713208993035!5m2!1sen!2sus', CAST(-83.012510 AS DECIMAL(10, 6)) , CAST(40.155400 AS DECIMAL(10, 6))),
('Thunderwing Brewing Company', '2419 Scioto Harper Dr, Columbus, OH 43204', 2023, 'Thunderwing Brewing is an American Craft brewery which is operating out of the west side of Columbus . Focusing on a wide variety of offerings, from light easy drinkers, to dark robust ales with plenty of hoppy options as well!', 'https://thunderwingbrewing.com/wp-content/uploads/2023/07/ThunderWing-Full-1.png', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3057.8617100103256!2d-83.06951082419613!3d39.96684447151542!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88388fbcd3b4a447%3A0xa2ff98361ecd063d!2sThunderwing%20Brewing!5e0!3m2!1sen!2sus!4v1713209034839!5m2!1sen!2sus', CAST(39.967010 AS DECIMAL(10, 6)), CAST(-83.066930 AS DECIMAL(10, 6))),
('Seventh Son Brewing Co', '1101 N 4th St, Columbus, OH 43201', 2013, 'Comfortable tap room and patio with a rotating schedule of food trucks. Since April of 2013 Seventh Son has brewed over 225 different beers and has been consistently voted Columbus best brewery', 'https://drinkupcolumbus.com/wp-content/uploads/2012/04/seventh-son.png', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3057.0332189361166!2d-83.00226972419512!3d39.985362971512195!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88388ece1e570549%3A0x76d37b7748664e44!2sSeventh%20Son%20Brewing%20Co.!5e0!3m2!1sen!2sus!4v1713209098885!5m2!1sen!2sus', CAST(-82.999649 AS DECIMAL(10, 6)) , CAST(39.985329 AS DECIMAL(10, 6)));

-- INSERT beer
INSERT INTO beer (name, brewery_id, style, abv, ibu, description, imageURL) VALUES
('$60 Nachos', 1, 'Double IPA', 8.0, 80, 'Intensely hoppy ale with a bold bitterness and tropical fruit flavors.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/american-india-pale-ale.jpg'),
('$120 Nachos', 1, 'Triple IPA', 12, 80, 'Triple Dry-Hopped Triple IPA with Citra Hops', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/imperial-india-pale-ale.jpg'),
('Fitness Freak', 1, 'Berliner Weisse', 4.0, 5, 'Tart and refreshing wheat beer with a clean, crisp finish.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/berliner-style-weisse.jpg'),
('Belloq', 1, 'Stout with Coffee and Vanilla', 4.2, 10, 'Smooth caramel & chocolate notes get a massive coffee rogering. Competitively intellectual flavor that makes you feel smarter than you look.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/coffee-beer.jpg'),
('Club Paradise', 1, 'Sour Ale', 8, 20, 'Our Rotating Tiki Cocktail Inspired Sour IPA brewed with Fruit Purée, Vanilla & Milk Sugar', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/honey-beer.jpg'),
('Are we Having Fun Yet?', 1, 'American Pale Ale', 6, 35, 'Double dry-hopped with Belma, Citra & Mosaic, this pillowy soft ale delivers massive notes of strawberry, melon & papaya.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/english-style-pale-ale-esb.jpg'),

('Dire Wolf', 2, 'Porter', 10.5, 35, 'Smooth and velvety ale with notes of roasted malt, dark chocolate, and a hint of smoke.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/robust-porter.jpg'),
('Daybreak', 2, 'Coffee Vanilla Cream Ale', 5, 14, 'Light-bodied brilliant clarity iced coffee beer.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/coffee-beer.jpg'),
('Wolfs Ridge Brewery IPA', 2, 'American IPA', 6.8, 70, 'This year-round unfiltered American IPA is all about the hops in every way. Layered hopping techniques provide a perfect balance of hop flavor, aroma, and bitterness, ranging from tropical citrus fruit to hints of sticky pine.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/american-india-pale-ale.jpg'),
('Hazy IPA', 2, 'Hazy IPA', 6.5, 25, 'Our new core Hazy IPA is all about the hops, featuring Simcoe and Mosaic for classic citrus and pine flavors, as well as late-addition Cryo Amarillo for an extra aromatic punch of tropical fruit and berry. A soft, pillowy mouthfeel keeps our Hazy from imparting too much lingering bitterness, a perfectly balanced brew to enjoy for any occasion, any time of year!', 'http://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/new-england-ipa.jpg'),
('Walking Taco', 2, 'Mexican-style Lager with Lime', 4.5, 9,'A classic Mexican brew gets the Midwestern treatment! Like tasty tacos crunched up in your favorite bag of chips, our Mexican-style lager with lime is sure to be a crushable crowd pleaser for any occasion. Whether you’re on the go or posted up on a patio, there’s nothing like a Walking Taco!', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/german-style-kolsch.jpg'),
('Dream Boat', 2, 'Oatmeal Stout', 5.2, 21, 'How do you make a "dreamy" stout?  Just add oats! We took a classic stout recipe and brewed it with 800 lbs of flaked oats, providing an ultra creamy body and smooth mouthfeel. Rich flavors of bakers chocolate and coffee will gently float along your palate; one sip is all it takes to fall in love!', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/irish-style-dry-stout.jpg'),

('Knotty Pine Amber Ale', 3, 'Amber Ale', 5.5, 20, 'A moderate, hoppy beer with a distinct caramel malty flavor.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/american-amber-lager.jpg'),
('Knotty Pine Jays', 3, 'German Pils', 4.5, 10, 'Light, crisp, maltiness and a clean heady finish are just a taste of what to expect from "Jays" German Lager', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/vienna-style-lager.jpg'),
('Knotty Pine Drip So Hard', 3, 'American Porter', 5.8, 35, 'The "Drip so Hard" Coffee Porter is a smooth drinking porter with an abundance of coffee notes throughout and a delicious chocolate finish.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/smoke-porter.jpg'),
('Knotty Pine Seren-DIPA-ty', 3, 'Double IPA', 8.2, 20, 'An intensely hoppy pale ale with minimal malt character, designed to showcase its strong hop flavors.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/imperial-india-pale-ale.jpg'),
('Knotty Pine Lite', 3, 'American Lite Lager', 5, 10, 'A low calorie and a low alcohol craft brew thats light tasting and perfect game day drinking.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/session-beer.jpg'),
('Knotty Pine One More', 3, 'American Pale Ale', 4.5, 10, 'A moderate, refreshing ale with noticeable hop aroma balanced by supporting malt flavors.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/english-style-pale-ale-esb.jpg'),

('Wild Card Saison', 4, 'Saison', 6.1, 25, 'Wild Card is a hazy pale orange French farmhouse style ale brewed with a kiss of cardamom. Calais yeast produces fruity, peppery esters that play well with the piney, fruity spice,', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/honey-beer.jpg'),
('Imperial Stout', 4, 'Stout', 7.6, 35, 'Dark and roasty ale with flavors of coffee, chocolate, and a hint of smoke.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/specialty-beer.jpg'),
('Bourbon Meyer Buckeye Stout (Tulip)',  4, 'Stout', 9.6, 40, 'BMBS starts with our Russian Imperial Stout at its base. We age it in wet bourbon barrels and add organic cacao nib and peanut butter.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/specialty-beer.jpg'),
('Rye Eye Eye IIPA', 4, 'Double IPA', 8.2, 15, 'This golden Double IPAs mash bill includes a copious amount of American rye, which contributes notes of spice and dill. The bulk of the mash is Pale Ale malt from Montana with a smidgen of toasted malt to emphasize the bready malt flavor.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/imperial-india-pale-ale.jpg'),
('Hazy Odyssey', 4, 'Juicy/ Hazy IPA', 6, 15, 'Barleys take on the juicy/hazy IPA that has a pleasant hop profile evoking flavors of mango and pineapple with a slight bitterness that is mellowed by the addition of lactose.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/california-common.jpg'),
('Frost Hop Cold IPA', 4, 'Crisp IPA', 7.4, 10, 'This super crisp IPA is piney, spicy, and bursting with citrus. Liam, Barleys Assistant Brewer, suggested we brew our first Cold IPA and include resinous Chinook hops paired with Citra and Mosaic.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/american-india-pale-ale.jpg'),

('Bodhi', 5, 'Double IPA', 8.5, 80, 'Bodhi is a classic double IPA from Columbus Brewing Company, known for its bold hop flavors and citrusy aroma.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/imperial-india-pale-ale.jpg'),
('Creeper', 5, 'Imperial Stout', 10.2, 65, 'Creeper is a rich and robust imperial stout brewed by Columbus Brewing Company, featuring notes of chocolate, coffee, and caramel.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/chocolate-beer.jpg'),
('Devils Kush', 5, 'IPA', 6.66, 15, 'The king of the dank side—Devils Kush brings the hops through a blend of Pacific Northwest hops including Simcoe, Idaho 7, Strata and Chinook. It is intensely hoppy with subtle notes of citrus and tropical fruit backed up by a sinister 6.66% ABV.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/american-india-pale-ale.jpg'),
('Columbus Lager', 5, 'Lager', 4.6, 18, 'Columbus Lager is an instant classic. The 2022 World Beer Cup Bronze winner pours with a timeless, bright golden hue with a lofty white head. A clean and crisp beer with each element working in perfect harmony, which retains the history and tradition of the style.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/german-style-kolsch.jpg'),
('Nug Wizard', 5, 'Experimental IPA', 7.6, 22, '5 nugs to rule them all! Nug Wizard is a magical brew featuring a 5-hop alchemy of experimental varieties that rain down notes of citrus and stone fruit.', 'https://www.craftbeer.com/wp-content/uploads/_SF/thumbnails/american-india-pale-ale.jpg'),
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

INSERT INTO reviews (beer_id, reviewer, review, rating) VALUES
(1, 'HopHead87', 'As a dedicated hop lover, I was eager to try the $60 Nachos Double IPA, and it did not disappoint!', 4.0),
(1, 'TheHoppyEnding', 'The taste follows suit, with a bold hoppy flavor that is balanced by a smooth malt backbone. It is refreshing and satisfying, perfect for a sunny afternoon.', 4.0),
(1, 'SourAleSipper67', 'The aroma is almost non-existent, with a faint hint of stale grains. The taste is equally lackluster, with no discernible flavor other than a vague sweetness that quickly fades into nothingness. Save your money and skip this one.', 1.0),
(2, 'BrewEnthusiast92', 'It pours a murky yellow with an off-putting aroma of spoiled fruit and wet cardboard.', 1.0),
(2, 'BeerlyBeloved', 'It is dangerously drinkable for its ABV, and I can not help but savor every sip.', 5.0),
(2, 'AleInWonderland', 'This beer pours a deep mahogany with a creamy tan head. The aroma is a heavenly blend of roasted malts and sweet vanilla, inviting you in for a sip.', 5.0),
(3, 'SourAleSipper67', 'Stouty McStoutface is a stout lovers dream come true!', 3.0),
(3, 'HopsAndDreams', 'While I appreciate a good funky beer, this one misses the mark entirely.', 2.0),
(3, 'BeerlyBeloved', 'The aroma is rich and roasty, with hints of chocolate and coffee. The taste is equally impressive, with layers of dark chocolate, espresso, and a subtle bitterness that balances it all out.', 1.0),
(4, 'CraftyDrinker22', 'There is no balance or nuance here, just a blunt taste of bitterness. I would not recommend this beer to anyone.', 2.0),
(4, 'BrewedAwakening', 'Tropical Thunder IPA is a tropical explosion of flavor!', 4.0),
(4, 'AleInWonderland', 'It is like drinking a glass of vinegar mixed with old gym socks. Avoid at all costs.', 2.0),

(7, 'LagerMcLovin97', 'This beer should come with a warning label: May induce gag reflex. It is a crime against taste buds everywhere.', 1.0),
(7, 'BrewedAwakening', 'I have had better beverages from a stagnant puddle. Drinking this beer was like licking the floor of a dive bar after a frat party.', 2.0),
(7, 'AleInWonderland', 'I have never been more disappointed in a beer in my life. It is like they bottled disappointment and labeled it as beer. I would rather drink my own tears than take another sip of this garbage.', 1.0),
(8, 'BeerlyBeloved', 'The light body and clarity were fine, but they could not compensate for the lack of flavor. Not terrible, but definitely not worth seeking out.', 3.0 ),
(8, 'Hoptimistic', 'Daybreak was a letdown from start to finish. The promise of a light-bodied iced coffee beer sounded intriguing, but the execution fell flat.', 2.0 ),
(8, 'LagerMcLovin97', 'I had high hopes for Daybreak, but it failed to deliver. The idea of combining coffee with beer sounded intriguing, but the reality was lackluster.', 2.0 ),
(9, 'BrewskiBear', 'The balance of flavors is spot on, with just the right amount of bitterness to keep things interesting.', 4.0),
(9, 'AleInWonderland', 'Impressive IPA from Wolfs Ridge Brewery! This beer showcases a masterful blend of hop flavors and aromas. From the tropical citrus notes to the subtle undertones of pine, each sip is a journey of flavor.', 4.0),
(9, 'BrewedAwakening', 'It is refreshing enough to enjoy on a hot summer day yet complex enough to satisfy even the most discerning palate. Well done!', 4.0),

(13, 'Brewbacca', 'Knotty Pine Amber Ale hits the mark with its balance of hoppy bitterness and caramel malt sweetness. The flavors complement each other nicely, creating a beer that is both refreshing and satisfying.', 5.0 ),
(13, 'AleInWonderland', 'Whether you are a seasoned beer enthusiast or just looking to try something new, this beer will not disappoint.', 3.0 ),
(13, 'Hoptimistic', 'The caramel malty flavor adds a nice richness to the beer, while the hoppy notes provide a pleasant bitterness that keeps things interesting. ', 5.0 ),
(14, 'Brewbacca', 'Do yourself a favor and steer clear unless you enjoy disappointment in a bottle.', 1.0),
(14, 'BarleyQuinn', 'Knotty Pine Jays German Lager did not quite live up to its promise. While it is certainly refreshing with its light and crisp profile, the maltiness was disappointingly subdued.', 2.0),
(14, 'LagerMcLovin97', 'While it may appeal to those who prefer a lighter lager, it did not leave a lasting impression on my palate.', 2.0),
(15, 'BrewskiBear', 'Knotty Pine Drip So Hard is a true gem in the world of porters. Its rich coffee aroma draws you in, while the smooth, velvety texture and subtle chocolate undertones keep you coming back for more. A deliciously satisfying brew!', 4.0),
(15, 'BarleyQuinn', 'Smooth on the palate, it offers a comforting warmth with each sip. A perfect choice for those cozy nights by the fire.', 3.0),
(15, 'BrewskiBear', 'Congratulations to the brewery for creating a beer that manages to offend every sense. It smells like a skunks backside, tastes like regret, and leaves a lingering aftertaste of despair.', 1.0),

(19, 'Brewbacca', '', 5.0 ),
(19, 'Brewbacca', 'I have never been more disappointed in a beer in my life. It is like they bottled disappointment and labeled it as beer. I would rather drink my own tears than take another sip of this garbage.', 1.0 ),
(19, 'Brewbacca', '', 5.0 ),
(20, 'Brewbacca', 'It is like they scraped the bottom of the barrel and bottled it. Do yourself a favor and avoid this dumpster juice at all costs.', 2.0 ),
(20, 'Brewbacca', '', 5.0 ),
(20, 'Brewbacca', '', 5.0 ),
(21, 'Brewbacca', '', 5.0 ),
(21, 'Brewbacca', '', 5.0 ),
(21, 'Brewbacca', '', 5.0 );


INSERT INTO brewery_images (brewery_id, image_url) VALUES
(1, 'https://i.ytimg.com/vi/szglL4L4Zxw/maxresdefault.jpg'),
(1, 'https://resizer.otstatic.com/v2/photos/wide-huge/2/26171120.jpg'),
(1, 'https://cdn.columbusunderground.com/wp-content/uploads/2016/02/hoof-hearted-01.jpg'),

(2, 'https://media-cdn.tripadvisor.com/media/photo-s/15/73/f2/88/storefront.jpg'),
(2, 'https://i0.wp.com/ohiocraftbeer.org/wp-content/uploads/2015/11/Header_WolfRidge3.jpg?fit=800%2C533&ssl=1'),
(2, 'https://images.squarespace-cdn.com/content/v1/5eb095c59e8905404744a7b9/1600707117058-90FW815G1H57GZKLAONO/image-asset.jpeg'),

(3, 'https://i.ytimg.com/vi/IzW51YGN_Bs/hqdefault.jpg'),
(3, 'https://media-cdn.tripadvisor.com/media/photo-s/12/bb/79/3c/1524529469233-largejpg.jpg'),
(3, 'https://www.columbusmonthly.com/gcdn/authoring/2015/07/01/NCOA/ghows-OH-207953c2-bb9f-449a-992b-7ed533b559bf-943d0844.jpeg'),

(4, 'https://i0.wp.com/ohiocraftbeer.org/wp-content/uploads/2015/11/barleys_header2.jpg?fit=800%2C533&ssl=1'),
(4, 'https://www.scootersbars.com/wp-content/uploads/2016/07/1136_1.jpg'),
(4, 'https://popmenucloud.com/cdn-cgi/image/width%3D600%2Cheight%3D600%2Cfit%3Dscale-down%2Cformat%3Dauto%2Cquality%3D60/apxqvlfc/1d8bb0e8-0738-4967-b8ac-8a54718d2802.jpg'),

(5, 'https://breakfastwithnick.com/wp-content/uploads/cbc-beer-hall-13.jpeg'),
(5, 'https://breakfastwithnick.com/wp-content/uploads/cbc-beer-hall-8.jpeg'),
(5, 'https://images.squarespace-cdn.com/content/v1/5267e4e1e4b0cdd9f1919db3/1683730150399-U02R3NM6EFKG67RNZ93C/Bar+view.jpg'),

(6, 'https://media-cdn.tripadvisor.com/media/photo-s/1c/a1/e7/33/view-of-lovely-taproom.jpg'),
(6, 'https://www.oxstudioinc.com/wp-content/uploads/2019/01/20181211_ccs_orb_ext_428-2_hdr.jpg'),
(6, 'https://cdn7.localdatacdn.com/oh/lewis-center/4944215/original/k0g2y5yBn7.jpg'),

(7, 'https://ohio.org/static/uploads/0688y00000B9fWRAAZ.jpg'),
(7, 'https://patspints.files.wordpress.com/2023/10/psx_20231004_173134.jpg?w=1024'),
(7, 'https://thunderwingbrewing.com/wp-content/uploads/2023/10/Social.jpg'),

(8, 'https://images.squarespace-cdn.com/content/v1/51abeb0be4b08f6a770c06bf/1650313359131-8VZDS8MZODE3WUBB2QKC/DSCF3526.jpg'),
(8, 'https://images.squarespace-cdn.com/content/v1/51abeb0be4b08f6a770c06bf/1650313354278-V0THO8EZ1OVNRCJKM74P/DSCF2933.JPG'),
(8, 'https://www.columbusmonthly.com/gcdn/authoring/2016/03/30/NCOA/ghows-OH-ca7b932f-77fb-4c72-88f0-fbef83175097-3a284ac9.jpeg?width=1200&disable=upscale&format=pjpg&auto=webp');
COMMIT TRANSACTION;
