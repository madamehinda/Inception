#!/bin/bash
#set -eux

service mariadb start;

# log into MariaDB as root and create database and the user
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mariadb -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mariadb -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown
#mysqladmin -u root shutdown
exec mysqld_safe

#print status
echo "MariaDB database and user were created successfully! "

# #!/bin/bash

# # Set the root password
# mysqld -e "ALTER USER root@localhost IDENTIFIED BY 'your_password';"

# # Create a database
# mysqld -e "CREATE DATABASE my_database;"

# # Create a user
# mysqld -e "CREATE USER my_user@localhost IDENTIFIED BY 'your_password';"

# # Grant privileges to the user
# mysqld -e "GRANT ALL PRIVILEGES ON my_database.* TO my_user@localhost;"

