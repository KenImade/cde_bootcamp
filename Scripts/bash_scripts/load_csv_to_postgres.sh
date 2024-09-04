#!/bin/bash

# Environment variables
HOST_NAME='127.0.0.1'
USER_NAME='postgres'
DATABASE_NAME='posey'

psql -h $HOST_NAME -U $USER_NAME -d $DATABASE_NAME -c "\\copy accounts FROM '/home/kenneth/cde_bootcamp/linux_git/csv_files/accounts.csv' WITH CSV HEADER"
psql -h $HOST_NAME -U $USER_NAME -d $DATABASE_NAME -c "\\copy orders FROM '/home/kenneth/cde_bootcamp/linux_git/csv_files/orders.csv' WITH CSV HEADER"
psql -h $HOST_NAME -U $USER_NAME -d $DATABASE_NAME -c "\\copy region FROM '/home/kenneth/cde_bootcamp/linux_git/csv_files/region.csv' WITH CSV HEADER"
psql -h $HOST_NAME -U $USER_NAME -d $DATABASE_NAME -c "\\copy web_events FROM '/home/kenneth/cde_bootcamp/linux_git/csv_files/web_events.csv' WITH CSV HEADER"
psql -h $HOST_NAME -U $USER_NAME -d $DATABASE_NAME -c "\\copy sales_reps FROM '/home/kenneth/cde_bootcamp/linux_git/csv_files/sales_reps.csv' WITH CSV HEADER"

echo "Data loading process completed."
