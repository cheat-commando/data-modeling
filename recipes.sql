CREATE TABLE users(
    user_id SERIAL PRIMARY KEY,
    user_name VARCHAR(15),
    user_email VARCHAR(30),
    user_password VARCHAR(20)
);

CREATE TABLE recipes(
    recipe_id SERIAL PRIMARY KEY,
    recipe_name VARCHAR(30),
    creator_id INT NOT NULL REFERENCES users(user_id),
    instructions TEXT
);

CREATE TABLE ingredients(
    ingredient_id SERIAL PRIMARY KEY,
    ingredient_name VARCHAR(20),
    ingredient_description VARCHAR(100)
);

CREATE TABLE ingredients_recipes(
    ingredient_recipe_id SERIAL PRIMARY KEY,
    ingredient_id INT NOT NULL REFERENCES ingredients(ingredient_id),
    recipe_id INT NOT NULL REFERENCES recipes(recipe_id)
);

CREATE TABLE occasions(
    occasion_id SERIAL PRIMARY KEY,
    occasion_name VARCHAR(30),
    occasion_location VARCHAR(40),
    occasion_date DATE,
    occasion_time TIME,
    occasion_creator_id INT NOT NULL REFERENCES users(user_id)
);

CREATE TABLE recipes_occasions(
    recipe_occasion_id SERIAL PRIMARY KEY,
    recipe_id INT NOT NULL REFERENCES recipes(recipe_id),
    occasion_id INT NOT NULL REFERENCES occasions(occasion_id)
);

CREATE TABLE grocery_lists(
    grocery_list_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL UNIQUE REFERENCES users(user_id)
);

CREATE TABLE grocery_ingredients(
    grocery_ingredient_id SERIAL PRIMARY KEY,
    grocery_list_id INT NOT NULL REFERENCES grocery_lists(grocery_list_id),
    ingredient_id INT NOT NULL REFERENCES ingredients(ingredient_id)
);

INSERT INTO users(user_name,user_email,user_password)
VALUES
    ('Carston Work', 'carston.work@gmail.com','killerdolphins'),
    ('Jack Erekson', 'jackknowsbest@yahoo.com','monkeysarecool');

INSERT INTO recipes(recipe_name,creator_id,instructions)
VALUES
    ('Chicken fajitas',1,'Take some chickens and kill them. Pluck ALL their feathers off and then chop up their meat. Cook until no longer pink. Go find a wheat field and harvest the grain without the farmer seeing you. Mash grain into flour and then mix with water to make a tortilla. Wrap the chicken meat in the tortilla and then stuff into your face. The end.');
