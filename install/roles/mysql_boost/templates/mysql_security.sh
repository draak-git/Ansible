#!/bin/bash

mysql -e "update user set authentication_string = password('{{ mysql_passwd }}'), password_expired = 'N', password_last_changed = now() where host = 'localhost';"
