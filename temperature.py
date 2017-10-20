#!/usr/bin/python
import sys
import os
import datetime
import Adafruit_DHT

now = datetime.datetime.now()

humidity, temperature = Adafruit_DHT.read_retry(11, 4)
#humidity2, temperature2 = Adafruit_DHT.read_retry(11, 17)

#line = '{},{},{},{},{}'.format(now.strftime("%H:%M:%S"), temperature, humidity, temperature2, humidity2)
line = '{},{},{}'.format(now.strftime("%H:%M:%S"), temperature, humidity)
print line
