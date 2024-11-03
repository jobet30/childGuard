FROM php:8.1-fpm

WORKDIR /var/www/html


RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql


COPY --from=composer:latest /usr/bin/composer /usr/bin/composer


RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
            && apt-get install -y nodejs

COPY . . 


RUN composer install --optimize-autoloader --no-dev


RUN npm install && npm run build

RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

EXPOSE 9000
CMD ["php-fpm"]

ENV APP_ENV=production
ENV APP_DEBUG=false
ENV APP_KEY=base64:base64:pxxu/YQ0PUHwWO3TfS/k7piTAbIGlBuWtB433DAi8Vc=