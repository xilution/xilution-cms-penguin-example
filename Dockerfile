FROM wordpress:5.3.2-php7.2-apache

COPY themes /var/www/html/wp-content/themes/
COPY plugins /var/www/html/wp-content/plugins/
