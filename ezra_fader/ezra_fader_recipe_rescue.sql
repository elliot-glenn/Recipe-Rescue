USE usr_fadere_1;

-- create ingredient table
CREATE TABLE ingredient 
(
	ing_id INT(5), -- ingredient id
    ing_name VARCHAR(10), -- ingredient name
    dep_name VARCHAR(10), -- department you will find the ingredient in
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
ALTER TABLE store_ingr ADD CONSTRAINT store_fk FOREIGN KEY (store_id) REFERENCES store(store_id); -- store id fk
ALTER TABLE store_ingr ADD CONSTRAINT ing_id FOREIGN KEY (ing_id) REFERENCES ingredient(ing_id); -- ingredient id fk

