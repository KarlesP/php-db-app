FROM php:8.1-alpine

# Install mysqli extension
RUN docker-php-ext-install mysqli

WORKDIR /var/www/html
COPY ./src/ .

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080"]