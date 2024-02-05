#!/bin/bash

echo "INSTALLING SCHEMAS..."

psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -a -f devices.sql
