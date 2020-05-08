--
-- Table structure for table `access_rights`
--

CREATE TABLE "access_rights" (  "id" INTEGER NOT NULL ,
  "grade" VARCHAR(45) NOT NULL ,
  PRIMARY KEY ("id")
); 


--
-- Table structure for table `profession_title`
--

CREATE TABLE "profession_title" (  "id" INTEGER NOT NULL ,
  "title" VARCHAR(75) NOT NULL ,
  PRIMARY KEY ("id")
); 


--
-- Table structure for table `restaurant`
--

CREATE TABLE "restaurant" (  "id" INTEGER NOT NULL ,
  "email_address" VARCHAR(75) NOT NULL ,
  "phone_number" INTEGER NOT NULL ,
  "street" VARCHAR(200) NOT NULL ,
  "city" VARCHAR(75) NOT NULL ,
  "postal_code" VARCHAR(45) NOT NULL ,
  PRIMARY KEY ("id")
); 


--
-- Table structure for table `status`
--

CREATE TABLE "status" (  "id" INTEGER NOT NULL ,
  "status" VARCHAR(75) NOT NULL ,
  PRIMARY KEY ("id")
); 


--
-- Table structure for table `article`
--

CREATE TABLE "article" (  "id" INTEGER NOT NULL ,
  "name" VARCHAR(100) NOT NULL ,
  "ean13_code" INTEGER NOT NULL ,
  "unit_price_excluding_vat" INTEGER NOT NULL ,
  "unit_price_including_vat" INTEGER NOT NULL ,
  "designation" VARCHAR(100) NOT NULL ,
  PRIMARY KEY ("id")
); 


--
-- Table structure for table `account`
--

CREATE TABLE "account" (  "id" INTEGER NOT NULL ,
  "last_name" VARCHAR(60) NOT NULL ,
  "first_name" VARCHAR(60) NOT NULL ,
  "password" VARCHAR(100) NOT NULL ,
  "email" VARCHAR(75) NOT NULL ,
  "phone_number" VARCHAR(45) NOT NULL ,
  "street" VARCHAR(200) NOT NULL ,
  "city" VARCHAR(75) NOT NULL ,
  "postal_code" VARCHAR(45) NOT NULL ,
  "access_rights" INTEGER NOT NULL ,
  PRIMARY KEY ("id"),FOREIGN KEY ("access_rights") REFERENCES "access_rights" ( "id" ) ON UPDATE NO ACTION ON DELETE NO ACTION
); 
CREATE INDEX "account_fk_account_access_idx" ON "account" ("access_rights");


--
-- Table structure for table `staff`
--

CREATE TABLE "staff" (  "id" INTEGER NOT NULL ,
  "restaurant_id" INTEGER NULL ,
  "account_id" INTEGER NOT NULL ,
  "profession_title" INTEGER NOT NULL ,
  PRIMARY KEY ("id"),FOREIGN KEY ("account_id") REFERENCES "account" ( "id" ) ON UPDATE NO ACTION ON DELETE NO ACTION,FOREIGN KEY ("profession_title") REFERENCES "profession_title" ( "id" ) ON UPDATE NO ACTION ON DELETE NO ACTION,FOREIGN KEY ("restaurant_id") REFERENCES "restaurant" ( "id" ) ON UPDATE NO ACTION ON DELETE NO ACTION
); 
CREATE INDEX "staff_fk_account_employee_idx" ON "staff" ("account_id");
CREATE INDEX "staff_fk_restaurant_id_idx" ON "staff" ("restaurant_id");
CREATE INDEX "staff_fk_staff_profession_id_idx" ON "staff" ("profession_title");


--
-- Table structure for table `ingredient`
--

CREATE TABLE "ingredient" (  "id" INTEGER NOT NULL ,
  "name" VARCHAR(100) NOT NULL ,
  "designation" VARCHAR(100) NOT NULL ,
  PRIMARY KEY ("id")
); 


--
-- Table structure for table `orders`
--

CREATE TABLE "orders" (  "id" INTEGER NOT NULL ,
  "num_command" INTEGER NOT NULL ,
  "status" INTEGER NOT NULL ,
  "paid_for" SMALLINT NOT NULL ,
  "restaurant_id" INTEGER NOT NULL ,
  PRIMARY KEY ("id"),FOREIGN KEY ("restaurant_id") REFERENCES "restaurant" ( "id" ) ON UPDATE NO ACTION ON DELETE NO ACTION,FOREIGN KEY ("status") REFERENCES "status" ( "id" ) ON UPDATE NO ACTION ON DELETE NO ACTION
); 
CREATE INDEX "orders_fk_restaurant_id_idx" ON "orders" ("restaurant_id");
CREATE INDEX "orders_fk_order_status_id_idx" ON "orders" ("status");


--
-- Table structure for table `customer`
--

CREATE TABLE "customer" (  "id" INTEGER NOT NULL ,
  "delivery_address" VARCHAR(200) NOT NULL ,
  "account_id" INTEGER NOT NULL ,
  PRIMARY KEY ("id"),FOREIGN KEY ("account_id") REFERENCES "account" ( "id" ) ON UPDATE NO ACTION ON DELETE NO ACTION
); 
CREATE INDEX "customer_fk_customer_account_idx" ON "customer" ("account_id");


--
-- Table structure for table `recipe`
--

CREATE TABLE "recipe" (  "id" INTEGER NOT NULL ,
  "name" VARCHAR(200) NOT NULL ,
  "recipe" TEXT NOT NULL ,
  "article_id" INTEGER NOT NULL ,
  PRIMARY KEY ("id"),FOREIGN KEY ("article_id") REFERENCES "article" ( "id" ) ON UPDATE NO ACTION ON DELETE NO ACTION
); 
CREATE INDEX "recipe_fk_article_id_idx" ON "recipe" ("article_id");


--
-- Table structure for table `quantity_ingredient_recipe`
--

CREATE TABLE "quantity_ingredient_recipe" (  "id" INTEGER NOT NULL ,
  "quantity_ingredient_recipe" VARCHAR(45) NOT NULL ,
  "ingredient_id" INTEGER NOT NULL ,
  "recipe_id" INTEGER NOT NULL ,
  PRIMARY KEY ("id"),FOREIGN KEY ("ingredient_id") REFERENCES "ingredient" ( "id" ) ON UPDATE NO ACTION ON DELETE NO ACTION,FOREIGN KEY ("recipe_id") REFERENCES "recipe" ( "id" ) ON UPDATE NO ACTION ON DELETE NO ACTION
); 
CREATE INDEX "quantity_ingredient_recipe_fk_ingredient_id_idx" ON "quantity_ingredient_recipe" ("ingredient_id");
CREATE INDEX "quantity_ingredient_recipe_fk_recipe_id_idx" ON "quantity_ingredient_recipe" ("recipe_id");


--
-- Table structure for table `bill`
--

CREATE TABLE "bill" (  "number_id" INTEGER NOT NULL ,
  "num_vat" INTEGER NOT NULL ,
  "num_siren" INTEGER NOT NULL ,
  "price_excluding_vat" NUMERIC(10,2) NOT NULL ,
  "price_including_vat" NUMERIC(10,2) NOT NULL ,
  "bill_date" TIMESTAMP NOT NULL ,
  "street" VARCHAR(200) NOT NULL ,
  "city" VARCHAR(75) NOT NULL ,
  "postal_code" VARCHAR(45) NOT NULL ,
  "order_id" INTEGER NOT NULL ,
  PRIMARY KEY ("number_id"),FOREIGN KEY ("order_id") REFERENCES "orders" ( "id" ) ON UPDATE NO ACTION ON DELETE NO ACTION
); 
CREATE INDEX "bill_fk_order_id_idx" ON "bill" ("order_id");


--
-- Table structure for table `delivery`
--

CREATE TABLE "delivery" (  "id" INTEGER NOT NULL ,
  "address_client" VARCHAR(200) NOT NULL ,
  "id_client" INTEGER NOT NULL ,
  "employee_id" INTEGER NOT NULL ,
  "order_id" INTEGER NOT NULL ,
  PRIMARY KEY ("id"),FOREIGN KEY ("id_client") REFERENCES "customer" ( "id" ) ON UPDATE NO ACTION ON DELETE NO ACTION,FOREIGN KEY ("employee_id") REFERENCES "staff" ( "id" ) ON UPDATE NO ACTION ON DELETE NO ACTION,FOREIGN KEY ("order_id") REFERENCES "orders" ( "id" ) ON UPDATE NO ACTION ON DELETE NO ACTION
); 
CREATE INDEX "delivery_fk_employee_id_idx" ON "delivery" ("employee_id");
CREATE INDEX "delivery_fk_client_id_idx" ON "delivery" ("id_client");
CREATE INDEX "delivery_fk_order_id_idx" ON "delivery" ("order_id");


--
-- Table structure for table `command_line`
--

CREATE TABLE "command_line" (  "id" INTEGER NOT NULL ,
  "order_id" INTEGER NOT NULL ,
  "article_id" INTEGER NOT NULL ,
  "quantity" INTEGER NOT NULL ,
  PRIMARY KEY ("id"),FOREIGN KEY ("article_id") REFERENCES "article" ( "id" ) ON UPDATE NO ACTION ON DELETE NO ACTION,FOREIGN KEY ("order_id") REFERENCES "orders" ( "id" ) ON UPDATE NO ACTION ON DELETE NO ACTION
); 
CREATE INDEX "command_line_fk_order_id_idx" ON "command_line" ("order_id");
CREATE INDEX "command_line_fk_article_id_idx" ON "command_line" ("article_id");


--
-- Table structure for table `stock`
--

CREATE TABLE "stock" (  "id" INTEGER NOT NULL ,
  "quantity" INTEGER NOT NULL ,
  "reception_date" TIMESTAMP NOT NULL ,
  "expiry_date" TIMESTAMP NOT NULL ,
  "article_id" INTEGER NULL ,
  "restaurant_id" INTEGER NOT NULL ,
  "ingredient_id" INTEGER NULL ,
  PRIMARY KEY ("id"),FOREIGN KEY ("article_id") REFERENCES "article" ( "id" ) ON UPDATE NO ACTION ON DELETE NO ACTION,FOREIGN KEY ("ingredient_id") REFERENCES "ingredient" ( "id" ) ON UPDATE NO ACTION ON DELETE NO ACTION,FOREIGN KEY ("restaurant_id") REFERENCES "restaurant" ( "id" ) ON UPDATE NO ACTION ON DELETE NO ACTION
); 
CREATE INDEX "stock_fk_restaurant_id_idx" ON "stock" ("restaurant_id");
CREATE INDEX "stock_fk_article_id_idx" ON "stock" ("article_id");
CREATE INDEX "stock_fk_ingredient_id_idx" ON "stock" ("ingredient_id");