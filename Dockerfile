FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl \
    bash \
    ca-certificates \
    tzdata \
    && rm -rf /var/lib/apt/lists/*

# تنظیم تایم‌زون به تهران برای دقیق بودن زمان انقضای کاربران
ENV TZ=Asia/Tehran

# ایجاد پوشه اصلی پنل
WORKDIR /app

# دانلود مستقیم آخرین نسخه پنل پاسارگاد از گیت‌هاب رسمی
RUN bash -c "$(curl -L https://raw.githubusercontent.com/mmo93/PasarGuard/main/install.sh)" @ install

COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# پورت پیش‌فرض ادمین پنل
EXPOSE 8080

ENTRYPOINT ["/app/entrypoint.sh"]
