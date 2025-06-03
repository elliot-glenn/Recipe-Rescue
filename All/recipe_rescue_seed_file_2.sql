
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



----------------------------------------
-- RECIPE --
----------------------------------------



----------------------------------------
-- INGR_RECIPE --
----------------------------------------
INSERT INTO ingr_recipe (ing_id, recipe_id, oz) VALUES (3, 1, 0.4); -- Garlic into Pad See Ew, ~0.4 ounces 2 cloves of garlic
INSERT INTO ingr_recipe (ing_id, recipe_id, oz) VALUES (10, 0, 0.34); -- Chicken broth into Chicken Pot Pie ~0.34 ounces


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