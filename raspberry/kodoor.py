from gpiozero import LED
import redis
import time
import logging

logging.basicConfig(filename='/var/log/kodor.log', level=logging.DEBUG, format='%(asctime)s %(message)s')
logging.info('Kodor is up')

#let network start before trying to connect to redis
time.sleep(30)

redis_url = 'redis://<redis_url>'
redis_channel = '<your_channel_name>'

connection = redis.from_url(redis_url)
pubsub = connection.pubsub()
pubsub.subscribe(redis_channel)

# We use LED because gpiozero dosen't support Relays
relay = LED(2)

logging.info('Kodor is listening to messages')

for message in pubsub.listen():
    if message['data'] == 'kodor':
        logging.info("got a message: " + message['data'] + "; before handling, relay.is_lit=" + str(relay.is_lit))
        relay.on()
        time.sleep(0.5)
        relay.off()

logging.info('Bye Bye')