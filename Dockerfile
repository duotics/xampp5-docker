# Usar la imagen base de XAMPP
FROM tomsik68/xampp:5

# Actualizar los repositorios y instalar las dependencias
RUN apt-get update -y \
    && apt-get install -y wget php-cli php-zip unzip php7.3-mbstring

# Instalar Composer
RUN wget -O composer-setup.php https://getcomposer.org/installer \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && rm composer-setup.php

# Instalar Node.js y NPM
# Puedes cambiar el número de versión si es necesario
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs

# Configurar el entorno
EXPOSE 22 80 443 3306
VOLUME ["/www", "/opt/lampp/var/mysql"]
