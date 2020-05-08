
-- -----------------------------------------------------
-- Table `oc_restaurant`.`access_rights`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_restaurant`.`access_rights` (
  `id` INT NOT NULL,
  `grade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_restaurant`.`account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_restaurant`.`account` (
  `id` INT NOT NULL,
  `last_name` VARCHAR(60) NOT NULL,
  `first_name` VARCHAR(60) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `email` VARCHAR(75) NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  `street` VARCHAR(200) NOT NULL,
  `city` VARCHAR(75) NOT NULL,
  `postal_code` VARCHAR(45) NOT NULL,
  `access_rights` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_account_access_idx` (`access_rights` ASC) ,
  CONSTRAINT `fk_account_access`
    FOREIGN KEY (`access_rights`)
    REFERENCES `oc_restaurant`.`access_rights` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_restaurant`.`restaurant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_restaurant`.`restaurant` (
  `id` INT NOT NULL,
  `email_address` VARCHAR(75) NOT NULL,
  `phone_number` INT NOT NULL,
  `street` VARCHAR(200) NOT NULL,
  `city` VARCHAR(75) NOT NULL,
  `postal_code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_restaurant`.`profession_title`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_restaurant`.`profession_title` (
  `id` INT NOT NULL,
  `title` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_restaurant`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_restaurant`.`staff` (
  `id` INT NOT NULL,
  `restaurant_id` INT NULL,
  `account_id` INT NOT NULL,
  `profession_title` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_account_employee_idx` (`account_id` ASC) ,
  INDEX `fk_restaurant_id_idx` (`restaurant_id` ASC) ,
  INDEX `fk_staff_profession_id_idx` (`profession_title` ASC) ,
  CONSTRAINT `fk_staff_account_id`
    FOREIGN KEY (`account_id`)
    REFERENCES `oc_restaurant`.`account` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_staff_restaurant_id`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `oc_restaurant`.`restaurant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_staff_profession_id`
    FOREIGN KEY (`profession_title`)
    REFERENCES `oc_restaurant`.`profession_title` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_restaurant`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_restaurant`.`customer` (
  `id` INT NOT NULL,
  `delivery_address` VARCHAR(200) NOT NULL,
  `account_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_customer_account_idx` (`account_id` ASC) ,
  CONSTRAINT `fk_customer_account_id`
    FOREIGN KEY (`account_id`)
    REFERENCES `oc_restaurant`.`account` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_restaurant`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_restaurant`.`status` (
  `id` INT NOT NULL,
  `status` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_restaurant`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_restaurant`.`orders` (
  `id` INT NOT NULL,
  `num_command` INT NOT NULL,
  `status` INT NOT NULL,
  `paid_for` TINYINT NOT NULL,
  `restaurant_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_restaurant_id_idx` (`restaurant_id` ASC) ,
  INDEX `fk_order_status_id_idx` (`status` ASC) ,
  CONSTRAINT `fk_order_restaurant_id`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `oc_restaurant`.`restaurant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_status_id`
    FOREIGN KEY (`status`)
    REFERENCES `oc_restaurant`.`status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_restaurant`.`delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_restaurant`.`delivery` (
  `id` INT NOT NULL,
  `address_client` VARCHAR(200) NOT NULL,
  `id_client` INT NOT NULL,
  `employee_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_employee_id_idx` (`employee_id` ASC) ,
  INDEX `fk_client_id_idx` (`id_client` ASC) ,
  INDEX `fk_order_id_idx` (`order_id` ASC) ,
  CONSTRAINT `fk_delivery_employee_id`
    FOREIGN KEY (`employee_id`)
    REFERENCES `oc_restaurant`.`staff` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_client_id`
    FOREIGN KEY (`id_client`)
    REFERENCES `oc_restaurant`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_delivery_order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `oc_restaurant`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_restaurant`.`bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_restaurant`.`bill` (
  `number_id` INT NOT NULL,
  `numVAT` INT NOT NULL,
  `num_siren` INT NOT NULL,
  `price_excluding_vat` DECIMAL(10,2) NOT NULL,
  `price_including_vat` DECIMAL(10,2) NOT NULL,
  `bill_date` DATETIME NOT NULL,
  `street` VARCHAR(200) NOT NULL,
  `city` VARCHAR(75) NOT NULL,
  `postal_code` VARCHAR(45) NOT NULL,
  `order_id` INT NOT NULL,
  PRIMARY KEY (`number_id`),
  INDEX `fk_order_id_idx` (`order_id` ASC) ,
  CONSTRAINT `fk_bill_order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `oc_restaurant`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_restaurant`.`article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_restaurant`.`article` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `ean13_code` INT NOT NULL,
  `unit_price_excluding_vat` INT NOT NULL,
  `unit_price_including_vat` INT NOT NULL,
  `designation` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_restaurant`.`ingredient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_restaurant`.`ingredient` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `designation` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_restaurant`.`stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_restaurant`.`stock` (
  `id` INT NOT NULL,
  `quantity` INT NOT NULL,
  `reception_date` DATETIME NOT NULL,
  `expiry_date` DATETIME NOT NULL,
  `article_id` INT NULL,
  `restaurant_id` INT NOT NULL,
  `ingredient_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_restaurant_id_idx` (`restaurant_id` ASC) ,
  INDEX `fk_article_id_idx` (`article_id` ASC) ,
  INDEX `fk_ingredient_id_idx` (`ingredient_id` ASC) ,
  CONSTRAINT `fk_stock_restaurant_id`
    FOREIGN KEY (`restaurant_id`)
    REFERENCES `oc_restaurant`.`restaurant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stock_article_id`
    FOREIGN KEY (`article_id`)
    REFERENCES `oc_restaurant`.`article` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stock_ingredient_id`
    FOREIGN KEY (`ingredient_id`)
    REFERENCES `oc_restaurant`.`ingredient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_restaurant`.`recipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_restaurant`.`recipe` (
  `id` INT NOT NULL,
  `name` VARCHAR(200) NOT NULL,
  `recipe` TEXT NOT NULL,
  `article_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_article_id_idx` (`article_id` ASC) ,
  CONSTRAINT `fk_recipe_article_id`
    FOREIGN KEY (`article_id`)
    REFERENCES `oc_restaurant`.`article` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_restaurant`.`quantity_ingredient_recipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_restaurant`.`quantity_ingredient_recipe` (
  `id` INT NOT NULL,
  `quantity_ingredient_recipe` VARCHAR(45) NOT NULL,
  `ingredient_id` INT NOT NULL,
  `recipe_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ingredient_id_idx` (`ingredient_id` ASC) ,
  INDEX `fk_recipe_id_idx` (`recipe_id` ASC) ,
  CONSTRAINT `fk_quantity_ingredient_id`
    FOREIGN KEY (`ingredient_id`)
    REFERENCES `oc_restaurant`.`ingredient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_quantity_recipe_id`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `oc_restaurant`.`recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_restaurant`.`command_line`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_restaurant`.`command_line` (
  `id` INT NOT NULL,
  `order_id` INT NOT NULL,
  `article_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_order_id_idx` (`order_id` ASC) ,
  INDEX `fk_article_id_idx` (`article_id` ASC) ,
  CONSTRAINT `fk_command_order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `oc_restaurant`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_command_article_id`
    FOREIGN KEY (`article_id`)
    REFERENCES `oc_restaurant`.`article` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

