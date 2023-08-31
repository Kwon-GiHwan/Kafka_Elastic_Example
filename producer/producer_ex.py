from kafka import KafkaProducer
from kafka.errors import KafkaError
import ssl

sasl_mechanism = 'PLAIN'
security_protocol = 'SASL_SSL'

# Create a new context using system defaults, disable all but TLS1.2
context = ssl.create_default_context()
context.options &= ssl.OP_NO_TLSv1
context.options &= ssl.OP_NO_TLSv1_1

producer = KafkaProducer(bootstrap_servers = app.config['KAFKA_BROKERS_SASL'],
                         sasl_plain_username = app.config['KAFKA_USERNAME'],
                         sasl_plain_password = app.config['KAFKA_PASSWORD'],
                         security_protocol = security_protocol,
                         ssl_context = context,
                         sasl_mechanism = sasl_mechanism,
                         api_version = (0,10),
                         retries=5)

def send_message(message):

    try:
        producer.send(app.config['KAFKA_TOPIC'], message.encode('utf-8'))
    except:
        print("Unexpected error:", sys.exc_info()[0])
        raise


from kafka import KafkaProducer
import json
from config.kafka_config import *

producer = KafkaProducer(
        bootstrap_servers=hostname+":"+str(port),
        security_protocol="SSL",
        ssl_cafile=cert_folder+"/ca.pem",
        ssl_certfile=cert_folder+"/service.cert",
        ssl_keyfile=cert_folder+"/service.key",
        value_serializer=lambda v: json.dumps(v).encode('ascii'),
        key_serializer=lambda v: json.dumps(v).encode('ascii')
    )

key_schema = {
    "type": "struct",
    "fields": [
        {
            "type": "int32",
            "optional": False,
            "field": "id"
        }
    ]
}

value_schema = {
    "type": "struct",
    "fields": [
        {
            "type": "string",
            "optional": False,
            "field": "name"
        },
        {
            "type": "string",
            "optional": False,
            "field": "pizza"}]
}

producer.send(
    topic_name+"_schema",
    key={"schema": key_schema, "payload": {"id":1}},
    value={"schema": value_schema,
           "payload": {"name":"👨 Frank", "pizza":"Margherita 🍕"}}
)

producer.send(
    topic_name+"_schema",
    key={"schema": key_schema, "payload": {"id":2}},
    value={"schema": value_schema,
           "payload": {"name":"👨 Dan", "pizza":"Fries 🍕+🍟"}}
)


producer.send(
    topic_name+"_schema",
    key={"schema": key_schema, "payload": {"id":3}},
    value={"schema": value_schema,
           "payload": {"name":"👨 Jan", "pizza":"Mushrooms 🍕+🍄"}}
)

producer.flush()

producer.send(
    topic_name+"_schema",
    key={
        "schema": key_schema,
        "payload": {"id":4}
    },
    value={
        "schema": value_schema,
        "payload": {"name":"👨 Giuseppe", "pizza":"Hawaii 🍕+🍍+🥓"}
          }
)


producer.flush()