# printer for variables from read_x...

import subprocess
import time

t = time.time()

# first subprocess check
try:
    subprocess.check_call(["i2cset", "-y", "1", "0x6d", "0xa5",  "0xfd"])
except subprocess.CalledProcessError as e:
    print(e)
    
# second subprocess check
try:
    subprocess.check_call(["i2cset", "-y", "1", "0x6d", "0x30", "0x0a"])
except subprocess.CalledProcessError as e:
    print(e)
    
time.sleep(0.01)

# msb
msb = 0
try:        
    msb = int(subprocess.check_output(["i2cget", "-y",  "1",  "0x6d",  "0x06"]), 16) << 16
    print(msb)
except subprocess.CalledProcessError as e:
    print(e)

# csb   
csb = 0
try:
    csb = int(subprocess.check_output(["i2cget", "-y",  "1",  "0x6d",  "0x07"]), 16) << 8
    print(csb)
except subprocess.CalledProcessError as e:
    print(e)
    
# lsb
lsb = 0
try:
    lsb = int(subprocess.check_output(["i2cget", "-y",  "1",  "0x6d",  "0x08"]), 16)
    print(lsb)
except subprocess.CalledProcessError as e:
    print(e)    
    
print("{} {}".format(t, (msb + csb + lsb) / float(1 << 24)))

time.sleep(0.5)
