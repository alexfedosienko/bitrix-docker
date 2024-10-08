# Bitrix docker!

Готовый набор для запуска сайта на 1С-Битрикс с помощью Docker. На правильность конфигурации не даю никаких гарантий. Если у Вас есть замечания, Вы можете отправить их мне. На этом конфиге работает несколько сайтов, нарушений в их работе пока не замечено. 

## 0. Начало
На сервере обязательно должен быть установлен Docker и Docker-compose
Для сервера на Ubuntu это можно сделать с помощью команды
`wget https://raw.githubusercontent.com/alexfedosienko/setup-docker-and-portainer/docker/setup.sh -O setup-docker.sh && sh setup-docker.sh`

1.  Cклонировать репозиторий `git clone https://github.com/alexfedosienko/bitrix-docker.git SITENAME_FOLDER`
SITENAME_FOLDER заменить на директорию в которой будет расположен Ваш сайт.
2. Переходим в директорию SITENAME_FOLDER `cd SITENAME_FOLDER`
3. Копируем и редактируем файл .env `cp .env_example .env && nano .env`
```
LETSENCRYPT_EMAIL= # Почта для регистрации SSL сертификатов Let's Encrypt
SITE_DOMAIN= # Указываем название домена для сайта
DB_NAME= # Название базы данных
DB_USER= # Имя пользователя базы данных
DB_PASS= # Пароль базы данных
DB_ROOT_PASS= # Пароль root пользователя базы данных
PHP_VERSION=php81 # Версия PHP, на данный момент доступны php74, php80, php81
TRAEFIK_ROUTER_NAME= # Название роутера для traefik, у каждого сайта должно быть уникальное
```

## 1. Запуск traefik
Traefik служит обратным прокси для сайтов, а так же выпускает SSL сертификаты Let's Encrypt
Запускается командой `make run-traefik` или `docker-compose  --env-file .env -f docker-compose-traefik.yml up -d --build`
В случае если на одном сервере запсукается несколько сайтов, **traefik нужно запустить только ОДИН раз**

## 2. Запуск сайта
Сайт запускается командой `make run-site` и останавливается командой `make down-site`
Если нужно запустить несколько сайтов на одном сервере:
1. Склонировать репозиторий в отдельную папку `git clone https://github.com/alexfedosienko/bitrix-docker.git SITENAME2_FOLDER`
2. Скопировать и отредактировать .env `cp .env_example .env`
3. Запустить сайт командной `make run-site`