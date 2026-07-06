FROM ubuntu:latest

# نصب پیش‌نیازهای سیستم
RUN apt-get update && apt-get install -y \
    curl \
    bash \
    wget \
    systemd \
    && rm -rf /var/lib/apt/lists/*

# دانلود و نصب اسکریپت پنل پاسارگاد (Sanaei)
RUN bash -c "$(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh)"

# کپی کردن اسکریپت استارت
COPY start.sh /start.sh
RUN chmod +x /start.sh

# باز کردن پورت پیش‌فرض پنل
EXPOSE 2053

CMD ["/start.sh"]
