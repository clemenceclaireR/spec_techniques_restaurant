'Sélectionner tous les employés d\'un restaurant'
SELECT staff.id FROM staff INNER JOIN restaurant ON restaurant.id = 1 WHERE staff.restaurant_id = 1;

'Sélectionner les noms et prenoms tous les comptes où les drois d\'acces sont Customer'
SELECT account.last_name, account.first_name FROM account INNER JOIN access_rights ON account.access_rights = 4 WHERE access_rights.id = 4;

'Voir si un client à une commande en cours et quelle est son statut'
SELECT delivery.id, status.status, account.last_name, account.first_name 
FROM delivery
INNER JOIN customer ON customer.id = delivery.id_client
INNER JOIN orders ON orders.id = delivery.order_id
INNER JOIN status ON status.id = orders.status 
INNER JOIN account ON account.id = customer.account_id;

'Rechercher la recette d\'un article (pizza napolitaine)'
SELECT recipe.recipe FROM recipe INNER JOIN article ON recipe.article_id = article.id AND article.id = 4;

'Rechercher le prix hors taxe d\'un article en commande'
SELECT article.unit_price_excluding_VAT, article.name FROM article INNER JOIN command_line ON article.id = command_line.article_id;

'Rechercher l\'addresse d\'une facture d\'une commande qui n\{a pas éyé payéé'
SELECT bill.street, bill.postal_code, bill.city FROM bill INNER JOIN orders ON orders.paid_for = 0 AND orders.id = bill.order_id;

'Recherher  l\'addresse de livraison d\'une commande en cours de livraison'
SELECT delivery.address_client FROM delivery INNER JOIN orders ON orders.status = 4 AND orders.id = delivery.order_id;

'Retrouver l\'intitulé de profession d\'un membre du personnel'
SELECT title FROM profession_title INNER JOIN staff ON staff.id = 1 AND staff.profession_title = profession_title.id;

'Rechercher la quantité donnée d\'un ingredient pour une recette'
SELECT quantity_ingredient_recipe FROM quantity_ingredient_recipe  INNER JOIN ingredient ON ingredient.id = 2
INNER JOIN recipe  ON recipe.id = 1 AND ingredient.id = quantity_ingredient_recipe.ingredient_id ;

'STOCKS'

'Sélectionner les stocks d\'olives dans un restaurant donné'
SELECT stock.quantity FROM stock INNER JOIN ingredient ON ingredient.id = 2 AND ingredient.id = stock.ingredient_id;

'Afficher tous les stocks d\'un restaurant'
SELECT stock.id, stock.article_id, stock.ingredient_id FROM stock INNER JOIN restaurant ON  stock.restaurant_id = restaurant.id AND restaurant.id = 3 ;

'Afficher tous les stocks périmés de tous les restaurants'
SELECT stock.id, stock.article_id, stock.ingredient_id FROM stock WHERE stock.expiry_date < now();

'Afficher tous les stocks périmés d\'restaurant'
SELECT stock.id, stock.article_id, stock.ingredient_id FROM stock INNER JOIN restaurant ON stock.restaurant_id = restaurant.id WHERE restaurant.id = 4 AND stock.expiry_date < now();