#!/bin/bash

echo "INSTALLING FUNCTIONS..."

psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -a -f get_devices_mqtt_configuration.sql
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -a -f upsert_device_status.sql
