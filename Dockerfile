FROM ubuntu:latest
ENV DEBIAN_FRONTEND=nointeractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y apt-utils curl cron git nginx composer php-fpm php-dom php-zip php-curl php-bcmath php-ldap php-gd nano && \
    apt-get clean
COPY laravel.conf /etc/nginx/sites-available/laravel.conf
COPY start.sh /root/start.sh
RUN chmod +x /root/start.sh
RUN echo "/root/start.sh" >>/root/.bashrc
RUN ln -s /etc/nginx/sites-available/laravel.conf /etc/nginx/sites-enabled/laravel.conf

# 以下用于自定义镜像构建
# 使用自己的代码库替换
# RUN cd /var/www/html/laravel && git clone https://github.com/foo/bar.git .
# RUN composer install -vvv
# RUN cp .env.example .env

RUN echo "* * * * * cd /var/www/html/laravel && php artisan schedule:run >> /dev/null 2>&1" >>/var/spool/cron/crontabs/root