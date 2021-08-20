#!/usr/bin/env bash

apt-get update \
    && apt-get install -y tree rsyslog \
    && service rsyslog start \
    && logger "Create syslog file if needed !" \
    && chmod 644 /var/log/syslog \
    && while true; do logger "Test syslog à $(date)"; sleep 1; done
