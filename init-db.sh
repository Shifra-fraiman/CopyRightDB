#!/bin/bash
# Start SQL Server
"C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\Binn\sqlservr.exe" &

# Wait for SQL Server to start
sleep 30

# Run the SQL script to create the database
"C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\170\Tools\Binn\SQLCMD.EXE" -S localhost -U sa -P CopyRight#1 -d master -i  ./CopyRight.sql

# Keep the container running
tail -f /dev/null
