#!/bin/bash
/usr/bin/unbuffer /usr/bin/python3 /home/pi/data-logger/read_xgzp6847d.py | tee -a /home/pi/data-logger/data/xgzp6847d.txt
