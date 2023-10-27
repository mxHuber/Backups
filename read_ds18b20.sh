#!/bin/bash
while true; do
  V1=`cat /sys/bus/w1/devices/28-031919695b72/w1_slave | grep t= | cut -d ' ' -f 10 | cut -d '=' -f 2`
  V2=`cat /sys/bus/w1/devices/28-01206405756c/w1_slave | grep t= | cut -d ' ' -f 10 | cut -d '=' -f 2`

  echo `date +%s.%N` $V1 $V2 
  echo `date +%s.%N` $V1 $V2 >> /home/pi/data-logger/data/ds18b20.txt
done

