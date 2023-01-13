echo "Wait for DB"
sleep 60
echo "Start preparing DB"

RESULT=`mysqlshow -h mariadb --user=harpia --password=harpia harpia_db| grep -v Wildcard | grep -o harpia_db`
if [ "$RESULT" != "harpia_db" ]; then
  mysql -h mariadb -u harpia -pharpia --execute="CREATE DATABASE IF NOT EXISTS harpia_db;"
  echo "DB was created"
  mysql -h mariadb -u harpia -pharpia --execute="set global tx_isolation='read-committed';"
  mysql -h mariadb -u harpia -pharpia --execute="CREATE USER IF NOT EXISTS 'harpia'@'%' IDENTIFIED BY 'harpia'; GRANT ALL PRIVILEGES ON *.* TO 'harpia'@'%';"
  echo "Start importing DB"
  mysql -h mariadb -u harpia -pharpia harpia_db < /tmp/$1
  echo "Finish importing DB"
fi

if [ "$RESULT" != "grafana" ]; then
  mysql -h mariadb -u harpia -pharpia --execute="CREATE DATABASE IF NOT EXISTS grafana;"
  mysql -h mariadb -u harpia -pharpia --execute="CREATE USER IF NOT EXISTS 'grafana'@'%' IDENTIFIED BY 'grafana'; GRANT ALL PRIVILEGES ON *.* TO 'grafana'@'%';"
fi