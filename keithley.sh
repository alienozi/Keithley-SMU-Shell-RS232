#!/usr/bin/env bash

echo -e ":OUTP OFF" >> /dev/ttyUSB0

echo -e "*RST"  >> /dev/ttyUSB0

sleep 0.005
echo -e ":SOUR:FUNC:MODE VOLT"  >> /dev/ttyUSB0
echo -e ":SENS:CURR:PROT:LEV 1.0e-3" >> /dev/ttyUSB0
echo -e ":SENS:CURR:RANGE:AUTO 1"  >> /dev/ttyUSB0
echo -e ":OUTP ON" >> /dev/ttyUSB0

touch data


for i in $(seq -200 10 150);
do
    echo -e ":SOUR:VOLT "$i >> /dev/ttyUSB0
    sleep 0.5
    echo -e ":READ?" >> /dev/ttyUSB0
    sleep 0.5
    
done
echo -e ":OUTP OFF" >> /dev/ttyUSB0
