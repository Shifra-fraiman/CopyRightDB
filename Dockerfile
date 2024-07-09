FROM mcr.microsoft.com/mssql/server:2019-latest
ENV SA_PASSWORD=YourStrongPassword
ENV ACCEPT_EULA=Y
EXPOSE 1433

# Copy the initialization script and the SQL script to the container
COPY ./init-db.sh /usr/src/app/init-db.sh
COPY ./CopyRight.sql /usr/src/app/your-database-script.sql

# Run the initialization script
ENTRYPOINT ["bash", "-c", "bash /usr/src/app/init-db.sh"]

