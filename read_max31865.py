import max31865
import RPi.GPIO as GPIO
import time
import mysql.connector
import sys
import math

m = max31865.max31865(12)
while True:
    t = time.time()
    m.writeRegister(0, 0b10100011)
    time.sleep(0.1)
    registers = m.readRegisters(0,8)
    time.sleep(0.1)
    # print(registers)
    if registers[3] != 255:
      continue
    if registers[4] != 255:
      continue
    if registers[5] != 0:
      continue
    if registers[6] != 0:
      continue
    if registers[2] & 1:
      continue
      

    ADC_value = ((registers[1] << 8) + registers[2]) >> 1

    # Rref is 430 Ohm
    resistance = 430.0 * ADC_value / float(1 << 15)

    # Taken from the data sheet
    a = 0.00390830
    b = -0.000000577500

    temperature = (-a + math.sqrt(a*a - 4.0*b*(1.0 - (resistance/100.0)))) / (2.0 * b)
    print("{} {}".format(t, temperature))
 
    # print(registers)
    
    # ADC_value = ((registers[1] << 8) + registers[2]) >> 1
    
    # print(430 * ADC_value / float(1 << 15))
    
    # print((430.0/400.0) * ADC_value / 32 - 256)
    time.sleep(0.5)
    
GPIO.cleanup()
