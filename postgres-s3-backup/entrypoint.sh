#!/bin/bash

whenever --write-crontab --load-file /backup/schedule.rb

exec "$@"
