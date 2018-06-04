[client] 
 port    = {{ mysql_port }}
 socket  = {{ mysql_sock }}

 [mysqld] 
 character-set-server = utf8
 bind-address = {{ ansible_default_ipv4.address }}
 port      = {{ mysql_port }}
 socket    = {{ mysql_sock }}
 basedir   = {{ mysql_basedir }}
 datadir   =  {{ mysql_datadir }}
 log-error = {{ mysql_datadir }}/mysql-error.log 
 pid-file  = {{ mysql_datadir }}/mysql.pid 
 log-bin   = {{ mysql_datadir }}/mysql-bin
 skip-external-locking 
 skip-name-resolve 
 skip-symbolic-links 
 server-id = {{ mysql_server_id }}
 binlog_format=mixed 
 binlog_cache_size=8M 
 max_binlog_cache_size=24M 
 max_binlog_size=1G 
 expire_logs_days=7 

 key_buffer_size = 384M 
 sort_buffer_size = 2M 
 read_buffer_size = 2M 
 read_rnd_buffer_size = 16M 
 join_buffer_size = 2M 
 thread_cache_size = 32 
 thread_concurrency = 16 

 interactive_timeout = 120 
 wait_timeout = 120 

 table_cache = 4069 
 table_open_cache = 512 
 open_files_limit = 10240 
 back_log=600 

 max_connections = 5000 
 max_connect_errors = 5000 
 max_allowed_packet = 16M 
 tmp_table_size = 256M 
 max_heap_table_size = 512M 
 bulk_insert_buffer_size = 64M 
 myisam_sort_buffer_size = 64M 
 myisam_repair_threads =1 
 myisam_recover 

 long_query_time = 2 
 slow_query_log 
 slow_query_log_file = {{ mysql_datadir }}/slow.log 

 innodb_additional_mem_pool_size = 64M 
 {% set memory=ansible_memtotal_mb/1024/2 %} 
 innodb_buffer_pool_size = {{ memory | round |int }}G
 innodb_data_file_path = ibdata1:2G:autoextend 
 innodb_data_home_dir = {{ mysql_datadir }}
 innodb_log_group_home_dir = {{ mysql_datadir }}
 innodb_file_io_threads = 4 
 innodb_thread_concurrency = {{ ansible_processor_vcpus }}
 innodb_flush_log_at_trx_commit = 2 
 innodb_log_buffer_size = 256M 
 innodb_log_file_size = 512M 
 innodb_log_files_in_group = 3 
 innodb_max_dirty_pages_pct = 90 
 innodb_lock_wait_timeout = 120 
 innodb_file_per_table = 1 
 innodb_support_xa=0  
 innodb_flush_method = O_DIRECT 

 [mysqldump] 
 quick 
 max_allowed_packet = 512M 

 [mysql] 
 no-auto-rehash 

 [myisamchk] 
 key_buffer_size = 512M 
 sort_buffer_size = 512M 
 read_buffer = 8M 
 write_buffer = 8M 

 [mysqlhotcopy] 
 interactive-timeout 
