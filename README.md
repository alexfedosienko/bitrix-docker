1) Указать насройки базы в файле docker-compose.yml
2) Настроить cron default.cron в файлах /php81-cli/default.cron и /php74-cli/default.cron
3) После клонирования выполнить `chown -R 1000:www-data ./data/site`


Исправление ошибок:
1) Исправить настройки базы данных в файле /bitrix/php_interface/dbconn.php
2) При наличии ошибки в работе LocalRedirect добавить в файл /bitrix/php_interface/dbconn.php строку `$_SERVER["HTTPS"] = "on";`