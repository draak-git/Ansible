#!/bin/bash
{{ mysql_basedir }}/bin/mysql -h localhost -u root -S {{ mysql_basedir }}/run/{{ mysql_port }}.sock -e "GRANT ALL PRIVILEGES ON *.* TO {{ mysql_database_user }}@'{{ ansible_default_ipv4.address }}' IDENTIFIED BY '{{ mysql_passwd }}' WITH GRANT OPTION;"
{{ mysql_basedir }}/bin/mysql -h localhost -u root -S {{ mysql_basedir }}/run/{{ mysql_port }}.sock -e "UPDATE mysql.user SET password=PASSWORD('{{ mysql_passwd }}') WHERE user='{{ mysql_database_user }}';"
{{ mysql_basedir }}/bin/mysql -h localhost -u root -S {{ mysql_basedir }}/run/{{ mysql_port }}.sock -e "GRANT PROCESS,REPLICATION CLIENT ON *.* TO '{{ zabbix_user }}'@'{{ zabbix_server }}' IDENTIFIED BY '{{ zabbix_passwd }}';"
{{ mysql_basedir }}/bin/mysql -h localhost -u root -S {{ mysql_basedir }}/run/{{ mysql_port }}.sock -e "DELETE FROM  mysql.user WHERE password='';"
{{ mysql_basedir }}/bin/mysql -h localhost -u root -S {{ mysql_basedir }}/run/{{ mysql_port }}.sock -e "DROP DATABASE test;"
{{ mysql_basedir }}/bin/mysql -h localhost -u root -S {{ mysql_basedir }}/run/{{ mysql_port }}.sock -e "FLUSH PRIVILEGES;"
rm -f `basename "$0"`
