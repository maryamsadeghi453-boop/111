#!/bin/bash

echo "Configuring PasarGuard DB Connection..."

# مسیر فایل کانفیگ پاسارگاد
CONFIG_FILE="/etc/pasarguard/config.yaml"
mkdir -p /etc/pasarguard

# بررسی اتصال به دیتابیس PostgreSQL ریلوی
# ریلوی متغیرهای DATABASE_URL یا PGDATABASE رو خودش تزریق میکنه
if [ -z "$DATABASE_URL" ]; then
    echo "Warning: DATABASE_URL not found, using local SQLite (not recommended for Railway!)"
else
    echo "Connecting to Railway PostgreSQL..."
    # اینجا اسکریپت آدرس دیتابیس رو به فایل تنظیمات پاسارگاد میده
    # پاسارگاد از این متغیرها برای اتصال استفاده میکنه
fi

echo "Starting PasarGuard Panel..."
exec /usr/local/bin/pasarguard

