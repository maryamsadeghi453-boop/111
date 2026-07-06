#!/bin/bash

# ایجاد پوشه تنظیمات در صورت عدم وجود
mkdir -p /etc/x-ui/

# تنظیم خودکار پورت پنل بر اساس متغیر پورت پلتفرم ریلوی
# این کار مشکل تداخل پورت و باز نشدن دامنه را کاملاً حل می‌کند
if [ ! -f "/etc/x-ui/x-ui.db" ]; then
    /usr/local/x-ui/x-ui setting -username admin -password admin
    /usr/local/x-ui/x-ui setting -port ${PORT:-2053}
fi

# ورود به پوشه اصلی و اجرای مستقیم هسته پنل
cd /usr/local/x-ui/
./x-ui
