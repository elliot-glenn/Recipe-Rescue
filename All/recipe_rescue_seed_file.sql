
-- Drop Bridge tables first
DROP TABLE IF EXISTS store_ingr;
DROP TABLE IF EXISTS store_uten;
DROP TABLE IF EXISTS ingr_recipe;
DROP TABLE IF EXISTS uten_recipe;

-- Now primary tables
DROP TABLE IF EXISTS store;
DROP TABLE IF EXISTS ingredient;
DROP TABLE IF EXISTS utensil;
DROP TABLE IF EXISTS recipe;



-- Now create all the tables
-- Primary Tables Creation
CREATE TABLE ingredient 
(
	ing_id INT(5) NOT NULL, -- ingredient id
    ing_name VARCHAR(25) NOT NULL, -- ingredient name
    dep_name VARCHAR(25) NOT NULL, -- department you will find the ingredient in
    vegan BOOL,
    gluten_free BOOL,
    vegetarian BOOL,
    oz_per_unit DOUBLE -- ounces per unit
);
CREATE TABLE store(
    store_id int(5) NOT NULL,
    store_name varchar(60) NOT NULL,
    addr_num int(6), -- can be null, since it can be an online food service
    st_name varchar(20),
    city varchar(58)
);
CREATE TABLE utensil(
	uten_id INT(5) NOT NULL,
	uten_name VARCHAR(30) NOT NULL
);
CREATE TABLE recipe(
	recipe_id INT(6) NOT NULL,
	recipe_name VARCHAR(60) NOT NULL,
    cook_time int NOT NULL,
    instructions mediumtext NOT NULL,
    serving_size int(2)
);


-- Bridge Tables Creation
CREATE TABLE store_uten(
    store_id int(5) NOT NULL,
    uten_id int(5) NOT NULL,
    uten_price DECIMAL(6,2) NOT NULL
);
CREATE TABLE ingr_recipe(
    ing_id int(5) NOT NULL,
    recipe_id int(5) NOT NULL,
    oz DECIMAL(6,2) NOT NULL
);
CREATE TABLE store_ingr
(
	store_id INT(5), -- fk from the store table
    ing_id INT(5), -- fk from the ingredient table
    ing_price DECIMAL(6, 2) -- price of the ingredient, per unit
);
CREATE TABLE uten_recipe(
	uten_id INT(5) NOT NULL,
	recipe_id INT(6) NOT NULL
);



-- Add primary keys, foreign keys, and also convert character set to UTF8 for the recipe table, due to descriptions with special characters.
ALTER TABLE recipe CONVERT TO CHARACTER SET utf8;

-- Primary keys
ALTER TABLE utensil
   ADD CONSTRAINT uten_pk
   PRIMARY KEY (uten_id);
ALTER TABLE store
    ADD CONSTRAINT store_pk
    PRIMARY KEY (store_id);
ALTER TABLE recipe
   ADD CONSTRAINT recipe_pk
   PRIMARY KEY (recipe_id);
ALTER TABLE ingredient 
    ADD CONSTRAINT ing_pk 
    PRIMARY KEY (ing_id);



-- Bridge Table Primary keys
ALTER TABLE uten_recipe
   ADD CONSTRAINT uten_recipe_pk
   PRIMARY KEY (recipe_id, uten_id);
ALTER TABLE store_uten
    ADD CONSTRAINT store_uten_pk
    PRIMARY KEY (store_id, uten_id);
ALTER TABLE ingr_recipe
    ADD CONSTRAINT ingr_recipe_pk
    PRIMARY KEY (ing_id, recipe_id);
ALTER TABLE store_ingr 
    ADD CONSTRAINT store_ingr_pk 
    PRIMARY KEY (store_id, ing_id);



-- Bridge Table Foreign Keys
ALTER TABLE uten_recipe
   ADD CONSTRAINT uten_recipe_fk0
   FOREIGN KEY (uten_id)
   REFERENCES utensil (uten_id);
ALTER TABLE uten_recipe
   ADD CONSTRAINT uten_recipe_fk1
   FOREIGN KEY (recipe_id)
   REFERENCES recipe (recipe_id);
ALTER TABLE store_uten
   ADD CONSTRAINT store_utenfk0
   FOREIGN KEY (store_id)
   REFERENCES store(store_id);
ALTER TABLE store_uten
   ADD CONSTRAINT store_utenfk1
   FOREIGN KEY (uten_id)
   REFERENCES utensil(uten_id);
ALTER TABLE ingr_recipe
   ADD CONSTRAINT ingr_recipefk0
   FOREIGN KEY (ing_id)
   REFERENCES ingredient(ing_id);
ALTER TABLE ingr_recipe
   ADD CONSTRAINT ingr_recipefk1
   FOREIGN KEY (recipe_id)
   REFERENCES recipe(recipe_id);
ALTER TABLE store_ingr 
    ADD CONSTRAINT store_fk 
    FOREIGN KEY (store_id) 
    REFERENCES store(store_id); -- store id fk
ALTER TABLE store_ingr 
    ADD CONSTRAINT ing_pk 
    FOREIGN KEY (ing_id) 
    REFERENCES ingredient(ing_id); -- ingredient id fk



-- Insert Statements
-- Primary Tables

-- ingredient table rows/entries
INSERT INTO ingredient (ing_id, ing_name, dep_name, vegan, gluten_free, vegetarian, oz_per_unit) 
VALUES (1, "Tomato", "Produce", true, true, true, 6.0); -- range from 4-8 oz per unit
INSERT INTO ingredient (ing_id, ing_name, dep_name, vegan, gluten_free, vegetarian, oz_per_unit) 
VALUES (2, "Cheddar Cheese", "Dairy", false, true, true, 8); -- tillamook block cheese reference
INSERT INTO ingredient (ing_id, ing_name, dep_name, vegan, gluten_free, vegetarian, oz_per_unit) 
VALUES (3, "Garlic", "Produce", true, true, true, 0.2); -- 0.14 to 0.24 oz
INSERT INTO ingredient (ing_id, ing_name, dep_name, vegan, gluten_free, vegetarian, oz_per_unit) 
VALUES (4, "Crimini Mushroom", "Produce", true, true, true, 8); -- o organics baby bella reference; roughly $0.44 per ounce from albertsons
INSERT INTO ingredient (ing_id, ing_name, dep_name, vegan, gluten_free, vegetarian, oz_per_unit) 
VALUES (5, "Olive Oil", "Cooking Oil", true, true, true, 25); -- bertolli olive oil reference, $14 at walmart
INSERT INTO ingredient (ing_id, ing_name, dep_name, vegan, gluten_free, vegetarian, oz_per_unit)
VALUES (6, "Angel Hair Pasta", "Pasta", true, false, true, 16); -- de cecco pasta no.9 angel hair
INSERT INTO ingredient (ing_id, ing_name, dep_name, vegan, gluten_free, vegetarian, oz_per_unit)
VALUES (7, "Chicken", "Meat", false, true, false, 32); -- 2 lbs of skinless chicken breast
INSERT INTO ingredient (ing_id, ing_name, dep_name, vegan, gluten_free, vegetarian, oz_per_unit)
VALUES (8, "Almond Milk", "Dairy", true, false, true, 64); -- 64 oz of silk almond milk
INSERT INTO ingredient (ing_id, ing_name, dep_name, vegan, gluten_free, vegetarian, oz_per_unit)
VALUES (9, "Whole Milk", "Dairy", false, true, true, 52); -- 52 oz of whole milk from fairlife
INSERT INTO ingredient (ing_id, ing_name, dep_name, vegan, gluten_free, vegetarian, oz_per_unit)
VALUES (10, "Chicken Broth", "Soups", false, true, false, 32); -- 32 oz of broth chicken o organics
INSERT INTO ingredient (ing_id, ing_name, dep_name, vegan, gluten_free, vegetarian, oz_per_unit)
VALUES (11, "Vegetable Stock Powder", "Seasoning", true, true, true, 5.9) -- 5.9 oz of massal vegetable bouillon powder

-- Store table entries
INSERT INTO store 
VALUES (00000, 'Albertsons', 2301, 'Ashland St', 'Ashland');
INSERT INTO store 
VALUES (00001, 'Ashland''s Own Shop''n Kart', 2268, 'Ashland St', 'Ashland');
INSERT INTO store 
VALUES (00002, 'Market of Choice Ashland', 1475, 'Siskiyou Blvd', 'Ashland');
INSERT INTO store 
VALUES (00003, 'WinCo Foods', 251, 'E Barnett Rd', 'Medford');
INSERT INTO store 
VALUES (00004, 'Asia Market', 229, 'E Barnett Rd', 'Medford');
INSERT INTO store
VALUES (00005, 'Amazon', NULL, NULL, NULL);
INSERT INTO store
VALUES (00006, 'Walmart', 1360, 'Center Dr', 'Medford');

-- Utensil Entries
INSERT INTO utensil
VALUES (00000, 'Knife');
INSERT INTO utensil
VALUES (00001, 'Measuring Cups');
INSERT INTO utensil
VALUES (00002, 'Small bowl');
INSERT INTO utensil
VALUES (00003, 'Medium Bowl');
INSERT INTO utensil
VALUES (00004, 'Large Bowl');
INSERT INTO utensil
VALUES (00005, 'Spatula');
INSERT INTO utensil
VALUES (00006, 'Whisk');
INSERT INTO utensil
VALUES (00007, 'Tongs');
INSERT INTO utensil
VALUES (00008, 'Cutting Board');
INSERT INTO utensil
VALUES (00009, 'Thermometer');


-- Recipe Entries
/* chicken pot pie refference: https://www.recipetineats.com/chicken-pot-pie/#recipe */
INSERT INTO recipe
VALUES (000000, 'Chicken Pot Pie', 75, 
'Chicken:
- Place milk, broth and stock powder in a large saucepan. Bring to a very gentle simmer over medium heat, add chicken and thyme.
- Place lid on, simmer gently on medium low for 15 minutes (do not boil, can make milk split).
- Remove chicken, shred or dice (don’t worry if inside a bit uncooked). Cover pot and set poaching liquid aside.

Chicken Pot Pie:
- Melt butter in a large pot over medium high heat. Add garlic and onion, cook for 2 minutes. Add thyme, carrot and celery, cook for 3 minutes or until carrot is softened.
- Add wine. Stir, scraping the bottom of the pot, and cook for 1 1/2 minutes or until wine is mostly evaporated.
- Add flour and stir for 1 minute.
- Add about half the reserved poaching liquid and stir until all flour is incorporated – it will be a thick sludge.
- Add remaining milk broth, parmesan, pepper. Stir.
- Add chicken and peas, stir.
- Once mixture is heated (you’ll see steam), cook for 3 minutes to thicken the sauce, stirring regularly.
- Remove from heat. Spoon into oven proof pots – 4 large or 6 small (Note 4). Cool in fridge at least 30 minutes.

Assembly & Baking:
- Meanwhile, remove puff pastry from freezer to partially thaw. Then use a bowl as a guide to cut rounds from the pastry about 2.5cm / 1″ wider (all the way around) than the pots – be generous!
- Preheat oven to 180C/350F.
- Brush edge of pots with egg. Top with puff pastry, folding down the edges.
- Brush pastry with egg. Cut a 2cm / 2/3″ slide in the middle with a small knife.
- Bake 35 – 40 minutes until deep golden.
- Serve immediately!', 4);

/*Pad See Ew refference recipe: https://www.recipetineats.com/thai-stir-fried-noodles-pad-see-ew/#h-pad-see-ew */

INSERT INTO recipe
VALUES (000001, 'Pad See Ew', 10, 
'Preparation:
- Chinese Broccoli – trim ends, cut into 7.5cm/3" pieces. Separate leaves from stems. Cut thick stems in half vertically so theyre no wider than 0.8cm / 0.3" thick.
- Noodles – Prepare according to packet directions and drain. Time it so they’re cooked just before using – do not leave cooked rice noodles lying around, they break in the wok.
- Sauce – Mix ingredients until sugar dissolves.
Cooking:
- Heat oil: Heat 1 tbsp oil in a very large heavy based skillet or wok over high heat.
- Cook garlic and chicken: Add garlic, cook 15 seconds. Add chicken, cook until it mostly changes from pink to white.
- Chinese broccoli STEMS: Add Chinese broccoli stems, cook until chicken is almost cooked through.
- Chinese broccoli LEAVES: Add Chinese broccoli leaves, cook until just wilted.
- Scramble egg: Push everything to one side, crack egg in and scramble.
- REMOVE chicken from wok: Remove everything in the wok onto a plate (scrape wok clean).
- Caramelise noodles: Return wok to stove, heat 2 tbsp oil over high heat until it starts smoking (HOT is key!). Add noodles and Sauce. Toss as few times as possible to disperse Sauce and make edges of noodles caramelise – about 1 to 1 1/2 minutes.
- Add chicken back in: Quickly add chicken and veg back in, and toss to disperse. Serve immediately!', 2);

/* chocolate chip cookies recipe refference: https://www.recipetineats.com/the-chocolate-chip-cookies-of-my-dreams/ */

INSERT INTO recipe
VALUES (000002, 'Chocolate Chip Cookies', 20, 
'Browned butter:
- Simmer to brown – Put the butter in a silver saucepan or small pan over medium high heat. Once melted, let it simmer (as in, bubbling) for 4 to 5 minutes, stirring every now and then, until it gets real foamy, you see little golden specks (wade through foam to see) and it smells nutty & extra buttery.
- Cool – Immediately pour into a heatproof bowl, including all those golden specks. Cool to room temperature (~45 minutes), cool enough so it wont melt the choc chips
Dough:
- Whisk Dry ingredients in a separate bowl.
- Mix Wet – To the browned butter, add both sugars and mix with a wooden spoon. Add the egg, yolk and vanilla. Mix until smooth – it will look caramel.
- Finish dough – Add the Dry ingredients and mix until the flour is mostly incorporated. Add the choc chips and stir until the flour is fully incorporated.
- Make dough discs – Measure out 8 x 155g (5.3 oz/ 1/2 cup) portions of dough, roll into a ball then shape into a 3.75cm/1.5" thick round disc. Place in a very airtight container.
CHILLING:
- Fridge 12 hours – Refrigerate for 12 hours, up to 48 hours (Note 6 for different chill times).
BAKING:
- Preheat oven to 180°C/350°F (170°C fan-forced).
- Place 4 fridge-cold cookies 7.5 cm/3" apart on a tray lined with baking paper/parchment paper.
- Bake for 17 minutes or until the edges are golden and the surface is just set (ie not melty raw dough) but still pale.
- Decorate and cool – Working quickly, press extra choc chips on the surface, then cool on the tray for 20 minutes – finishes baking, edges crisp more and they get more golden all over.
- Tip: While hot, you can also reshape with a rubber spatula or similar into a tidy round shape.
- Grab now – peak eating moment! Or, transfer to a rack to cool fully before storing in an airtight container.', 8);

/*Tzatziki Chickpea Salad recipe refference: https://www.recipetineats.com/tzatziki-chickpea-salad/ */

INSERT INTO recipe
VALUES (000003, 'Tzatziki Chickpea Salad', 72,
'- Mix – Put the Tzatziki ingredients in a big bowl and mix. Add the chickpeas, celery and capers, mix again.
- Wait 1 hour – You can eat it straight away but its better if you can set aside for at least 1 hour to let the flavours meld (especially salt from capers & the garlic). Its even better the next day. Give it a taste and add a pinch of extra salt if needed (capers saltiness can differ).
- Serve drizzled with extra olive oil and extra dill. Dive in!', 4);

/*Crispy Potato Straws recipe refference: https://www.recipetineats.com/crispy-potato-straws-pommes-paille/#wprm-recipe-container-147762 */

INSERT INTO recipe
VALUES (000004, 'Crispy Potato Straws', 10,
'- Shred – Finely julienne the potato using a julienne mandoline, 2-4 mm / 1/16 – 1/8" thick.
- Rinse – Place potato in a bowl of water and rinse, changing the water as needed, until the water is clear. Drain in a colander. (Potato can be kept in water overnight in the fridge).
- Dry – Spread on tea towels then pat dry. If time permits, spread out and air dry for 1 hour+. (Drier potato = less oil bubbling + crispier fries).
- Heat the oil in a saucepan over high heat to 180°C/350°F, ensuring there is 10 cm/4" clearance above the oil surface (the oil bubbles up).
- Add potato into oil – SLOWLY scatter potato across the surface of the oil (dont dump in once place). ⚠️The oil will bubble up to ~7cm/3", so add potato slowly, and you can pause until the bubbles subside before adding more.
- Fry for 1 1/2 – 2 minutes, using chopsticks (or similar) to stir once or twice. Once light golden and crisp, scoop out and drain on paper towels. (It goes more golden as it drains). Repeat with remaining potato.
- Season – Carefully slide the fries into a bowl. Sprinkle with salt and gently toss. Serve immediately while warm, or cool.
- Serve in bowls for munching, as a garnish like for Beef Tataki or serve a mound alongside a juicy steak or other protein.', 1);



-- utensil recipe entries
INSERT INTO uten_recipe
VALUES (000000, 00001);
INSERT INTO uten_recipe
VALUES (000001, 00001);
INSERT INTO uten_recipe
VALUES (000002, 00001);
INSERT INTO uten_recipe
VALUES (000003, 00001);
INSERT INTO uten_recipe
VALUES (000004, 00001);

--store_uten table entries
INSERT INTO store_uten
VALUES (000000, 000003, 3.99);
INSERT INTO store_uten
VALUES (000001, 000000, 30.49);
INSERT INTO store_uten
VALUES (000002, 000001, 5.50);
INSERT INTO store_uten
VALUES (000003, 000006, 7.20);
INSERT INTO store_uten
VALUES (000005, 000009, 7.97);

--ingr_recipe table entries
INSERT INTO ingr_recipe
VALUES (3, 000001, 0.53);
INSERT INTO ingr_recipe
VALUES (5, 000003, 0.083);
INSERT INTO ingr_recipe
VALUES (7, 000000, 8);
INSERT INTO ingr_recipe
VALUES (11, 000000, 0.333333);
INSERT INTO ingr_recipe
VALUES (9, 000000, 16);

-- store_ingr table entries
INSERT INTO store_ingr (store_id, ing_id, ing_price) VALUES (6, 1, 1.28); -- walmart, roma tomatoes
INSERT INTO store_ingr (store_id, ing_id, ing_price) VALUES (6, 2, 4.98); -- walmart, tillamook cheddar cheese 8oz
INSERT INTO store_ingr (store_id, ing_id, ing_price) VALUES (0, 4, 3.49); -- albertson, crimini mushrooms 8oz
INSERT INTO store_ingr (store_id, ing_id, ing_price) VALUES (0, 5, 13.99); -- albertson, olive oil 25 oz bertolli
INSERT INTO store_ingr (store_id, ing_id, ing_price) VALUES (6, 5, 16.99); -- walmart, olive oil 25 oz bertolli
INSERT INTO store_ingr (store_id, ing_id, ing_price) VALUES (0, 6, 3.99); -- albertsons, angel hair de cecco 16 oz
INSERT INTO store_ingr (store_id, ing_id, ing_price) VALUES (0, 7, 7.98); -- albertsons, chicken breast 32 oz
INSERT INTO store_ingr (store_id, ing_id, ing_price) VALUES (0, 8, 3.99); -- albertsons, silk almond milk 64 oz
INSERT INTO store_ingr (store_id, ing_id, ing_price) VALUES (0, 9, 4.99); -- albertsons, whole milk 52 oz
INSERT INTO store_ingr (store_id, ing_id, ing_price) VALUES (0, 10, 2.99); -- albertsons, chicken broth 32 oz
INSERT INTO store_ingr (store_id, ing_id, ing_price) VALUES (5, 11, 7.99); -- amazon, chicken broth 32 oz