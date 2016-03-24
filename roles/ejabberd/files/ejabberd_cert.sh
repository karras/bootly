#!/bin/bash

# Create pem file which ejabberd can use
#
# Loop through all cert folders under /var/lib/acme/live/
# and concatenate fullchain + privkey
#
# Triggered by cron to update pem file after cert update
#
# Nicolas Christener, Mar 2016

for d in /var/lib/acme/live/*/; do
        cat ${d}fullchain >> ${d}fullchain_privkey.pem.new &&
        cat ${d}privkey   >> ${d}fullchain_privkey.pem.new &&
        mv  ${d}fullchain_privkey.pem.new ${d}fullchain_privkey.pem;
done
