#!/bin/bash
mkdir -p {{ mysql_basedir }}
mkdir -p {{ mysql_datadir }}
mkdir -p {{ mysql_basedir }}/etc
mkdir -p {{ mysql_basedir }}/run
mkdir -p {{ mysql_basedir }}/tmp
mkdir -p {{ mysql_basedir }}/log
mkdir -p {{ mysql_basedir }}/log/binlog
mkdir -p {{ mysql_basedir }}/log/iblog
chown -R {{ mysql_user }}.{{ mysql_user }} {{ mysql_basedir }}
rm -f `basename "$0"`
