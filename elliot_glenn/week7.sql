--drop tables
DROP TABLE IF EXISTS store_uten;
DROP TABLE IF EXISTS ingr_recipe;
DROP TABLE IF EXISTS store;

--create tables
CREATE TABLE store(
    store_id int(5) NOT NULL,
    store_name varchar(10) NOT NULL,
    addr_num int(6) NOT NULL,
    st_name varchar(20) NOT NULL,
    city varchar(58) NOT NULL
);

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

--alter table statements to add PKs and FKs

    --pks

ALTER TABLE store
    ADD CONSTRAINT store_pk
    PRIMARY KEY (store_id);

ALTER TABLE store_uten
    ADD CONSTRAINT store_uten_pk
    PRIMARY KEY (store_id, uten_id);

ALTER TABLE ingr_recipe
    ADD CONSTRAINT ingr_recipe_pk
    PRIMARY KEY (ing_id, recipe_id);

    --fks

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

--insert statements

    --store table

INSERT INTO store 
VALUES (000000, 'Albertsons', 2301, 'Ashland St', 'Ashland');

INSERT INTO store 
VALUES (000001, 'Ashland''s Own Shop''n Kart', 2268, 'Ashland St', 'Ashland');

INSERT INTO store 
VALUES (000002, 'Market of Choice Ashland', 1475, 'Siskiyou Blvd', 'Ashland');

INSERT INTO store 
VALUES (000003, 'WinCo Foods', 251, 'E Barnett Rd', 'Medford');

INSERT INTO store 
VALUES (000004, 'Asia Market', 229, 'E Barnett Rd', 'Medford');

    --store_uten table

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

    --ingr_recipe table 

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