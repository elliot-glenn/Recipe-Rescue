
----------------------------------------
-- INGREDIENT --
----------------------------------------
INSERT INTO ingredient (ing_id, ing_name, dep_name, vegan, gluten_free, vegetarian, oz_per_unit) 
VALUES (12, "Yellow Onion", "Produce", true, true, true, 12.7); -- onion from walmart, ~13 ounces per onion


----------------------------------------
-- STORE --
----------------------------------------



----------------------------------------
-- UTENSIL --
----------------------------------------
INSERT INTO utensil 
VALUES (10, "Baking Tray");

INSERT INTO utensil 
VALUES (11, "Liquid measuring cup");

INSERT INTO utensil 
VALUES (12, "tin foil");

INSERT INTO utensil 
VALUES (13, "parchment paper");

INSERT INTO utensil 
VALUES (14, "stirring spoon");

INSERT INTO utensil 
VALUES (15, "saucepan");

INSERT INTO utensil 
VALUES (16, "frying pan");

INSERT INTO utensil 
VALUES (17, "stock pot");

INSERT INTO utensil 
VALUES (18, "colandar");

----------------------------------------
-- RECIPE --
----------------------------------------



----------------------------------------
-- INGR_RECIPE --
----------------------------------------
INSERT INTO ingr_recipe (ing_id, recipe_id, oz) VALUES (3, 1, 0.4); -- Garlic into Pad See Ew, ~0.4 ounces 2 cloves of garlic
INSERT INTO ingr_recipe (ing_id, recipe_id, oz) VALUES (10, 0, 0.34); -- Chicken broth into Chicken Pot Pie ~0.34 ounces
INSERT INTO ingr_recipe (ing_id, recipe_id, oz) VALUES (12, 0, 12.7); -- whole onion in chicken pot pie


----------------------------------------
-- STORE_INGR --
----------------------------------------
INSERT INTO store_ingr (store_id, ing_id, ing_price) VALUES (6, 12, 0.66) -- walmart selling onions for 66 cents per


----------------------------------------
-- STORE_UTEN --
----------------------------------------



----------------------------------------
-- UTEN_RECIPE --
----------------------------------------