import smbus2
import bme280
import time

port = 1
address = 0x76
bus = smbus2.SMBus(port)

calibration_params = bme280.load_calibration_params(bus, address)

# the sample method will take a single reading and return a
# compensated_reading object
while True:
    data = bme280.sample(bus, address, calibration_params)
    t = time.time()

    # the compensated_reading class has the following attributes
    # print(data.id)
    # print(data.timestamp)
    print("{} {} {}".format(t, data.temperature, data.pressure))
    #print("[" + str(data.temperature) + ", " + str(data.pressure) + ", " + str(data.humidity) + "]")

    # there is a handy string representation too
    # print(data)
    time.sleep(0.5)
