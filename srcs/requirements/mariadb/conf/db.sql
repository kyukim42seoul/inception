CREATE DATABASE wordpress;

USE mysql;

CREATE user 'kyukim'@'localhost';
SET PASSWORD FOR 'kyukim'@'localhost' = PASSWORD ('kim13245');

GRANT ALL PRIVILEGES ON wordpress.* TO 'kyukim'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'kyukim'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;


