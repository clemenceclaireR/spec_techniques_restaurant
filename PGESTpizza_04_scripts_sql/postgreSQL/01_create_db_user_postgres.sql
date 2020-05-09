-- ------- command with command line ----------
-- psql -U postgres postgres -h localhost -f 01_create_db_user_postgres.sql 


CREATE DATABASE oc_restaurant WITH TEMPLATE = template0 ENCODING = 'UTF8';

CREATE USER oc_user;

ALTER DATABASE oc_restaurant OWNER TO oc_user;
