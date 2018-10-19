import os
import time
from time import sleep

def measure_temp():
        temp = os.popen("vcgencmd measure_temp").readline()
        return (temp.replace("temp=",""))

while True:
        print(measure_temp())
        sleep(1.0)
time.sleep(1)

