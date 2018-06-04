#!/bin/bash
# Install Development Packages
yum clean all >/dev/null 2>&1
yum groupinstall -y "Development Tools" "Server Platform Development" >/dev/null 2>&1
yum install -y vim
