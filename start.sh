#!/bin/bash

# اجرای مستقیم و بدون واسطه هسته پنل پاسارگاد
cd /usr/local/x-ui/
./x-ui &

# زنده نگه داشتن کانتینر در ریلوی
tail -f /dev/null
