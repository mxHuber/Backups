#!/bin/bash
/usr/bin/unbuffer /usr/bin/python /home/pi/data-logger/read_max31865.py | tee -a /home/pi/data-logger/data/max31865.txt
