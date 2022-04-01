# Set up WordPress Database
/etc/init.d/mariadb setup
rc-service mariadb start
mysql -u ${MYSQL_ROOT_USER} < wordpress.sql

# hostname `localhost` - localhost에서만 서버에 연결
# hostname `%` - 모든 호스트에서 서버에 연결
# 새 사용자를 만들고 사용자에게 localhost의 모든 db에 모든 권한을 부여
echo "CREATE USER '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';" | mysql -u ${DB_ROOT_USER}
echo "GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';" | mysql -u ${DB_ROOT_USER}
echo "FLUSH PRIVILEGES;" | mysql -u ${DB_ROOT_USER}

# 새 사용자를 만들고 사용자에게 wp-db에 모든 권한을 부여
echo "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';" | mysql -u ${DB_ROOT_USER}
echo "GRANT ALL PRIVILEGES ON wordpress.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';" | mysql -u ${DB_ROOT_USER}
echo "FLUSH PRIVILEGES;" | mysql -u ${DB_ROOT_USER} # 변경 사항 저장 및 활성화

# 루트 사용자의 암호 변경
mysql -u ${DB_ROOT_USER} -e "ALTER USER '${DB_ROOT_USER}'@'localhost' IDENTIFIED BY '${DB_ROOT_PASS}';"

# 데이터베이스 초기화. 저장된 WP 사용자
mysql $DB_NAME -u root < wordpress.sql

mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASSWORD';";

#rc-service mariadb stop
#rc-service mariadb restart
pkill mysqld
/usr/bin/mysqld -u root
