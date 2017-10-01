# phptoolset
Dockerized PHP tools - PHPCodeSniffer with WordPress Coding Standard and security audit, PHPMD, PHPCPD

Using https://github.com/FloeDesignTechnologies/phpcs-security-audit for security audit PHPCS rules and https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards for the Wordpress coding standard rules
https://github.com/sebastianbergmann/phpcpd - PHP copy-paste detector
https://github.com/phpmd/phpmd - PHP Mess detector

All scripts are installed into /usr/local/bin inside container

## Building
Use docker build ./ -t {tagname}

{tagname} - the tag that will be used for the image. Should be moved to a config file later.

## Usage
docker run -v $(pwd):$(pwd) -w=$(pwd) -it --rm {tagname} {utilname} arguments...

For example, running PHPCS for a sinle file test.php in current directory:
docker run -v $(pwd):$(pwd) -w=$(pwd) -it --rm {tagname} /usr/local/bin/phpcs test.php

## Wrapper scripts
phpmd.sh  - run PHPMD with given arguments
wpcs.sh - run PHPCS with Wordpress-Extra sniffs and given arguments
security-audit.sh - run PHPCS with Security-audit sniffs and given arguments
phpcpd.sh - run PHPCPD with given arguments

*Please note that docker image tagname should be updated in each wrapper script*

## TODO

* Optimize Dockerfile - minimize dependencies, simplify build
* Move docker image tag to a config file
* Optimize wrapper scripts
* Prepare Makefile for building, deploying, generating wrapper scripts
