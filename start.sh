#!/bin/bash

# ایجاد پوشه دیتابیس
mkdir -p /etc/x-ui/

# اجرای اولیه بسیار کوتاه برای ساختن فایل دیتابیس خام (اگر وجود ندارد)
if [ ! -f "/etc/x-ui/x-ui.db" ]; then
    cd /usr/local/x-ui/
    ./x-ui & 
    sleep 3
    pkill x-ui
fi

# حالا دیتابیس وجود دارد؛ مشخصات و پورت را با خیال راحت تزریق می‌کنیم
/usr/local/x-ui/x-ui setting -username admin -password admin
/usr/local/x-ui/x-ui setting -port 8080

# اجرای نهایی و پایدار پنل روی پورت 8080
cd /usr/local/x-ui/
./x-ui
