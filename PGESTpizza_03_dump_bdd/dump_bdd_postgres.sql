-- ------------ restore command for command line -------------------
-- psql -U <user> oc_restaurant -h localhost -f dump_bdd_postgres.sql 

--
-- PostgreSQL database dump
--

-- Dumped from database version 11.7
-- Dumped by pg_dump version 12.2

-- Started on 2020-05-09 11:34:35

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE oc_restaurant;
--
-- TOC entry 2957 (class 1262 OID 20796)
-- Name: oc_restaurant; Type: DATABASE; Schema: -; Owner: oc_user
--

CREATE DATABASE oc_restaurant WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE oc_restaurant OWNER TO oc_user;

\connect oc_restaurant

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

--
-- TOC entry 196 (class 1259 OID 20797)
-- Name: access_rights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.access_rights (
    id integer NOT NULL,
    grade character varying(45) NOT NULL
);


ALTER TABLE public.access_rights OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 20822)
-- Name: account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account (
    id integer NOT NULL,
    last_name character varying(60) NOT NULL,
    first_name character varying(60) NOT NULL,
    password character varying(100) NOT NULL,
    email character varying(75) NOT NULL,
    phone_number character varying(45) NOT NULL,
    street character varying(200) NOT NULL,
    city character varying(75) NOT NULL,
    postal_code character varying(45) NOT NULL,
    access_rights integer NOT NULL
);


ALTER TABLE public.account OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 20817)
-- Name: article; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.article (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    ean13_code integer NOT NULL,
    unit_price_excluding_vat integer NOT NULL,
    unit_price_including_vat integer NOT NULL,
    designation character varying(100) NOT NULL
);


ALTER TABLE public.article OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 20923)
-- Name: bill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bill (
    number_id integer NOT NULL,
    num_vat integer NOT NULL,
    num_siren integer NOT NULL,
    price_excluding_vat numeric(10,2) NOT NULL,
    price_including_vat numeric(10,2) NOT NULL,
    bill_date timestamp without time zone NOT NULL,
    street character varying(200) NOT NULL,
    city character varying(75) NOT NULL,
    postal_code character varying(45) NOT NULL,
    order_id integer NOT NULL
);


ALTER TABLE public.bill OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 20957)
-- Name: command_line; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.command_line (
    id integer NOT NULL,
    order_id integer NOT NULL,
    article_id integer NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public.command_line OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 20881)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    id integer NOT NULL,
    delivery_address character varying(200) NOT NULL,
    account_id integer NOT NULL
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 20934)
-- Name: delivery; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.delivery (
    id integer NOT NULL,
    address_client character varying(200) NOT NULL,
    id_client integer NOT NULL,
    employee_id integer NOT NULL,
    order_id integer NOT NULL
);


ALTER TABLE public.delivery OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 20859)
-- Name: ingredient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ingredient (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    designation character varying(100) NOT NULL
);


ALTER TABLE public.ingredient OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 20864)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    num_command integer NOT NULL,
    status integer NOT NULL,
    paid_for smallint NOT NULL,
    restaurant_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 20802)
-- Name: profession_title; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profession_title (
    id integer NOT NULL,
    title character varying(75) NOT NULL
);


ALTER TABLE public.profession_title OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 20906)
-- Name: quantity_ingredient_recipe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quantity_ingredient_recipe (
    id integer NOT NULL,
    quantity_ingredient_recipe character varying(45) NOT NULL,
    ingredient_id integer NOT NULL,
    recipe_id integer NOT NULL
);


ALTER TABLE public.quantity_ingredient_recipe OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 20892)
-- Name: recipe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recipe (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    recipe text NOT NULL,
    article_id integer NOT NULL
);


ALTER TABLE public.recipe OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 20807)
-- Name: restaurant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restaurant (
    id integer NOT NULL,
    email_address character varying(75) NOT NULL,
    phone_number integer NOT NULL,
    street character varying(200) NOT NULL,
    city character varying(75) NOT NULL,
    postal_code character varying(45) NOT NULL
);


ALTER TABLE public.restaurant OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 20836)
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff (
    id integer NOT NULL,
    restaurant_id integer,
    account_id integer NOT NULL,
    profession_title integer NOT NULL
);


ALTER TABLE public.staff OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 20812)
-- Name: status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status (
    id integer NOT NULL,
    status character varying(75) NOT NULL
);


ALTER TABLE public.status OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 20974)
-- Name: stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock (
    id integer NOT NULL,
    quantity integer NOT NULL,
    reception_date timestamp without time zone NOT NULL,
    expiry_date timestamp without time zone NOT NULL,
    article_id integer,
    restaurant_id integer NOT NULL,
    ingredient_id integer
);


ALTER TABLE public.stock OWNER TO postgres;

--
-- TOC entry 2936 (class 0 OID 20797)
-- Dependencies: 196
-- Data for Name: access_rights; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.access_rights (id, grade) VALUES (1, 'Owner');
INSERT INTO public.access_rights (id, grade) VALUES (2, 'Manager');
INSERT INTO public.access_rights (id, grade) VALUES (3, 'Employee');
INSERT INTO public.access_rights (id, grade) VALUES (4, 'Customer');


--
-- TOC entry 2941 (class 0 OID 20822)
-- Dependencies: 201
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.account (id, last_name, first_name, password, email, phone_number, street, city, postal_code, access_rights) VALUES (1, 'Smith', 'John', 'crypt1', 'john.smith@gmail.com', '0611223344', '1, rue de la convention', '95555', 'Ville-sur-test', 1);
INSERT INTO public.account (id, last_name, first_name, password, email, phone_number, street, city, postal_code, access_rights) VALUES (2, 'Gaukrogers', 'Marigold', 'crypt2', 'g.marigold14@outlook.com', '0700112233', '7, rue Jean Vilar, Appartement 5-A', '99555', 'Ville-sur-test', 2);
INSERT INTO public.account (id, last_name, first_name, password, email, phone_number, street, city, postal_code, access_rights) VALUES (3, 'Duranseau', 'Stéphane', 'crypt3', 'duranseau.stephane@protonmail.com', '0605060302', '7, rue Jean Vilar, Appartement 5-B', '99555', 'Ville-sur-test', 3);
INSERT INTO public.account (id, last_name, first_name, password, email, phone_number, street, city, postal_code, access_rights) VALUES (4, 'Laderoute', 'Musette', 'crypt4', 'laderoute.musette@laposte.net', '0102030405', '10, Rue de Strasbourg', '99555', 'Ville-sur-test', 4);
INSERT INTO public.account (id, last_name, first_name, password, email, phone_number, street, city, postal_code, access_rights) VALUES (5, 'D''Aubigné', 'Aubine', 'crypt5', 'daubigne.aubine@yahoo.fr', '0203040506', '70, rue Goya', '95555', 'Ville-sur-test', 4);
INSERT INTO public.account (id, last_name, first_name, password, email, phone_number, street, city, postal_code, access_rights) VALUES (6, 'Mainville', 'Elita', 'crypt6', 'mainville.elita@live.fr', '0204040506', '50, Place de la Gare', '95555', 'Ville-sur-test', 4);
INSERT INTO public.account (id, last_name, first_name, password, email, phone_number, street, city, postal_code, access_rights) VALUES (7, 'Boutot', 'Baptiste', 'crypt7', 'b.boutot88@free.fr', '0203840505', '6, rue des Nations Unies', '95555', 'Ville-sur-test', 3);
INSERT INTO public.account (id, last_name, first_name, password, email, phone_number, street, city, postal_code, access_rights) VALUES (8, 'Fauna', 'Sylvain', 'crypt8', 'faunasylvain@lycos.fr', '0203040506', '67, Rue du Limas', '95555', 'Ville-sur-test', 2);
INSERT INTO public.account (id, last_name, first_name, password, email, phone_number, street, city, postal_code, access_rights) VALUES (9, 'Malagigi', 'Mothé', 'crypt9', 'malmot@protonmail.com', '0288888806', '55, rue des six frères Ruellan', '95555', 'Ville-sur-test', 4);
INSERT INTO public.account (id, last_name, first_name, password, email, phone_number, street, city, postal_code, access_rights) VALUES (10, 'Desnoyers', 'Dorothée ', 'crypt10', 'desnoyerdorothee@gmail.com', '0255540506', '51, Rue Marie De Médicis', '95555', 'Ville-sur-test', 4);
INSERT INTO public.account (id, last_name, first_name, password, email, phone_number, street, city, postal_code, access_rights) VALUES (11, 'Granville', 'René', 'crypt11', 'rene.granville@orange.fr', '0111140506', '61, rue des Coudriers', '95555', 'Ville-sur-test', 3);
INSERT INTO public.account (id, last_name, first_name, password, email, phone_number, street, city, postal_code, access_rights) VALUES (12, 'Delmare', 'Corbin', 'crypt12', 'corbindelmare@gmail.com', '0222334455', '5, rue du Fossé des Tanneurs', '95555', 'Ville-sur-test', 4);
INSERT INTO public.account (id, last_name, first_name, password, email, phone_number, street, city, postal_code, access_rights) VALUES (13, 'Carignan', 'Inès', 'crypt13', 'ignes.carignan@gmail.com', '0212374455', '82, avenue de Bouvines', '95555', 'Ville-sur-test', 2);
INSERT INTO public.account (id, last_name, first_name, password, email, phone_number, street, city, postal_code, access_rights) VALUES (14, 'Melanson', 'Catherine', 'crypt14', 'catherine.melanson@gmail.com', '0114046447', '12, avenue Jules Ferry', '95555', 'Ville-sur-test', 3);
INSERT INTO public.account (id, last_name, first_name, password, email, phone_number, street, city, postal_code, access_rights) VALUES (15, 'Charlebois', 'Gaspard', 'crypt15', 'charleboisgaspard@gmail.com', '0160885565', '14, rue des six frères Ruellan', '95555', 'Ville-sur-test', 3);


--
-- TOC entry 2940 (class 0 OID 20817)
-- Dependencies: 200
-- Data for Name: article; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.article (id, name, ean13_code, unit_price_excluding_vat, unit_price_including_vat, designation) VALUES (1, 'Pizza Margherita', 1234567, 7, 8, 'Pizza 30cm margherita');
INSERT INTO public.article (id, name, ean13_code, unit_price_excluding_vat, unit_price_including_vat, designation) VALUES (2, 'Coca Cola', 2345678, 2, 2, 'Canette coca-cola original 33cl');
INSERT INTO public.article (id, name, ean13_code, unit_price_excluding_vat, unit_price_including_vat, designation) VALUES (3, 'Brownie', 3456789, 3, 3, 'Brownie 1 pièce chocolat noir et noisette');
INSERT INTO public.article (id, name, ean13_code, unit_price_excluding_vat, unit_price_including_vat, designation) VALUES (4, 'Pizza Napolitaine', 4567890, 7, 8, 'Pizza 30cm napolitaine');
INSERT INTO public.article (id, name, ean13_code, unit_price_excluding_vat, unit_price_including_vat, designation) VALUES (5, 'Pizza Royale', 5678901, 9, 10, 'Pizza 30cm royale');
INSERT INTO public.article (id, name, ean13_code, unit_price_excluding_vat, unit_price_including_vat, designation) VALUES (6, 'San Pellegrino', 6789012, 2, 2, 'Bouteille 25cl San Pellegrino');


--
-- TOC entry 2948 (class 0 OID 20923)
-- Dependencies: 208
-- Data for Name: bill; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.bill (number_id, num_vat, num_siren, price_excluding_vat, price_including_vat, bill_date, street, city, postal_code, order_id) VALUES (123456, 12345678, 123456789, 11.00, 12.10, '2020-04-12 16:08:00', '10, Rue de Strasbourg', '99555', 'Ville-sur-test', 1);
INSERT INTO public.bill (number_id, num_vat, num_siren, price_excluding_vat, price_including_vat, bill_date, street, city, postal_code, order_id) VALUES (123457, 12345678, 123456789, 15.00, 16.50, '2020-04-12 16:54:00', '70, rue Goya', '95555', 'Ville-sur-test', 2);
INSERT INTO public.bill (number_id, num_vat, num_siren, price_excluding_vat, price_including_vat, bill_date, street, city, postal_code, order_id) VALUES (123458, 12345678, 123456789, 7.00, 7.70, '2020-04-12 18:33:00', '50, Place de la Gare', '95555', 'Ville-sur-test', 3);
INSERT INTO public.bill (number_id, num_vat, num_siren, price_excluding_vat, price_including_vat, bill_date, street, city, postal_code, order_id) VALUES (123459, 12345678, 123456789, 7.00, 7.70, '2020-04-12 19:45:00', '50, Place de la Gare', '95555', 'Ville-sur-test', 4);
INSERT INTO public.bill (number_id, num_vat, num_siren, price_excluding_vat, price_including_vat, bill_date, street, city, postal_code, order_id) VALUES (123460, 12345678, 123456789, 14.00, 15.40, '2020-04-12 21:02:00', '55, rue des six frères Ruellan', '95555', 'Ville-sur-test', 5);


--
-- TOC entry 2950 (class 0 OID 20957)
-- Dependencies: 210
-- Data for Name: command_line; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.command_line (id, order_id, article_id, quantity) VALUES (1, 1, 1, 1);
INSERT INTO public.command_line (id, order_id, article_id, quantity) VALUES (2, 1, 2, 2);
INSERT INTO public.command_line (id, order_id, article_id, quantity) VALUES (3, 2, 3, 5);
INSERT INTO public.command_line (id, order_id, article_id, quantity) VALUES (4, 3, 4, 1);
INSERT INTO public.command_line (id, order_id, article_id, quantity) VALUES (5, 4, 4, 1);
INSERT INTO public.command_line (id, order_id, article_id, quantity) VALUES (6, 5, 1, 2);
INSERT INTO public.command_line (id, order_id, article_id, quantity) VALUES (7, 6, 5, 2);
INSERT INTO public.command_line (id, order_id, article_id, quantity) VALUES (8, 6, 6, 2);


--
-- TOC entry 2945 (class 0 OID 20881)
-- Dependencies: 205
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customer (id, delivery_address, account_id) VALUES (1, '10, Rue de Strasbourg, 99555, Ville-sur-test', 4);
INSERT INTO public.customer (id, delivery_address, account_id) VALUES (2, '70, rue Goya, 95555, Ville-sur-test', 5);
INSERT INTO public.customer (id, delivery_address, account_id) VALUES (3, '50, Place de la Gare, 95555, Ville-sur-test', 6);
INSERT INTO public.customer (id, delivery_address, account_id) VALUES (4, '55, rue des six frères Ruellan, 95555, Ville-sur-test', 9);
INSERT INTO public.customer (id, delivery_address, account_id) VALUES (5, '51, Rue Marie De Médicis, 95555, Ville-sur-test', 10);


--
-- TOC entry 2949 (class 0 OID 20934)
-- Dependencies: 209
-- Data for Name: delivery; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.delivery (id, address_client, id_client, employee_id, order_id) VALUES (1, '10, Rue de Strasbourg, 99555, Ville-sur-test', 1, 4, 1);
INSERT INTO public.delivery (id, address_client, id_client, employee_id, order_id) VALUES (2, '70, rue Goya, 95555, Ville-sur-test', 2, 3, 2);
INSERT INTO public.delivery (id, address_client, id_client, employee_id, order_id) VALUES (3, '50, Place de la Gare, 95555, Ville-sur-test', 3, 6, 4);
INSERT INTO public.delivery (id, address_client, id_client, employee_id, order_id) VALUES (4, '55, rue des six frères Ruellan, 95555, Ville-sur-test', 4, 6, 5);


--
-- TOC entry 2943 (class 0 OID 20859)
-- Dependencies: 203
-- Data for Name: ingredient; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ingredient (id, name, designation) VALUES (1, 'Tomate', 'tomates grappes');
INSERT INTO public.ingredient (id, name, designation) VALUES (2, 'Olive noire', 'olives noires denoyautées');
INSERT INTO public.ingredient (id, name, designation) VALUES (3, 'Mozzarella', 'mozarella di buffala');
INSERT INTO public.ingredient (id, name, designation) VALUES (4, 'Basilic', 'basilic frais en bouquet');
INSERT INTO public.ingredient (id, name, designation) VALUES (5, 'Anchois', 'conserve anchois 125gr');
INSERT INTO public.ingredient (id, name, designation) VALUES (6, 'Oeuf', 'oeuf élevage au sol');
INSERT INTO public.ingredient (id, name, designation) VALUES (7, 'Merguez', 'merguez rouleau 1m');


--
-- TOC entry 2944 (class 0 OID 20864)
-- Dependencies: 204
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (id, num_command, status, paid_for, restaurant_id) VALUES (1, 58, 2, 1, 1);
INSERT INTO public.orders (id, num_command, status, paid_for, restaurant_id) VALUES (2, 59, 4, 0, 2);
INSERT INTO public.orders (id, num_command, status, paid_for, restaurant_id) VALUES (3, 60, 5, 1, 3);
INSERT INTO public.orders (id, num_command, status, paid_for, restaurant_id) VALUES (4, 61, 3, 1, 4);
INSERT INTO public.orders (id, num_command, status, paid_for, restaurant_id) VALUES (5, 62, 1, 0, 5);
INSERT INTO public.orders (id, num_command, status, paid_for, restaurant_id) VALUES (6, 63, 1, 1, 6);


--
-- TOC entry 2937 (class 0 OID 20802)
-- Dependencies: 197
-- Data for Name: profession_title; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.profession_title (id, title) VALUES (1, 'Director');
INSERT INTO public.profession_title (id, title) VALUES (2, 'Manager');
INSERT INTO public.profession_title (id, title) VALUES (3, 'Delivery man');
INSERT INTO public.profession_title (id, title) VALUES (4, 'Cook');


--
-- TOC entry 2947 (class 0 OID 20906)
-- Dependencies: 207
-- Data for Name: quantity_ingredient_recipe; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.quantity_ingredient_recipe (id, quantity_ingredient_recipe, ingredient_id, recipe_id) VALUES (1, '3', 1, 1);
INSERT INTO public.quantity_ingredient_recipe (id, quantity_ingredient_recipe, ingredient_id, recipe_id) VALUES (2, '8', 2, 1);
INSERT INTO public.quantity_ingredient_recipe (id, quantity_ingredient_recipe, ingredient_id, recipe_id) VALUES (3, '2', 3, 1);
INSERT INTO public.quantity_ingredient_recipe (id, quantity_ingredient_recipe, ingredient_id, recipe_id) VALUES (4, 'Une feuiller de ', 4, 1);
INSERT INTO public.quantity_ingredient_recipe (id, quantity_ingredient_recipe, ingredient_id, recipe_id) VALUES (5, '4', 5, 2);
INSERT INTO public.quantity_ingredient_recipe (id, quantity_ingredient_recipe, ingredient_id, recipe_id) VALUES (6, '1', 6, 3);
INSERT INTO public.quantity_ingredient_recipe (id, quantity_ingredient_recipe, ingredient_id, recipe_id) VALUES (7, '100gr', 7, 3);


--
-- TOC entry 2946 (class 0 OID 20892)
-- Dependencies: 206
-- Data for Name: recipe; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.recipe (id, name, recipe, article_id) VALUES (1, 'Pizza Margherita', 'Raptim igitur properantes ut motus sui rumores celeritate nimia praevenirent, 
	vigore corporum ac levitate confisi per flexuosas semitas ad summitates collium tardius evadebant. 
	et cum superatis difficultatibus arduis ad supercilia venissent fluvii Melanis alti et verticosi, 
	qui pro muro tuetur accolas circumfusus, augente nocte adulta terrorem quievere paulisper lucem 
	opperientes. arbitrabantur enim nullo inpediente transgressi inopino adcursu 
	adposita quaeque vastare, sed in cassum labores pertulere gravissimos.', 1);
INSERT INTO public.recipe (id, name, recipe, article_id) VALUES (2, 'Pizza Napolitaine', 'Postremo ad id indignitatis est ventum, ut cum 
	peregrini ob formidatam haut ita dudum alimentorum inopiam pellerentur ab urbe praecipites, sectatoribus 
	disciplinarum liberalium inpendio paucis sine respiratione ulla extrusis, tenerentur minimarum adseclae 
	veri, quique id simularunt ad tempus, et tria milia saltatricum ne interpellata 
	quidem cum choris totidemque remanerent magistris.', 4);
INSERT INTO public.recipe (id, name, recipe, article_id) VALUES (3, 'Pizza Royale', 'Vide, quantum, inquam, fallare, Torquate. oratio me istius philosophi non offendit; 
	nam et complectitur verbis, quod vult, et dicit plane, quod intellegam; et tamen ego a philosopho, si 
	afferat eloquentiam, non asperner, si non habeat, non admodum flagitem. re mihi non aeque satisfacit, 
	et quidem locis pluribus. sed quot homines, tot sententiae; falli igitur possumus.', 5);


--
-- TOC entry 2938 (class 0 OID 20807)
-- Dependencies: 198
-- Data for Name: restaurant; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.restaurant (id, email_address, phone_number, street, city, postal_code) VALUES (1, 'restaurant1@gmail.com', 145464748, '5 rue de vaugirard', '95555', 'Ville-sur-test');
INSERT INTO public.restaurant (id, email_address, phone_number, street, city, postal_code) VALUES (2, 'restaurant2@gmail.com', 123242526, '12 avenue Victor Hugo', '99555', 'Ville-sur-test');
INSERT INTO public.restaurant (id, email_address, phone_number, street, city, postal_code) VALUES (3, 'restaurant3@gmail.com', 112131415, '95 boulevard Jean-Jaurès', '99555', 'Ville-sur-test');
INSERT INTO public.restaurant (id, email_address, phone_number, street, city, postal_code) VALUES (4, 'restaurant4@gmail.com', 141424344, '3 avenue Emile Zola', '99555', 'Ville-sur-test');
INSERT INTO public.restaurant (id, email_address, phone_number, street, city, postal_code) VALUES (5, 'restaurant5@gmail.com', 196857412, '5 rue des entrepreneurs', '99555', 'Ville-sur-test');
INSERT INTO public.restaurant (id, email_address, phone_number, street, city, postal_code) VALUES (6, 'restaurant6@gmail.com', 154726584, '14 rue beaugrenelle', '99555', 'Ville-sur-test');


--
-- TOC entry 2942 (class 0 OID 20836)
-- Dependencies: 202
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.staff (id, restaurant_id, account_id, profession_title) VALUES (1, NULL, 1, 1);
INSERT INTO public.staff (id, restaurant_id, account_id, profession_title) VALUES (2, 1, 2, 2);
INSERT INTO public.staff (id, restaurant_id, account_id, profession_title) VALUES (3, 1, 3, 3);
INSERT INTO public.staff (id, restaurant_id, account_id, profession_title) VALUES (4, 2, 7, 3);
INSERT INTO public.staff (id, restaurant_id, account_id, profession_title) VALUES (5, 3, 8, 2);
INSERT INTO public.staff (id, restaurant_id, account_id, profession_title) VALUES (6, 4, 11, 3);
INSERT INTO public.staff (id, restaurant_id, account_id, profession_title) VALUES (7, 5, 12, 3);
INSERT INTO public.staff (id, restaurant_id, account_id, profession_title) VALUES (8, 6, 13, 2);
INSERT INTO public.staff (id, restaurant_id, account_id, profession_title) VALUES (9, 2, 14, 4);
INSERT INTO public.staff (id, restaurant_id, account_id, profession_title) VALUES (10, 4, 15, 4);


--
-- TOC entry 2939 (class 0 OID 20812)
-- Dependencies: 199
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.status (id, status) VALUES (1, 'En attente de préparation');
INSERT INTO public.status (id, status) VALUES (2, 'En cours de préparation');
INSERT INTO public.status (id, status) VALUES (3, 'Prête à être livrée');
INSERT INTO public.status (id, status) VALUES (4, 'En cours de livraison');
INSERT INTO public.status (id, status) VALUES (5, 'Livrée');


--
-- TOC entry 2951 (class 0 OID 20974)
-- Dependencies: 211
-- Data for Name: stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.stock (id, quantity, reception_date, expiry_date, article_id, restaurant_id, ingredient_id) VALUES (1, 10, '2020-05-23 15:50:00', '2020-05-25 00:00:00', NULL, 1, 3);
INSERT INTO public.stock (id, quantity, reception_date, expiry_date, article_id, restaurant_id, ingredient_id) VALUES (2, 50, '2020-05-23 12:30:00', '2023-05-23 00:00:00', 2, 1, NULL);
INSERT INTO public.stock (id, quantity, reception_date, expiry_date, article_id, restaurant_id, ingredient_id) VALUES (3, 37, '2020-05-09 14:27:00', '2021-05-01 00:00:00', NULL, 1, 2);
INSERT INTO public.stock (id, quantity, reception_date, expiry_date, article_id, restaurant_id, ingredient_id) VALUES (4, 60, '2020-05-19 08:20:00', '2020-05-26 00:00:00', NULL, 2, 1);
INSERT INTO public.stock (id, quantity, reception_date, expiry_date, article_id, restaurant_id, ingredient_id) VALUES (5, 8, '2020-05-23 08:20:00', '2020-05-26 00:00:00', NULL, 3, 4);
INSERT INTO public.stock (id, quantity, reception_date, expiry_date, article_id, restaurant_id, ingredient_id) VALUES (6, 12, '2020-05-23 08:20:00', '2020-05-26 00:00:00', NULL, 4, 5);
INSERT INTO public.stock (id, quantity, reception_date, expiry_date, article_id, restaurant_id, ingredient_id) VALUES (7, 25, '2020-05-23 08:20:00', '2020-05-30 00:00:00', NULL, 5, 6);
INSERT INTO public.stock (id, quantity, reception_date, expiry_date, article_id, restaurant_id, ingredient_id) VALUES (8, 31, '2020-05-23 08:20:00', '2020-06-23 00:00:00', 3, 6, NULL);
INSERT INTO public.stock (id, quantity, reception_date, expiry_date, article_id, restaurant_id, ingredient_id) VALUES (9, 2, '2020-05-23 08:20:00', '2020-05-01 00:00:00', NULL, 4, 7);
INSERT INTO public.stock (id, quantity, reception_date, expiry_date, article_id, restaurant_id, ingredient_id) VALUES (10, 8, '2020-05-23 08:20:00', '2020-05-25 00:00:00', NULL, 2, 1);
INSERT INTO public.stock (id, quantity, reception_date, expiry_date, article_id, restaurant_id, ingredient_id) VALUES (11, 80, '2020-05-23 08:20:00', '2020-05-25 00:00:00', NULL, 3, 2);
INSERT INTO public.stock (id, quantity, reception_date, expiry_date, article_id, restaurant_id, ingredient_id) VALUES (12, 5, '2020-05-23 08:20:00', '2020-05-02 00:00:00', NULL, 4, 3);
INSERT INTO public.stock (id, quantity, reception_date, expiry_date, article_id, restaurant_id, ingredient_id) VALUES (13, 8, '2020-05-23 08:20:00', '2020-05-25 00:00:00', NULL, 5, 4);
INSERT INTO public.stock (id, quantity, reception_date, expiry_date, article_id, restaurant_id, ingredient_id) VALUES (14, 18, '2020-05-23 08:20:00', '2020-05-25 00:00:00', NULL, 6, 5);
INSERT INTO public.stock (id, quantity, reception_date, expiry_date, article_id, restaurant_id, ingredient_id) VALUES (15, 5, '2020-05-23 08:20:00', '2020-05-25 00:00:00', NULL, 3, 6);


--
-- TOC entry 2746 (class 2606 OID 20801)
-- Name: access_rights access_rights_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.access_rights
    ADD CONSTRAINT access_rights_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 20829)
-- Name: account account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 20821)
-- Name: article article_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 20927)
-- Name: bill bill_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT bill_pkey PRIMARY KEY (number_id);


--
-- TOC entry 2790 (class 2606 OID 20961)
-- Name: command_line command_line_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.command_line
    ADD CONSTRAINT command_line_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 20885)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 20938)
-- Name: delivery delivery_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT delivery_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 20863)
-- Name: ingredient ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredient
    ADD CONSTRAINT ingredient_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 20868)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 20806)
-- Name: profession_title profession_title_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profession_title
    ADD CONSTRAINT profession_title_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 20910)
-- Name: quantity_ingredient_recipe quantity_ingredient_recipe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quantity_ingredient_recipe
    ADD CONSTRAINT quantity_ingredient_recipe_pkey PRIMARY KEY (id);


--
-- TOC entry 2774 (class 2606 OID 20899)
-- Name: recipe recipe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipe
    ADD CONSTRAINT recipe_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 20811)
-- Name: restaurant restaurant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant
    ADD CONSTRAINT restaurant_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 20840)
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 20816)
-- Name: status status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);


--
-- TOC entry 2795 (class 2606 OID 20978)
-- Name: stock stock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 1259 OID 20835)
-- Name: account_fk_account_access_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX account_fk_account_access_idx ON public.account USING btree (access_rights);


--
-- TOC entry 2779 (class 1259 OID 20933)
-- Name: bill_fk_order_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX bill_fk_order_id_idx ON public.bill USING btree (order_id);


--
-- TOC entry 2787 (class 1259 OID 20973)
-- Name: command_line_fk_article_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX command_line_fk_article_id_idx ON public.command_line USING btree (article_id);


--
-- TOC entry 2788 (class 1259 OID 20972)
-- Name: command_line_fk_order_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX command_line_fk_order_id_idx ON public.command_line USING btree (order_id);


--
-- TOC entry 2769 (class 1259 OID 20891)
-- Name: customer_fk_customer_account_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX customer_fk_customer_account_idx ON public.customer USING btree (account_id);


--
-- TOC entry 2782 (class 1259 OID 20955)
-- Name: delivery_fk_client_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX delivery_fk_client_id_idx ON public.delivery USING btree (id_client);


--
-- TOC entry 2783 (class 1259 OID 20954)
-- Name: delivery_fk_employee_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX delivery_fk_employee_id_idx ON public.delivery USING btree (employee_id);


--
-- TOC entry 2784 (class 1259 OID 20956)
-- Name: delivery_fk_order_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX delivery_fk_order_id_idx ON public.delivery USING btree (order_id);


--
-- TOC entry 2765 (class 1259 OID 20880)
-- Name: orders_fk_order_status_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_fk_order_status_id_idx ON public.orders USING btree (status);


--
-- TOC entry 2766 (class 1259 OID 20879)
-- Name: orders_fk_restaurant_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_fk_restaurant_id_idx ON public.orders USING btree (restaurant_id);


--
-- TOC entry 2775 (class 1259 OID 20921)
-- Name: quantity_ingredient_recipe_fk_ingredient_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX quantity_ingredient_recipe_fk_ingredient_id_idx ON public.quantity_ingredient_recipe USING btree (ingredient_id);


--
-- TOC entry 2776 (class 1259 OID 20922)
-- Name: quantity_ingredient_recipe_fk_recipe_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX quantity_ingredient_recipe_fk_recipe_id_idx ON public.quantity_ingredient_recipe USING btree (recipe_id);


--
-- TOC entry 2772 (class 1259 OID 20905)
-- Name: recipe_fk_article_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX recipe_fk_article_id_idx ON public.recipe USING btree (article_id);


--
-- TOC entry 2758 (class 1259 OID 20856)
-- Name: staff_fk_account_employee_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX staff_fk_account_employee_idx ON public.staff USING btree (account_id);


--
-- TOC entry 2759 (class 1259 OID 20857)
-- Name: staff_fk_restaurant_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX staff_fk_restaurant_id_idx ON public.staff USING btree (restaurant_id);


--
-- TOC entry 2760 (class 1259 OID 20858)
-- Name: staff_fk_staff_profession_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX staff_fk_staff_profession_id_idx ON public.staff USING btree (profession_title);


--
-- TOC entry 2791 (class 1259 OID 20995)
-- Name: stock_fk_article_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX stock_fk_article_id_idx ON public.stock USING btree (article_id);


--
-- TOC entry 2792 (class 1259 OID 20996)
-- Name: stock_fk_ingredient_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX stock_fk_ingredient_id_idx ON public.stock USING btree (ingredient_id);


--
-- TOC entry 2793 (class 1259 OID 20994)
-- Name: stock_fk_restaurant_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX stock_fk_restaurant_id_idx ON public.stock USING btree (restaurant_id);


--
-- TOC entry 2796 (class 2606 OID 20830)
-- Name: account account_access_rights_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_access_rights_fkey FOREIGN KEY (access_rights) REFERENCES public.access_rights(id);


--
-- TOC entry 2806 (class 2606 OID 20928)
-- Name: bill bill_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bill
    ADD CONSTRAINT bill_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- TOC entry 2810 (class 2606 OID 20962)
-- Name: command_line command_line_article_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.command_line
    ADD CONSTRAINT command_line_article_id_fkey FOREIGN KEY (article_id) REFERENCES public.article(id);


--
-- TOC entry 2811 (class 2606 OID 20967)
-- Name: command_line command_line_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.command_line
    ADD CONSTRAINT command_line_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- TOC entry 2802 (class 2606 OID 20886)
-- Name: customer customer_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id);


--
-- TOC entry 2808 (class 2606 OID 20944)
-- Name: delivery delivery_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT delivery_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.staff(id);


--
-- TOC entry 2807 (class 2606 OID 20939)
-- Name: delivery delivery_id_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT delivery_id_client_fkey FOREIGN KEY (id_client) REFERENCES public.customer(id);


--
-- TOC entry 2809 (class 2606 OID 20949)
-- Name: delivery delivery_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT delivery_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- TOC entry 2800 (class 2606 OID 20869)
-- Name: orders orders_restaurant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES public.restaurant(id);


--
-- TOC entry 2801 (class 2606 OID 20874)
-- Name: orders orders_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_status_fkey FOREIGN KEY (status) REFERENCES public.status(id);


--
-- TOC entry 2804 (class 2606 OID 20911)
-- Name: quantity_ingredient_recipe quantity_ingredient_recipe_ingredient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quantity_ingredient_recipe
    ADD CONSTRAINT quantity_ingredient_recipe_ingredient_id_fkey FOREIGN KEY (ingredient_id) REFERENCES public.ingredient(id);


--
-- TOC entry 2805 (class 2606 OID 20916)
-- Name: quantity_ingredient_recipe quantity_ingredient_recipe_recipe_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quantity_ingredient_recipe
    ADD CONSTRAINT quantity_ingredient_recipe_recipe_id_fkey FOREIGN KEY (recipe_id) REFERENCES public.recipe(id);


--
-- TOC entry 2803 (class 2606 OID 20900)
-- Name: recipe recipe_article_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipe
    ADD CONSTRAINT recipe_article_id_fkey FOREIGN KEY (article_id) REFERENCES public.article(id);


--
-- TOC entry 2797 (class 2606 OID 20841)
-- Name: staff staff_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id);


--
-- TOC entry 2798 (class 2606 OID 20846)
-- Name: staff staff_profession_title_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_profession_title_fkey FOREIGN KEY (profession_title) REFERENCES public.profession_title(id);


--
-- TOC entry 2799 (class 2606 OID 20851)
-- Name: staff staff_restaurant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES public.restaurant(id);


--
-- TOC entry 2812 (class 2606 OID 20979)
-- Name: stock stock_article_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_article_id_fkey FOREIGN KEY (article_id) REFERENCES public.article(id);


--
-- TOC entry 2813 (class 2606 OID 20984)
-- Name: stock stock_ingredient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_ingredient_id_fkey FOREIGN KEY (ingredient_id) REFERENCES public.ingredient(id);


--
-- TOC entry 2814 (class 2606 OID 20989)
-- Name: stock stock_restaurant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES public.restaurant(id);


-- Completed on 2020-05-09 11:34:35

--
-- PostgreSQL database dump complete
--

