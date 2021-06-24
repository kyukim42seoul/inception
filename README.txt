[Solved]

wordpress - mariadb connection

	wordpress container -> install php7.3-mysqli && modify php.ini 'extention=mysqli'

	mariadb container -> change host 'localhost' to '%'(maybe or wordpress) && modify my.cnf for bind-address=0.0.0.0(default=127.0.0.1)

[PROBLEM]

db.sql file not applied to mysql by entrypoint.sh;

nginx keep running after 2nd container open because of 'daemon off' timing
