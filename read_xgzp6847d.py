import subprocess
import time

while True:
    try:
        t = time.time()
        subprocess.check_call(["i2cset", "-y", "1", "0x6d", "0xa5",  "0xfd"])
        subprocess.check_call(["i2cset", "-y", "1", "0x6d", "0x30", "0x0a"])
        time.sleep(0.01)
        
        msb = int(subprocess.check_output(["i2cget", "-y",  "1",  "0x6d",  "0x06"]), 16) << 16
        csb = int(subprocess.check_output(["i2cget", "-y",  "1",  "0x6d",  "0x07"]), 16) << 8
        lsb = int(subprocess.check_output(["i2cget", "-y",  "1",  "0x6d",  "0x08"]), 16)
        
        print("{} {}".format(t, (msb + csb + lsb) / float(1 << 24)))
    except subprocess.CalledProcessError:
        pass
    time.sleep(0.5)
