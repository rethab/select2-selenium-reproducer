#!/bin/bash

if [ -z "${HOST}" ]; then
    echo "set HOST to the directory that contains the index.html so that it may be opened from a browser (e.g. file://...)";
    exit 1;
fi

SELENIUM_JAR="selenium-server-standalone-2.45.0.jar"
if [ ! -f ${SELENIUM_JAR} ]; then
    wget http://selenium-release.storage.googleapis.com/2.45/${SELENIUM_JAR}
fi

java -jar ${SELENIUM_JAR} &
sleep 3 # Give it some time to start

# fetch webdriver
git submodule update --init

INCPATH="`php -i 2>/dev/null | grep include_path | awk 'BEGIN{ FS=" => " }{ printf($NF) }'`:./php-webdriver/lib"
php -d include_path=${INCPATH} test.php ${HOST}/index.html
