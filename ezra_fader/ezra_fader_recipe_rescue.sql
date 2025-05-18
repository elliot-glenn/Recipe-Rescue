USE usr_fadere_1;

DROP TABLE ingredient;
DROP TABLE store_ingr;

-- create ingredient table
CREATE TABLE ingredient 
(
	ing_id INT(5), -- ingredient id
    ing_name VARCHAR(25), -- ingredient name
    dep_name VARCHAR(25), -- department you will find the ingredient in
    vegan BOOL,
    gluten_free BOOL,
    vegetarian BOOL,
    oz_per_unit DOUBLE -- ounces per unit
);

-- store and ingredient bridge table
CREATE TABLE store_ingr
(
	store_id INT(5), -- fk from the store table
    ing_id INT(5), -- fk from the ingredient table
    ing_price DOUBLE -- price of the ingredient, per unit
);

-- Ingredient primary key(s)
ALTER TABLE ingredient ADD CONSTRAINT ing_pk PRIMARY KEY (ing_id);

-- Add store ingredient bridge table foreign keys and primary keys
ALTER TABLE store_ingr ADD CONSTRAINT store_ingr_pk PRIMARY KEY (store_id, ing_id);
ALTER TABLE store_ingr ADD CONSTRAINT store_fk FOREIGN KEY (store_id) REFERENCES store (store_id); -- store id fk
ALTER TABLE store_ingr ADD CONSTRAINT ing_pk FOREIGN KEY (ing_id) REFERENCES ingredient (ing_id); -- ingredient id fk


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

-- store ingredient bridge table 
-- we can change the ids later, just using them as placeholder
INSERT INTO store_ingr (store_id, ing_id, ing_price) VALUES (1, 1, 1.28); -- walmart, roma tomatoes
INSERT INTO store_ingr (store_id, ing_id, ing_price) VALUES (1, 2, 4.98); -- walmart, tillamook cheddar cheese 8oz
INSERT INTO store_ingr (store_id, ing_id, ing_price) VALUES (0, 4, 3.49); -- albertson, crimini mushrooms 8oz
INSERT INTO store_ingr (store_id, ing_id, ing_price) VALUES (0, 5, 13.99); -- albertson, olive oil 25 oz bertolli
INSERT INTO store_ingr (store_id, ing_id, ing_price) VALUES (1, 5, 16.99); -- walmart, olive oil 25 oz bertolli