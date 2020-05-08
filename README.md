### **Technical specifications and database model for a restaurant project**

#### **Description**

This is the 7th project which has been developed for Openclassrooms. It contains technical
 specifications for a restaurant with the following elements :
 - Technical specifications document
 - Class diagram (inside the document)
 - Physical Data Model
 - Component Diagram
 - Deployment Diagram
 
 In addition, scripts for database mode are provided for both PostgreSQL and MySQL.
 
#### **How to user scripts**

***PostgreSQL***

For creation, you need to select an already existing database in order to create a new one.
In most cases, it is postgres, the default database provided by PostgreSQL :

`psql -U <user> <database> -h localhost -f path/to/01_create_db_user_postgres.sql`

You can now select the newly created database in order to add the tables :

`psql -U <user> -h localhost -d oc_restaurant -f path/to/02_create_tables_postgres.sql`

Finally, insert data :

`psql -U <user>> -h localhost -d oc_restaurant -f path/to/03_insert_data_postgres.sql`


You can also use the query tool inside Pgadmin and copy/paste the scripts.

***MySQL***

/!\ The user has to have privilege to create database, or you can do it in root mode /!\

`mysql -u <user> -p < path/to/01_create_db_user_mysql.sql`

`mysql -u <user> -p < path/to/02_create_tables_mysql.sql`

`mysql -u <user> -p < path/to/03_insert_data_mysql.sql`

You can also use the query tool inside Phpmyadmin or another similar
software and copy/paste the scripts.