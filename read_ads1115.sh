#!/bin/bash
/usr/bin/unbuffer /usr/bin/python3 /home/pi/data-logger/read_ads1115.py | tee -a /home/pi/data-logger/data/ads1115.txt
