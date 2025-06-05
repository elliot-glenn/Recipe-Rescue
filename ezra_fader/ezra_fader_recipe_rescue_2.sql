

-- UPDATE TASK
UPDATE ingredient SET dep_name = 'Fresh Produce' WHERE dep_name = 'Produce';
SELECT ing_name AS 'Ingredient Name', dep_name AS 'Food Department' FROM ingredient;

-- DELETE TASK
DELETE FROM store_uten WHERE store_id = 5 AND uten_id = 0;
SELECT uten_name AS 'Utensil', store_name AS 'Store' FROM store_uten JOIN utensil USING(uten_id) JOIN store USING(store_id) WHERE store_name = 'Amazon';

-- JOIN
SELECT uten_name AS 'Utensil', recipe_name AS 'Recipe' FROM uten_recipe JOIN utensil USING(uten_id) JOIN recipe USING (recipe_id) WHERE recipe_name = 'Pad See Ew';

-- LEFT JOIN
SELECT ing_name AS 'Ingredient' FROM recipe LEFT JOIN ingr_recipe USING (recipe_id) LEFT JOIN ingredient USING(ing_id) WHERE recipe_name = 'Chicken Pot Pie';

-- GROUP BY
SELECT store_name AS 'Store', count(ing_id) AS 'Food Sold' FROM store_ingr JOIN store USING(store_id) JOIN ingredient USING(ing_id) GROUP BY store_id;

-- SUBQUERY
SELECT count(ing_id) AS 'Ingredients sold in Medford stores' FROM store_ingr WHERE store_id IN (SELECT store_id FROM store WHERE city = 'Medford');

-- CORRO SUBQUERY
SELECT ing_name AS 'Ingredient', ing_price AS 'Price', store_name AS 'Store', dep_name AS 'Department' 
FROM ingredient i1 JOIN store_ingr USING (ing_id) JOIN store USING (store_id) WHERE ing_price = 
(SELECT MIN(ing_price) AS ing_price FROM ingredient i2 JOIN store_ingr USING (ing_id) JOIN store USING (store_id) WHERE i1.dep_name = i2.dep_name);

SELECT dep_name, ing_name, ing_price, store_name FROM store_ingr JOIN ingredient USING (ing_id) JOIN store USING (store_id);

-- VIEW
CREATE VIEW v_store AS (SELECT store_name AS 'Store', IFNULL(city, 'Online') AS 'City' FROM store);
SELECT * FROM v_store;

-- BUILT IN
SELECT ing_name AS 'Ingredient', CONCAT_WS(' ', 
IF(vegetarian, IF(vegan, 'Vegan', 'Vegetarian'), ''), 
IF(gluten_free, 'Gluten Free', '')) AS 'Dietary Restrictions' 
FROM ingredient;

-- RELATIONAL SET
SELECT COUNT(item) AS 'Total Items' FROM
((SELECT ing_id AS item FROM ingredient)
UNION ALL
(SELECT uten_id AS item FROM utensil)) total_item;