/* There’s a world wide sale for all food everywhere, everything is now 50 cents cheaper. */

SELECT ing_price AS 'before' FROM store_ingr;
UPDATE store_ingr SET ing_price = ing_price - 0.50;
SELECT ing_price AS 'after' FROM store_ingr;

/* Albertsons no longer supplies Crimini Mushrooms, make sure the DB reflects this. */

DELETE FROM store_ingr WHERE store_id = (SELECT store_id FROM store WHERE store_name = 'Albertsons') AND ing_id = (SELECT ing_id FROM ingredient WHERE ing_name = 'Crimini Mushroom');
SELECT ing_name FROM ingredient WHERE ing_id IN (SELECT ing_id FROM store_ingr WHERE store_id IN (SELECT store_id FROM store WHERE store_name = 'Albertsons'));
/* We need to show the names of the recipes associated with their ingredient names so it’s easier for the user to view. */

SELECT r.recipe_name, i.ing_name AS ing_name FROM recipe r
JOIN ingr_recipe ir ON r.recipe_id = ir.recipe_id
JOIN ingredient i ON ir.ing_id = i.ing_id;

/*  I want to see every utensil in the database along with the associated stores that supply them (if a utensil was not supplied by a store, it should still be shown). */

SELECT uten_id, store_id FROM utensil LEFT JOIN store_uten USING (uten_id) ORDER BY uten_id;

/* Find the average price of ingredients across all stores */

SELECT ing_id, AVG(ing_price) FROM store_ingr GROUP BY ing_id ORDER BY ing_id;
SELECT ing_id, ing_price from store_ingr ORDER BY ing_id;

/* Show all of recipes that include garlic (WITHOUT looking up the associated number for garlic) */

SELECT recipe_name AS garlic_recipes FROM recipe WHERE recipe_id IN (SELECT recipe_id FROM ingr_recipe WHERE ing_id IN (SELECT ing_id FROM ingredient WHERE ing_name = 'Garlic'));

/* Show each ingredient and how many stores supply it */

SELECT ing_name, 
       (SELECT COUNT(*) 
        FROM store_ingr si 
        WHERE si.ing_id = i.ing_id) AS store_count
FROM ingredient i;

SELECT * FROM ingredient LEFT JOIN store_ingr ON ingredient.ing_id = store_ingr.ing_id;

/* Create a view that lists all ingredients and the recipes they are used in. */

CREATE VIEW v_ingredient_recipes AS
SELECT i.ing_name, r.recipe_name
FROM ingredient i
JOIN ingr_recipe ir ON i.ing_id = ir.ing_id
JOIN recipe r ON ir.recipe_id = r.recipe_id;

SELECT * FROM v_ingredient_recipes;

/* Find the maximum price of any ingredient in the database. */

SELECT MAX(ing_price) AS max_ingredient_price
FROM store_ingr;

SELECT ing_price FROM store_ingr ORDER BY ing_price DESC;

/* Show all ingredient IDs that appear in both store_ingr and ingr_recipe. */

SELECT ing_id FROM store_ingr
INTERSECT
SELECT ing_id FROM ingr_recipe;

SELECT DISTINCT ing_id FROM store_ingr NATURAL JOIN ingr_recipe;