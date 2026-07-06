FROM ubuntu:latest

# نصب ابزارهای مورد نیاز
RUN apt-get update && apt-get install -y \
    curl \
    bash \
    wget \
    && rm -rf /var/lib/apt/lists/*

# دانلود و نصب پنل
RUN bash -c "$(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh)"

# کپی اسکریپت استارت و دادن دسترسی‌های لازم
COPY start.sh /start.sh
RUN chmod +x /start.sh
RUN chmod +x /usr/local/x-ui/x-ui

EXPOSE 2053

CMD ["/start.sh"]
