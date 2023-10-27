#!/bin/bash
/usr/bin/unbuffer /usr/bin/python3 /home/pi/data-logger/read_bronkhorst_propar.py | tee -a /home/pi/data-logger/data/bronkhorst_propar.txt
