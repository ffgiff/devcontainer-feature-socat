#!/bin/sh
for PORT in SOCAT_PORTS
do
    socat TCP-LISTEN:PORT,fork,reuseaddr TCP:host.containers.internal:PORT &
done
