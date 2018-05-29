DROP TABLE IF EXISTS public.menu_item_details;
DROP TABLE IF EXISTS  public.menu_items;
DROP TABLE IF EXISTS  public.menu_categories;

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
    description1 varchar(200),
	description2 varchar(200),
	price decimal(8,2),
	menu_category_id int,
	CONSTRAINT menu_items_fk Foreign Key (menu_category_id ) REFERENCES menu_categories(id)
);

CREATE SEQUENCE IF NOT EXISTS public.menu_item_details_id_seq; 
CREATE TABLE public.menu_item_details
(
    id int NOT NULL DEFAULT nextval('menu_item_details_id_seq') PRIMARY KEY,
    group_id smallint NOT NULL,
	name varchar(200) NOT NULL,
    description1 varchar(200),
	description2 varchar(200),
	menu_item_id int,
	CONSTRAINT menu_item_details_fk Foreign Key (menu_item_id ) REFERENCES menu_items(id)
);



