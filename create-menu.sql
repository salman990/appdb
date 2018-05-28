DROP SEQUENCE IF EXISTS public.restaurants_cuisines_id_seq CASCADE;
DROP TABLE IF EXISTS public.restaurantcuisinetypes CASCADE;

CREATE SEQUENCE IF NOT EXISTS public.menu_categories_id_seq; 
CREATE TABLE public.menu_categories
(
    id int NOT NULL DEFAULT nextval('menu_categories_id_seq') PRIMARY KEY,
    name varchar(200) NOT NULL,
    description varchar(200),
	parent_id	int,
	restaurant_id int NOT NULL,
	CONSTRAINT menu_categories_uq Unique (name,restaurant_id),
	CONSTRAINT menu_categories_fk Foreign Key (restaurant_id ) REFERENCES restaurants(id)
);

CREATE SEQUENCE IF NOT EXISTS public.menu_items_id_seq; 
CREATE TABLE public.menu_items
(
    id int NOT NULL DEFAULT nextval('menu_items_id_seq') PRIMARY KEY,
    name varchar(200) NOT NULL UNIQUE,
    description varchar(200),
	menu_category_id	int,
	
);