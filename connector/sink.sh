curl -i -X PUT http://localhost:8083/connectors/SINK_POSTGRES/config \
     -H "Content-Type: application/json" \
     -d '{
            "connector.class":"io.confluent.connect.jdbc.JdbcSinkConnector",
            "connection.url":"jdbc:postgresql://postgres:5432/numbers",
            "connection.user":"pxl",
            "connection.password":"password",
            "insert.mode":"insert",
	    "auto.create":true,
	    "topics":"P_NUMBER",
	    "tasks.max":1

        }'

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