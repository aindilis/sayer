#!/bin/bash

echo "create database \`$1\`;" | mysql -u root --password="<REDACTED>"
cat sayer.sql | mysql -u root --password="<REDACTED>" $1
