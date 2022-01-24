CREATE DATABASE IF NOT EXISTS wordpress;

USE mysql;

CREATE user 'kyukim'@'%';
CREATE user 'wp'@'%';
SET PASSWORD FOR 'kyukim'@'%' = PASSWORD ('kim13245');
SET PASSWORD FOR 'wp'@'%' = PASSWORD ('kim13245');

GRANT ALL PRIVILEGES ON *.* TO 'kyukim'@'%' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON wordpress.* TO 'wp'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
ALTER USER root@localhost IDENTIFIED VIA mysql_native_password;
SET PASSWORD = PASSWORD('root');
