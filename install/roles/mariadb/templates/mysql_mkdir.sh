#!/bin/bash
mkdir -p {{ mysql_basedir }}
mkdir -p {{ mysql_datadir }}
mkdir -p {{ mysql_basedir }}/etc
mkdir -p {{ mysql_basedir }}/run
mkdir -p {{ mysql_basedir }}/tmp
mkdir -p {{ mysql_basedir }}/log
mkdir -p {{ mysql_basedir }}/log/binlog
mkdir -p {{ mysql_basedir }}/log/iblog
mkdir -p /var/log/mariadb
chown -R {{ mysql_user }}.{{ mysql_user }} {{ mysql_basedir }} /var/log/mariadb
rm -f `basename "$0"`
