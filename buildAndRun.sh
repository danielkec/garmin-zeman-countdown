#!/bin/bash

# DEVICE=fenix6pro;
# DEVICE=fenix6;
# DEVICE=fenix5plus;
DEVICE=fenix5;

export PATH=$PATH:`cat ~/.Garmin/ConnectIQ/current-sdk.cfg`/bin

# !!! START simulator with connectiq
killall simulator
connectiq &>/dev/null &


monkeyc -r -d $DEVICE -f ./monkey.jungle -o "zeman-countdown-$DEVICE.prg" -y ../developer_key
monkeydo "zeman-countdown-$DEVICE.prg" $DEVICE
