curl -i -X PUT http://localhost:8083/connectors/SOURCE_POSTGRES/config \
     -H "Content-Type: application/json" \
     -d '{
            "connector.class":"io.confluent.connect.jdbc.JdbcSourceConnector",
            "connection.url":"jdbc:postgresql://postgres:5432/numbers",
            "connection.user":"pxl",
            "connection.password":"password",
            "poll.interval.ms":"5500",
            "mode":"incrementing",
            "incrementing.column.name":"index",
            "topic.prefix":"P_",
            "table.whitelist":"NUMBER",
            "validate.non.null":"false"
        }'


#{
#   "name": "mysql-connector", // connector의 이름
#   "config": {
#     "connector.class": "io.debezium.connector.mysql.MySqlConnector", // 사용할 플러그인의 종류
#     "database.hostname": "db-9c242.vpc-cdb.ntruss.com", // MySQL 서버의 엔드포인트
#     "database.port": "3306", // MySQL 서버의 포트
#     "database.user": "kimdong", // MySQL 서버의 user
#     "database.password": "1234", // MySQL 서버 user의 password
#     "database.server.id": "184054", // kafka connect에서 사용되는 MySQL 서버의 uuid
#     "database.server.name": "NCP_MYSQL", // kafka connect에서 사용할 MySQL 서버에 부여하는 이름, 추후 kafka topic의 접두사로 사용됨
#     "database.whitelist": "test", // kafka connect에서 접근할 MySQL 서버의 데이터베이스 지정
#     "database.history.kafka.bootstrap.servers": "10.0.200.14:9092,10.0.200.15:9092,10.0.200.16:9092", // Broker 노드 정보
#     "database.history.kafka.topic": "this_is_topic", // MySQL 히스토리 변경 내역을 저장할 topic 이름
#     "snapshot.locking.mode": "none",
#     "value.converter": "org.apache.kafka.connect.json.JsonConverter",
#     "key.converter": "org.apache.kafka.connect.json.JsonConverter"
#   }
#}

#{
#   "name": "es-connector", // connector의 이름
#   "config": {
#     "connector.class": "io.confluent.connect.elasticsearch.ElasticsearchSinkConnector", // 사용할 플러그인의 종류
#     "connection.url": "http://10.0.100.9:9200", // topic을 가져올 kafka 브로커 노드
#     "tasks.max": "1",
#     "topics": "NCP_MYSQL.test.member", // 컨슈밍할 topic 이름
#     "type.name": "_doc",
#     "value.converter": "org.apache.kafka.connect.json.JsonConverter",
#     "key.converter": "org.apache.kafka.connect.json.JsonConverter",
#     "key.converter.schemas.enable": "true",
#     "value.converter.schemas.enable": "true",
#     "transforms": "extractKey",
#     "transforms.extractKey.type": "org.apache.kafka.connect.transforms.ExtractField$Key",
#     "transforms.extractKey.field": "id", // MySQL 테이블에서 사용하는 pk명
#     "behavior.on.null.values": "IGNORE"
#   }
#}