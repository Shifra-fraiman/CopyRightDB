#!/bin/bash
/opt/mssql/bin/sqlservr &

# Wait for SQL Server to start
sleep 30

# Run the SQL script to create the database
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P CopyRight#1 -d master -i /usr/src/app/your-database-script.sql

# Keep the container running
tail -f /dev/null
