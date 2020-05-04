USE mydb;

INSERT INTO restaurant
(
	id, email_address, phone_number, street, city, postal_code
)
VALUES
	(1, 'restaurant1@gmail.com', '0145464748', '5 rue de vaugirard', 95555, 'Ville-sur-test'),
	(2, 'restaurant2@gmail.com', '0123242526', '12 avenue Victor Hugo', 99555, 'Ville-sur-test'),
	(3, 'restaurant3@gmail.com', '0112131415', '95 boulevard Jean-Jaurès', 99555, 'Ville-sur-test'),
	(4, 'restaurant4@gmail.com', '0141424344', '3 avenue Emile Zola', 99555, 'Ville-sur-test'),
	(5, 'restaurant5@gmail.com', '0196857412', '5 rue des entrepreneurs', 99555, 'Ville-sur-test'),
	(6, 'restaurant6@gmail.com', '0154726584', '14 rue beaugrenelle', 99555, 'Ville-sur-test');
;



INSERT INTO access_rights
(
	id, grade
)
VALUES
	(1, 'Owner'),
	(2, 'Manager'),
	(3, 'Employee'),
	(4, 'Customer');



INSERT INTO account
(
	id, last_name, first_name, password, email, phone_number, street, city, postal_code, access_rights
)
VALUES
	(1, 'Smith', 'John', 'crypt1', 'john.smith@gmail.com', '0611223344', '1, rue de la convention', 95555, 'Ville-sur-test', 1),
	(2, 'Gaukrogers', 'Marigold', 'crypt2', 'g.marigold14@outlook.com', '0700112233', '7, rue Jean Vilar, Appartement 5-A', 99555,  'Ville-sur-test', 2),
	(3, 'Duranseau', 'Stéphane', 'crypt3', 'duranseau.stephane@protonmail.com', '0605060302', '7, rue Jean Vilar, Appartement 5-B', 99555,  'Ville-sur-test', 3 ),
	(4, 'Laderoute', 'Musette', 'crypt4', 'laderoute.musette@laposte.net', '0102030405', '10, Rue de Strasbourg', 99555, 'Ville-sur-test', 4),
	(5, 'D\'Aubigné', 'Aubine', 'crypt5', 'daubigne.aubine@yahoo.fr', '0203040506', '70, rue Goya', 95555, 'Ville-sur-test', 4),
	(6, 'Mainville', 'Elita', 'crypt6', 'mainville.elita@live.fr', '0204040506', '50, Place de la Gare', 95555, 'Ville-sur-test', 4),
	(7, 'Boutot', 'Baptiste', 'crypt7', 'b.boutot88@free.fr', '0203840505', '6, rue des Nations Unies', 95555, 'Ville-sur-test', 3),
	(8, 'Fauna', 'Sylvain', 'crypt8', 'faunasylvain@lycos.fr', '0203040506', '67, Rue du Limas', 95555, 'Ville-sur-test', 2),
	(9, 'Malagigi', 'Mothé', 'crypt9', 'malmot@protonmail.com', '0288888806', '55, rue des six frères Ruellan', 95555, 'Ville-sur-test', 4),
	(10, 'Desnoyers', 'Dorothée ', 'crypt10', 'desnoyerdorothee@gmail.com', '0255540506', '51, Rue Marie De Médicis', 95555, 'Ville-sur-test', 4),
	(11, 'Granville', 'René', 'crypt11', 'rene.granville@orange.fr', '0111140506', '61, rue des Coudriers', 95555, 'Ville-sur-test', 3),
	(12, 'Delmare', 'Corbin', 'crypt12', 'corbindelmare@gmail.com', '0222334455', '5, rue du Fossé des Tanneurs', 95555, 'Ville-sur-test', 4),
	(13, 'Carignan', 'Inès', 'crypt13', 'ignes.carignan@gmail.com', '0212374455', '82, avenue de Bouvines', 95555, 'Ville-sur-test', 2),
	(14, 'Melanson', 'Catherine', 'crypt14', 'catherine.melanson@gmail.com', '0114046447', '12, avenue Jules Ferry', 95555, 'Ville-sur-test', 3),
	(15, 'Charlebois', 'Gaspard', 'crypt15', 'charleboisgaspard@gmail.com', '0160885565', '14, rue des six frères Ruellan', 95555, 'Ville-sur-test', 3);

	
INSERT INTO profession_title
(
	id, title
)
VALUES
	(1, 'Director'),
	(2, 'Manager'),
	(3, 'Delivery man'),
	(4, 'Cook');
	

INSERT INTO staff
(
	id, restaurant_id, account_id, profession_title
)
VALUES
	(1, null, 1, 1),
	(2, 1, 2, 2),
	(3, 1, 3, 3),
	(4, 2, 7, 3),
	(5, 3, 8, 2),
	(6, 4, 11, 3),
	(7, 5, 12, 3),
	(8, 6, 13, 2),
	(9, 2, 14, 4),
	(10, 4, 15, 4);



INSERT INTO customer
(
	id, delivery_address, account_id
)
VALUES
	(1, '10, Rue de Strasbourg, 99555, Ville-sur-test', 4),
	(2, '70, rue Goya, 95555, Ville-sur-test', 5),
	(3, '50, Place de la Gare, 95555, Ville-sur-test', 6),
	(4, '55, rue des six frères Ruellan, 95555, Ville-sur-test', 9),
	(5, '51, Rue Marie De Médicis, 95555, Ville-sur-test', 10);



INSERT INTO article
(
	id, name, EAN13_code, unit_price_excluding_VAT, unit_price_including_VAT, designation
)
VALUES
	(1, 'Pizza Margherita', 1234567, 7, 7.7, 'Pizza 30cm margherita'),
	(2, 'Coca Cola', 2345678, 2, 2.20, 'Canette coca-cola original 33cl'),
	(3, 'Brownie', 3456789, 3, 3.3, 'Brownie 1 pièce chocolat noir et noisette'),
	(4, 'Pizza Napolitaine', 4567890, 7, 7.7, 'Pizza 30cm napolitaine'),
	(5, 'Pizza Royale', 5678901, 9, 9.9, 'Pizza 30cm royale'),
	(6, 'San Pellegrino', 6789012, 2, 2.2, 'Bouteille 25cl San Pellegrino');




INSERT INTO status
(
	id, status
)
VALUES
	(1, 'En attente de préparation'),
	(2, 'En cours de préparation'),
	(3, 'Prête à être livrée'),
	(4, 'En cours de livraison'),
	(5, 'Livrée');




INSERT INTO orders
(
	id, num_command, status, paid_for, restaurant_id
)
VALUES
	(1, 58, 2, 1, 1),
	(2, 59, 4, 0, 2),
	(3, 60, 5, 1, 3),
	(4, 61, 3, 1, 4),
	(5, 62, 1, 0, 5),
	(6, 63, 1, 1, 6);



INSERT INTO delivery
(
	id, address_client, id_client, employee_id, order_id
)
VALUES
	(1, '10, Rue de Strasbourg, 99555, Ville-sur-test', 1, 4, 1),
	(2, '70, rue Goya, 95555, Ville-sur-test', 2, 3, 2),
	(3, '50, Place de la Gare, 95555, Ville-sur-test', 3, 6, 4),
	(4, '55, rue des six frères Ruellan, 95555, Ville-sur-test', 4, 6, 5);



INSERT INTO ingredient
(
	id, name, designation
)
VALUES

	(1, 'Tomate', 'tomates grappes'),
	(2, 'Olive noire', 'olives noires denoyautées'),
	(3, 'Mozzarella', 'mozarella di buffala'),
	(4, 'Basilic', 'basilic frais en bouquet'),
	(5, 'Anchois', 'conserve anchois 125gr'),
	(6, 'Oeuf', 'oeuf élevage au sol'),
	(7, 'Merguez', 'merguez rouleau 1m');




INSERT INTO recipe
(
	id, name, recipe, article_id
)
VALUES
	(1, 'Pizza Margherita', 'Raptim igitur properantes ut motus sui rumores celeritate nimia praevenirent, 
	vigore corporum ac levitate confisi per flexuosas semitas ad summitates collium tardius evadebant. 
	et cum superatis difficultatibus arduis ad supercilia venissent fluvii Melanis alti et verticosi, 
	qui pro muro tuetur accolas circumfusus, augente nocte adulta terrorem quievere paulisper lucem 
	opperientes. arbitrabantur enim nullo inpediente transgressi inopino adcursu 
	adposita quaeque vastare, sed in cassum labores pertulere gravissimos.' , 1),
	(2, 'Pizza Napolitaine', 'Postremo ad id indignitatis est ventum, ut cum 
	peregrini ob formidatam haut ita dudum alimentorum inopiam pellerentur ab urbe praecipites, sectatoribus 
	disciplinarum liberalium inpendio paucis sine respiratione ulla extrusis, tenerentur minimarum adseclae 
	veri, quique id simularunt ad tempus, et tria milia saltatricum ne interpellata 
	quidem cum choris totidemque remanerent magistris.', 4),
	(3, 'Pizza Royale', 'Vide, quantum, inquam, fallare, Torquate. oratio me istius philosophi non offendit; 
	nam et complectitur verbis, quod vult, et dicit plane, quod intellegam; et tamen ego a philosopho, si 
	afferat eloquentiam, non asperner, si non habeat, non admodum flagitem. re mihi non aeque satisfacit, 
	et quidem locis pluribus. sed quot homines, tot sententiae; falli igitur possumus.', 5);



INSERT INTO command_line
(
	id, order_id, article_id, quantity
)
VALUES
	(1, 1, 1, 1),
	(2, 1, 2, 2),
	(3, 2, 3, 5),
	(4, 3, 4, 1),
	(5, 4, 4, 1),
	(6, 5, 1, 2),
	(7, 6, 5, 2),
	(8, 6, 6, 2);




INSERT INTO stock
(
	id, quantity, reception_date, expiry_date, article_id, restaurant_id, ingredient_id
)
VALUES
	(1, 10, '2020-05-23 15:50:00', '2020-05-25 00:00:00', null, 1, 3),
	(2, 50, '2020-05-23 12:30:00', '2023-05-23 00:00:00', 2, 1, null),
	(3, 37, '2020-05-09 14:27:00', '2021-05-01 00:00:00', null, 1, 2),
	(4, 60, '2020-05-19 08:20:00', '2020-05-26 00:00:00', null, 2, 1),
	(5, 8, '2020-05-23 08:20:00', '2020-05-26 00:00:00', null, 3, 4),
	(6, 12, '2020-05-23 08:20:00', '2020-05-26 00:00:00', null, 4, 5),
	(7, 25, '2020-05-23 08:20:00', '2020-05-30 00:00:00', null, 5, 6),
	(8, 31, '2020-05-23 08:20:00', '2020-06-23 00:00:00', 3, 6, null),
	(9, 2, '2020-05-23 08:20:00', '2020-05-01 00:00:00', null, 4, 7),
	(10, 8, '2020-05-23 08:20:00', '2020-05-25 00:00:00', null, 2, 1),
	(11, 80, '2020-05-23 08:20:00', '2020-05-25 00:00:00', null, 3, 2),
	(12, 5, '2020-05-23 08:20:00', '2020-05-02 00:00:00', null, 4, 3),
	(13, 8, '2020-05-23 08:20:00', '2020-05-25 00:00:00', null, 5, 4),
	(14, 18, '2020-05-23 08:20:00', '2020-05-25 00:00:00', null, 6, 5),
	(15, 5, '2020-05-23 08:20:00', '2020-05-25 00:00:00', null, 3, 6);



INSERT INTO bill
(
	number_id, numVAT, num_siren, price_excluding_VAT, price_including_VAT, bill_date, street, city, postal_code, order_id
)
VALUES
	(0123456, 012345678, 123456789, 11, 12.1, '2020-04-12 16:08:00', '10, Rue de Strasbourg', 99555, 'Ville-sur-test', 1),
	(0123457, 012345678, 123456789, 15, 16.5, '2020-04-12 16:54:00', '70, rue Goya', 95555, 'Ville-sur-test', 2),
	(0123458, 012345678, 123456789, 7, 7.7, '2020-04-12 18:33:00', '50, Place de la Gare', 95555, 'Ville-sur-test', 3),
	(0123459, 012345678, 123456789, 7, 7.7, '2020-04-12 19:45:00', '50, Place de la Gare', 95555, 'Ville-sur-test', 4),
	(0123460, 012345678, 123456789, 14, 15.4, '2020-04-12 21:02:00', '55, rue des six frères Ruellan', 95555, 'Ville-sur-test', 5);



INSERT INTO quantity_ingredient_recipe
(
	id, quantity_ingredient_recipe, ingredient_id, recipe_id
)
VALUES
	(1, 3, 1, 1),
	(2, 8, 2, 1),
	(3, 2, 3, 1),
	(4, 'Une feuiller de ', 4, 1),
	(5, 4, 5, 2),
	(6, 1, 6, 3),
	(7, '100gr', 7, 3);

