#!/bin/bash

echo "INSTALLING FUNCTIONS..."

psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -a -f get_device.sql
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -a -f get_device_state.sql
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -a -f upsert_device_state.sql

psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -a -f get_devices_mqtt_configuration.sql
