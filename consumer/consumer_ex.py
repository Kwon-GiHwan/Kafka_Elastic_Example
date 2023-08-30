from kafka import KafkaConsumer, KafkaProducer
import kafka
import ssl
import logging
logging.basicConfig(level=logging.DEBUG)

topic = "sendMessage"
sasl_mechanism = "PLAIN"
username = "username"
password = "password"
security_protocol = "SASL_SSL"

#context = ssl.create_default_context()
#context.options &= ssl.OP_NO_TLSv1
#context.options &= ssl.OP_NO_TLSv1_1

consumer = KafkaConsumer(topic, bootstrap_servers='localhost:9094',
                          #api_version=(0, 10),
                          security_protocol=security_protocol,
                          #ssl_context=context,
                          ssl_check_hostname=True,
                          ssl_cafile='../keys/CARoot.pem',
                          sasl_mechanism = sasl_mechanism,
                          sasl_plain_username = username,
                          sasl_plain_password = password)
                          #ssl_certfile='../keys/certificate.pem',
                          #ssl_keyfile='../keys/key.pem')#,api_version = (0, 10))

for msg in consumer:
        print(msg)