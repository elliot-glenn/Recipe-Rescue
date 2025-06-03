

-- UPDATE TASK
UPDATE ingredient SET dep_name = 'Fresh Produce' WHERE dep_name = 'Produce';
SELECT ing_name AS 'Ingredient Name', dep_name AS 'Food Department' FROM ingredient;

-- DELETE TASK
DELETE FROM store_uten WHERE store_id = 5 AND uten_id = 0;
SELECT uten_name, store_name FROM store_uten JOIN utensil USING(uten_id) JOIN store USING(store_id) WHERE store_name = 'Amazon';

-- JOIN


-- LEFT JOIN
SELECT ing_name FROM recipe LEFT JOIN ingr_recipe USING (recipe_id) LEFT JOIN ingredient USING(ing_id) WHERE recipe_name = 'Chicken Pot Pie';