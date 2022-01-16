#!/bin/bash

export PATH=$PATH:`cat ~/.Garmin/ConnectIQ/current-sdk.cfg`/bin

VERSION='v1.0.0'

rm ./*.prg
rm ./*.prg.debug.xml

for device in 'fenix6' 'fenix6pro' 'fenix5' 'fenix5plus' ;
  do
    monkeyc -r -d $device -f ./monkey.jungle -o "zeman-countdown-$device-$VERSION.prg" -y ../developer_key
  done

rm ./*.prg.debug.xml