FROM php:5.6-alpine

RUN apk --no-cache add \
          ca-certificates \
          curl \
          git \
          wget

WORKDIR /tmp

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#Installing phpcs
RUN pear install PHP_CodeSniffer-2.9.0

#installing wpcs for phpcs
RUN cd /tmp && \
    git clone -b master https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards.git wpcs && \
    mv /tmp/wpcs /usr/local/wpcs

#installing phpcs-security-audit
RUN cd /tmp && \
    git clone -b master https://github.com/FloeDesignTechnologies/phpcs-security-audit security-audit && \
    mv /tmp/security-audit /usr/local/security-audit

#installing phpmd
RUN cd /tmp && \
    wget -c https://static.phpmd.org/php/latest/phpmd.phar && \
    chmod +x ./phpmd.phar && \
    mv phpmd.phar /usr/local/bin/phpmd

#installing phpcpd
RUN wget https://phar.phpunit.de/phpcpd.phar && \
    chmod +x phpcpd.phar  && \
    mv phpcpd.phar /usr/local/bin/phpcpd

#configuring wpcs to use installed wpcs
RUN /usr/local/bin/phpcs --config-set installed_paths /usr/local/wpcs,/usr/local/security-audit

# setting default configuration options
RUN /usr/local/bin/phpcs --config-set show_progress 1 && \
    /usr/local/bin/phpcs --config-set colors 1 && \
    /usr/local/bin/phpcs --config-set encoding utf-8
