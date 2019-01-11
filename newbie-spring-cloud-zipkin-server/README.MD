
#Kafka with Mysql on Docker 
```$xslt
# To start the MySQL+Kafka configuration, run:
$ docker-compose -f docker-compose.yml -f docker-compose-kafka.yml up
```
# Single
```
* `MYSQL_DB`: The database to use. Defaults to "zipkin".
* `MYSQL_USER` and `MYSQL_PASS`: MySQL authentication, which defaults to empty string.
* `MYSQL_HOST`: Defaults to localhost
* `MYSQL_TCP_PORT`: Defaults to 3306
* `MYSQL_MAX_CONNECTIONS`: Maximum concurrent connections, defaults to 10
* `MYSQL_USE_SSL`: Requires `javax.net.ssl.trustStore` and `javax.net.ssl.trustStorePassword`, defaults to false.

STORAGE_TYPE=mysql MYSQL_USER=root java -jar zipkin.jar
```
# Kafka Collector
```
KAFKA_BOOTSTRAP_SERVERS=127.0.0.1:9092 java -jar zipkin.jar
```