#!/bin/bash

SERVICE="apache2"
LOG_FILE="/var/log/apache_monitor.log"

ls /var/run/apache2/apache2.pid > /dev/null

if [ $? -eq 0 ]
then 
	echo "$SERVICE service is running." >> $LOG_FILE
	echo "$SERVICE service is running."
	date >> $LOG_FILE
else
	echo "$SERVICE service is NOT running" >> $LOG_FILE
	echo "$SERVICE service is NOT running"
	echo "Starting $SERVICE service" >> $LOG_FILE
	echo "Starting $SERVICE service"
	systemctl restart $SERVICE
	date >> $LOG_FILE

	if [ $? -eq 0 ]
	then
		echo "$SERVICE service restarted successfully." >> $LOG_FILE
		echo "$SERVICE service restarted successfully."
		date >> $LOG_FILE
	else
		echo "$SERVICE service FAILED to restart, please contact the admin" >>$LOG_FILE
		echo "$SERVICE service FAILED to restart, please contact the admin"
		date >> $LOG_FILE
	fi
fi
echo 

