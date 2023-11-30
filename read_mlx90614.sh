#!/bin/bash
/usr/bin/unbuffer /usr/bin/python3 /home/pi/data-logger/read_mlx90614.py | tee -a /home/pi/data-logger/data/mlx90614.txt
