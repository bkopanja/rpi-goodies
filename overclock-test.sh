#!/bin/bash
clear

#show CPU frequency & temp:
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
vcgencmd measure_temp

#quick sysbench to force CPU to turbo speed
sysbench --test=cpu --cpu-max-prime=1000 --num-threads=4 run > /dev/null 2>&1

#show CPU freq again:
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq

#linger sysbench to test stability and temp:
sysbench --test=cpu --cpu-max-prime=50000 --num-threads=4 run

#show CPU freq & temp
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
vcgencmd measure_temp



