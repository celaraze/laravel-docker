#!/bin/bash

LOGTIME=$(date "+%Y-%m-%d %H:%M:%S")
echo "[$LOGTIME] startup is running..." >>/root/start.log
service nginx start >>/root/start.log
service php8.1-fpm start >>/root/start.log
service cron start >>/root/start.log
