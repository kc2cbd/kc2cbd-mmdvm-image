#!/bin/bash

mv /var/www/html/setup.php.nomore /var/www/html/setup.php

chromium-browser localhost/index.php

sleep 3

mv /var/www/html/setup.php /var/www/html/setup.php.nomore

sleep 20

exit
