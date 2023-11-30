from MLX90614 import *
import time

if __name__ == "__main__":
    sensor = MLX90614()
    while True:
      t = time.time()
      print("{} {} {}".format(t, sensor.readObjectTemperature(), sensor.readAmbientTemperature()))
      # print("Object:", sensor.readObjectTemperature())
      # print("Ambient:", sensor.readAmbientTemperature())
      time.sleep(0.5)
