#!/bin/bash
# Set file and directory paths
cardinal_cost_file="/home/sriharipriya/BatchJobsDemo/MoveStageCardinals/script/cardinal_cost_file.csv"
#source_directory="/home/sriharipriya/BatchJobsDemo/MoveStageCardinals/source_directory/"
# Move Cardinal cost file to source directory
#echo "Moving Cardinal cost file to source directory..."
#mv "/home/sriharipriya/BatchJobsDemo/MoveStageCardinals/script/cardinal_cost_file.csv" "$source_directory"
# Set database connection details
central_db_host="localhost"
central_db_user="root"
central_db_password="priya"
central_db_name="EPRN_Central "
# Database table name
central_table_name="Product_Cardinal"
# Load product cost file into the EPRN Central database
echo "Loading product cost file into the EPRN Central database..."
mysql -h $central_db_host -u $central_db_user -p$central_db_password --local-infile=1 $central_db_name << EOF
LOAD DATA INFILE '$cardinal_cost_file'
INTO TABLE $central_table_name
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;
EOF
echo "Cost changes pushed to the store database."
