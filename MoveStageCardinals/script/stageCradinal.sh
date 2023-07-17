#!/bin/bash

# Database store connection details
db_host="localhost"
db_user="root"
db_password="priya"
db_store="EPRN_Central"


# CSV file path and name
csv_file="/home/sriharipriya/BatchJobsDemo/MoveStageCardinals/script/cardinal_cost_file.csv"

# Database table name
store_table_name="Product_Cardinal"


# Read the CSV file and insert data into the database table
mysql -h "$db_host" -u "$db_user" -p"$db_password" "$db_store" <<EOF
LOAD DATA LOCAL INFILE '$csv_file'
INTO TABLE $store_table_name
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
EOF

if [ $? -eq 0 ]; then
  echo "Data inserted into the database table successfully."
else
  echo "Error inserting data into the database table."
fi
