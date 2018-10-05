FROM mcr.microsoft.com/mssql/server:2017-latest

# I2B2 database superuser
ENV I2B2_DB i2b2
ENV I2B2_DB_USER i2b2
ENV I2B2_DB_PWD demouser1!
ENV ACCEPT_EULA Y
ENV MSSQL_SA_PASSWORD P@ssw0rd

# I2B2 superuser and database creation script will run as part of sql server bootstrap 
#COPY create_i2b2_db.sh /docker-entrypoint-initdb.d/0_create_i2b2_db.sh
COPY i2b2_init.sql /
COPY init-data.sh /
COPY entrypoint.sh /
COPY prescript.sh /
COPY update_pm_cell_data.sh /
COPY pm_access_insert_data.sql /

RUN chmod +x ./init-data.sh

#Install curl since it is needed to get repo config
# Get official Microsoft repository configuration
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y curl  && \
    curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/ubuntu/16.04/mssql-server-2017.list | tee /etc/apt/sources.list.d/mssql-server-2017.list && \
    apt-get update

# Install optional packages.  Comment out the ones you don't need
# RUN apt-get install -y mssql-server-agent
# RUN apt-get install -y mssql-server-ha
RUN apt-get install -y mssql-server-fts

# disable forced flush(https://github.com/Microsoft/mssql-docker/issues/355)
RUN /opt/mssql/bin/mssql-conf traceflag 3979 on

CMD /bin/bash ./entrypoint.sh
