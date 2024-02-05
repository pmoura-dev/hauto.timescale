#!/bin/bash

echo "INSTALLING FUNCTIONS..."

psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -a -f get_device_control_data.sql
psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -a -f upsert_device_status.sql
