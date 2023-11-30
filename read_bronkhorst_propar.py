# Import the propar module
import propar
import time

import sys

# Connect to the local instrument, when no settings provided
# defaults to locally connected instrument (address=0x80, baudrate=38400)

el_flow = propar.instrument('/dev/ttyUSB0', baudrate=38400)
# el_flow = propar.instrument('/dev/serial0', baudrate=38400)
# el_flow = propar.instrument('/dev/ttyS0', baudrate=38400)
# el_flow = propar.instrument('/dev/ttyS0')


# The setpoint and measure parameters are available
# as properties, for ease of use.
#el_flow.setpoint = 16000

while True:
    t = time.time()
    el_flow.wink(1)
    el_flow.measure 
    #db = propar.database()
    #print(db.get_all_parameters())
    
    flow = el_flow.readParameter(205)   
    input_pressure = el_flow.readParameter(178)
    output_pressure = el_flow.readParameter(179)
    temperature = el_flow.readParameter(142)
    counter = el_flow.readParameter(122)

    print("{} {} {} {} {} {}".format(t, flow, input_pressure, output_pressure, temperature, counter))
 
    time.sleep(1)
