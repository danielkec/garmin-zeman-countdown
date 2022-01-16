#!/bin/bash
export PATH=$PATH:`cat ~/.Garmin/ConnectIQ/current-sdk.cfg`/bin
connectiq &>/dev/null &