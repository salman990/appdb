DROP SEQUENCE IF EXISTS public.restaurants_cuisines_id_seq CASCADE;
DROP TABLE IF EXISTS public.restaurantcuisinetypes CASCADE;

DROP SEQUENCE IF EXISTS public.restaurants_id_seq CASCADE;
DROP TABLE IF EXISTS public.restaurants CASCADE;

DROP SEQUENCE IF EXISTS public.cuisine_id_seq CASCADE;
DROP TABLE IF EXISTS public.cuisines CASCADE;

CREATE SEQUENCE IF NOT EXISTS public.cuisine_id_seq; 
CREATE TABLE public.cuisines
(
    id smallint NOT NULL DEFAULT nextval('cuisine_id_seq') PRIMARY KEY,
    name varchar(100) NOT NULL,
    description varchar(300) 
);

CREATE SEQUENCE IF NOT EXISTS public.restaurants_id_seq; 
CREATE TABLE public.restaurants
(
    id int NOT NULL DEFAULT nextval('restaurants_id_seq') PRIMARY KEY,
    name varchar(200) NOT NULL UNIQUE,
    description varchar(200),
    active boolean NOT NULL DEFAULT '0',
	budget_level int4range(1,6),
    minimum_order_price smallint,
    delivery_charges   smallint,
    address           VARCHAR(200),
    city              VARCHAR(200) NOT NULL,
    area              VARCHAR(200) NOT NULL,
    telephone         VARCHAR(200),
    cellphone         VARCHAR(200),
    logo_path          VARCHAR(200),
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE SEQUENCE IF NOT EXISTS public.restaurants_cuisines_id_seq; 
CREATE TABLE public.restaurants_cuisines
(
    id int NOT NULL DEFAULT nextval('restaurantcuisines_id_seq') PRIMARY KEY,
    restaurant_id int NOT NULL,
    cuisine_id smallint NOT NULL,
    CONSTRAINT restaurantcuisinetypes_fkey_restaurants FOREIGN KEY(restaurant_id) REFERENCES restaurants(id), 
    CONSTRAINT restaurantcuisinetypes_fkey_cuisinetypes FOREIGN KEY(cuisine_id) REFERENCES cuisines(id)
);

-- INSERT SOME BASIC DATA 
INSERT INTO public.cuisines(name,description) VALUES ('Pizza',NULL),('Pakistani',NULL),('Desserts',NULL),('Chinese',NULL),('Burgers',NULL),('Sandwiches',NULL),('Italian',NULL);

INSERT INTO public.restaurants(name,description,budget_level, minimum_order_price,delivery_charges,address,city,area,telephone,cellphone,logo_path)
VALUES('La Coruna',' Best restaurant in Town',3,500,100,'Folehaven 131, Valby, 2500','Lahore','DHA','23242323',NULL,NULL);


