FROM zabbix/zabbix-server-pgsql:ubuntu-latest

RUN apt-get update; \
  apt-get install -y libmyodbc; \
  odbcinst -i -d -f /usr/share/libmyodbc/odbcinst.ini; \
  rm -rf /var/cache/apk/*
