#!/bin/bash

mkdir -p /etc/x-ui/

# اجبار پنل به استفاده از پورت 8080 تحت هر شرایطی
/usr/local/x-ui/x-ui setting -username admin -password admin
/usr/local/x-ui/x-ui setting -port 8080

cd /usr/local/x-ui/
./x-ui
