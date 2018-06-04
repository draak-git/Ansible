<?php
$link = mysql_connect('{{ mysql_address }}','{{ zabbix_user }}','{{ zabbix_passwd }}');
if ($link)
echo "Successs!!!Php install success!\n";
else
echo "Fail!!!Php install fail!\n";
mysql_close();
?>
