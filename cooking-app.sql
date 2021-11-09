CREATE TABLE users (
	user_id SERIAL PRIMARY KEY,
    first_name varchar(255) not null,
    last_name varchar(255) not null
);

CREATE TABLE auth (
	user_id integer NOT NULL REFERENCES users(user_id),
	email varchar(255) NOT NULL UNIQUE,
	password varchar(255) NOT NULL
);

CREATE TABLE "recipe" (
	"recipe_id" serial primary key NOT NULL,
	"user_id" int NOT NULL references users(user_id),
	"recipe_name" varchar(255) NOT NULL,
	"serving_size" varchar(255) NOT NULL,
	"prep_mins" int NOT NULL,
	"cook_mins" int NOT NULL,
	"favorite" BOOLEAN NOT NULL,
	"photo_url" varchar(255),
	"public" BOOLEAN NOT NULL
);

CREATE TABLE "comment" (
	"comment_id" serial primary key NOT NULL,
	"user_id" int NOT NULL references users(user_id),
	"recipe_id" int NOT NULL references recipe(recipe_id),
	"comment" varchar(255) NOT NULL
  );



CREATE TABLE "like" (
	"like_Id" serial primary key NOT NULL,
	"recipe_id" int NOT NULL references recipe(recipe_id),
	"user_id" int NOT NULL references users(user_id)
);

CREATE TABLE "ingredient" (
	"ingredient_id" serial primary key NOT NULL,
	"ingredient_name" varchar(255) NOT NULL UNIQUE,
	"category" varchar(255) NOT NULL
);

CREATE TABLE "recipe_ingredient" (
	"recipe_ingredient_id" serial primary key NOT NULL,
	"recipe_id" int NOT NULL references recipe(recipe_id),
	"ingredient_id" int NOT NULL  references ingredient(ingredient_id),
	"quantity" DECIMAL NOT NULL,
	"quantity_unit" varchar(255) NOT NULL
);

CREATE TABLE "instruction_step" (
	"instruction_step_id" serial primary key NOT NULL,
	"recipe_id" int NOT NULL references recipe(recipe_id),
	"step_number" int NOT NULL,
	"step_content" TEXT NOT NULL
);

CREATE TABLE "grocery_list" (
	"grocery_list_id" serial primary key NOT NULL,
	"user_id" int NOT NULL references users(user_id),
	"list_name" varchar(255) NOT NULL
);

CREATE TABLE "grocery_item" (
	"grocery_item_id" serial primary key NOT NULL,
	"grocery_list_id" int NOT NULL  references grocery_list(grocery_list_id),
	"ingredient_id" int NOT NULL references ingredient(ingredient_id),
	"quantity" DECIMAL NOT NULL,
	"quantity_unit" varchar(255) NOT NULL
);

CREATE TABLE "occasions" (
	"occasions_id" serial primary key NOT NULL,
	"user_id" int NOT NULL references users(user_id),
	"recipe_id" int NOT NULL references recipe(recipe_id),
	"occasion_name" varchar(255) NOT NULL
);

CREATE TABLE "tag" (
	"tag_id" serial primary key NOT NULL,
	"tag_name" varchar(255) NOT NULL UNIQUE
);

CREATE TABLE "recipe_tag" (
	"recipe_tag_id" serial primary key NOT NULL,
	"recipe_id" int NOT NULL references recipe(recipe_id),
	"tag_id" int NOT NULL references tag(tag_id)
);

-- Intermediate

insert into users (first_name, last_name)
values ('Chad', 'Muska'),
('Tony', 'Hawk');

insert into auth (user_id, password, email)
values (1, 'kickflip', 'chad@muska.com'),
(2, 'melongrab', 'tony@hawk.com');

insert into recipe (user_id, recipe_name, serving_size, prep_mins, cook_mins, favorite, photo_url, public)
values (1, 'Chicken Parm', 4, 25, 30, true, null, true),
(1, 'Quesadilla', 2, 10, 5, false, 'https://www.nutriologyus.com/wp-content/uploads/2020/04/Chicken-Quesadilla2.jpg', false),
(2, 'Split Pea Soup', 6, 15, 15, true, null, true);

insert into comment (user_id, recipe_id, comment)
values (1, 3, 'Cool cooking'),
(2, 1, 'Back at cha');

insert into "like" (recipe_id, user_id)
values (1, 1),
(1, 2);

insert into ingredient (ingredient_name, category)
values ('milk', 'dairy'),
('bread', 'bread'),
('chicken', 'meat'),
('parmasean cheese', 'dairy'),
('noodles', 'pasta'),
('peas', 'vegetables'),
('salt', 'seasoning');