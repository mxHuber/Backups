#!/bin/bash
/usr/bin/unbuffer /usr/bin/python3 /home/pi/data-logger/read_bme280.py | tee -a /home/pi/data-logger/data/bme280.txt
