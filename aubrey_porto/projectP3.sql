DROP TABLE IF EXISTS utensil;
DROP TABLE IF EXISTS recipe;
DROP TABLE IF EXISTS uten_recipe;

/*create tables */

CREATE TABLE utensil(
	uten_id INT(5) NOT NULL,
	uten_name VARCHAR(10) NOT NULL
);

CREATE TABLE recipe(
	recipe_id INT(6) NOT NULL,
	recipe_name VARCHAR(30) NOT NULL,
    cook_time int NOT NULL,
    instructions mediumtext NOT NULL,
    serving_size int(2)
);

/* the long strings coppied from the recipe website didnt work correctly, i think special characters were making things weird so convert character set to utf8*/

ALTER TABLE recipe CONVERT TO CHARACTER SET utf8;

CREATE TABLE uten_recipe(
	uten_id INT(5) NOT NULL,
	recipe_id INT(6) NOT NULL
);

/*PK*/

ALTER TABLE utensil
   ADD CONSTRAINT uten_pk
   PRIMARY KEY (uten_id);
      
ALTER TABLE recipe
   ADD CONSTRAINT recipe_pk
   PRIMARY KEY (recipe_id);

ALTER TABLE uten_recipe
   ADD CONSTRAINT uten_recipe_pk
   PRIMARY KEY (recipe_id, uten_id);

/*FK*/

ALTER TABLE uten_recipe
   ADD CONSTRAINT uten_recipe_fk0
   FOREIGN KEY (uten_id)
   REFERENCES utensil (uten_id);

ALTER TABLE uten_recipe
   ADD CONSTRAINT uten_recipe_fk1
   FOREIGN KEY (recipe_id)
   REFERENCES recipe (recipe_id);

/*Insert*/

-- utencil

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

-- Recipe inserts

/* chicken pot pie refference: https://www.recipetineats.com/chicken-pot-pie/#recipe*/

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
- Serve immediately!');

/*Pad See Ew refference recipe: https://www.recipetineats.com/thai-stir-fried-noodles-pad-see-ew/#h-pad-see-ew*/

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
- Add chicken back in: Quickly add chicken and veg back in, and toss to disperse. Serve immediately!');

/* chocolate chip cookies recipe refference: https://www.recipetineats.com/the-chocolate-chip-cookies-of-my-dreams/*/

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
- Grab now – peak eating moment! Or, transfer to a rack to cool fully before storing in an airtight container.');

/*Tzatziki Chickpea Salad recipe refference: https://www.recipetineats.com/tzatziki-chickpea-salad/*/

INSERT INTO recipe
VALUES (000003, 'Tzatziki Chickpea Salad', 72,
'- Mix – Put the Tzatziki ingredients in a big bowl and mix. Add the chickpeas, celery and capers, mix again.
- Wait 1 hour – You can eat it straight away but its better if you can set aside for at least 1 hour to let the flavours meld (especially salt from capers & the garlic). Its even better the next day. Give it a taste and add a pinch of extra salt if needed (capers saltiness can differ).
- Serve drizzled with extra olive oil and extra dill. Dive in!');

/*Crispy Potato Straws recipe refference: https://www.recipetineats.com/crispy-potato-straws-pommes-paille/#wprm-recipe-container-147762*/

INSERT INTO recipe
VALUES (000004, 'Crispy Potato Straws', 10,
'- Shred – Finely julienne the potato using a julienne mandoline, 2-4 mm / 1/16 – 1/8" thick.
- Rinse – Place potato in a bowl of water and rinse, changing the water as needed, until the water is clear. Drain in a colander. (Potato can be kept in water overnight in the fridge).
- Dry – Spread on tea towels then pat dry. If time permits, spread out and air dry for 1 hour+. (Drier potato = less oil bubbling + crispier fries).
- Heat the oil in a saucepan over high heat to 180°C/350°F, ensuring there is 10 cm/4" clearance above the oil surface (the oil bubbles up).
- Add potato into oil – SLOWLY scatter potato across the surface of the oil (dont dump in once place). ⚠️The oil will bubble up to ~7cm/3", so add potato slowly, and you can pause until the bubbles subside before adding more.
- Fry for 1 1/2 – 2 minutes, using chopsticks (or similar) to stir once or twice. Once light golden and crisp, scoop out and drain on paper towels. (It goes more golden as it drains). Repeat with remaining potato.
- Season – Carefully slide the fries into a bowl. Sprinkle with salt and gently toss. Serve immediately while warm, or cool.
- Serve in bowls for munching, as a garnish like for Beef Tataki or serve a mound alongside a juicy steak or other protein.');

-- utensil recipe inserts

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