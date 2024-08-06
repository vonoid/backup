# Домашнее задание к занятию "Система мониторинга Zabbix" - `Галиев Д.Ф.`

---
## Задание 1 

Установите Zabbix Server с веб-интерфейсом.

#### Процесс выполнения
1. Выполняя ДЗ, сверяйтесь с процессом отражённым в записи лекции.
2. Установите PostgreSQL. Для установки достаточна та версия, что есть в системном репозитороии Debian 11.
3. Пользуясь конфигуратором команд с официального сайта, составьте набор команд для установки последней версии Zabbix с поддержкой PostgreSQL и Apache.
4. Выполните все необходимые команды для установки Zabbix Server и Zabbix Web Server.

#### Требования к результаты 
1. Прикрепите в файл README.md скриншот авторизации в админке.
2. Приложите в файл README.md текст использованных команд в GitHub.

### Решение 1
#### 1. Cкриншот авторизации в админке.
![Скриншот настройки проекта](https://github.com/DinisGaliev/netology-hw/blob/main/Monitoring/img/Zabbix_part1_1.1.png)
#### 2. Используемые команды при инсталяции:
1.  Установка базы данных PostgreSQL:
apt install postgresql
2. Установка и распаковка репозитория:
wget https://repo.zabbix.com/zabbix/7.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_7.0-2+ubuntu22.04_all.deb
dpkg -i zabbix-release_7.0-2+ubuntu22.04_all.deb
apt update
3. Установите Zabbix сервер, веб-интерфейс и агента:
apt install zabbix-server-pgsql zabbix-frontend-php php8.1-pgsql zabbix-apache-conf zabbix-sql-scripts zabbix-agent
4. Создание базы данных и пользователя:
sudo -u postgres createuser --pwprompt zabbix
sudo -u postgres createdb -O zabbix zabbix
5. Импорт начальной схемы и данных на хост Zabbix сервера:
zcat /usr/share/zabbix-sql-scripts/postgresql/server.sql.gz | sudo -u zabbix psql zabbix
6. Настройка пароля для базы данных
Редактируем файл /etc/zabbix/zabbix_server.conf
nano /etc/zabbix/zabbix_server.conf далее в файле напротив DBPassword= указываем наш пароль
7. Рестарт и добавление в автозагрузку веб сервера, Zabbix сервера и Zabbix агента:
systemctl restart zabbix-server zabbix-agent apache2
systemctl enable zabbix-server zabbix-agent apache2
---

## Задание 2 

Установите Zabbix Agent на два хоста.

#### Процесс выполнения
1. Выполняя ДЗ, сверяйтесь с процессом отражённым в записи лекции.
2. Установите Zabbix Agent на 2 вирт.машины, одной из них может быть ваш Zabbix Server.
3. Добавьте Zabbix Server в список разрешенных серверов ваших Zabbix Agentов.
4. Добавьте Zabbix Agentов в раздел Configuration > Hosts вашего Zabbix Servera.
5. Проверьте, что в разделе Latest Data начали появляться данные с добавленных агентов.

#### Требования к результаты 
1. Приложите в файл README.md скриншот раздела Configuration > Hosts, где видно, что агенты подключены к серверу
2. Приложите в файл README.md скриншот лога zabbix agent, где видно, что он работает с сервером
3. Приложите в файл README.md скриншот раздела Monitoring > Latest data для обоих хостов, где видны поступающие от агентов данные.
4. Приложите в файл README.md текст использованных команд в GitHub

### Решение 2

---
## Задание 3 со звёздочкой*
Установите Zabbix Agent на Windows (компьютер) и подключите его к серверу Zabbix.

#### Требования к результаты 
1. Приложите в файл README.md скриншот раздела Latest Data, где видно свободное место на диске C:

### Решение 3

--- 
---

## Задание 1

**Что нужно сделать:**

1. Установите себе jenkins по инструкции из лекции или любым другим способом из официальной документации. Использовать Docker в этом задании нежелательно.
2. Установите на машину с jenkins [golang](https://golang.org/doc/install).
3. Используя свой аккаунт на GitHub, сделайте себе форк [репозитория](https://github.com/netology-code/sdvps-materials.git). В этом же репозитории находится [дополнительный материал для выполнения ДЗ](https://github.com/netology-code/sdvps-materials/blob/main/CICD/8.2-hw.md).
3. Создайте в jenkins Freestyle Project, подключите получившийся репозиторий к нему и произведите запуск тестов и сборку проекта ```go test .``` и  ```docker build .```.

В качестве ответа пришлите скриншоты с настройками проекта и результатами выполнения сборки.

### Решение 1
![Скриншот настройки проекта](https://github.com/DinisGaliev/netology-hw/blob/main/Automation%20and%20CI-CD/image/Configure%201%20my_pipline.png)

![Скриншот настройки проекта](https://github.com/DinisGaliev/netology-hw/blob/main/Automation%20and%20CI-CD/image/Configure%202%20my_pipline.png)

![Результат выполнения сборки](https://github.com/DinisGaliev/netology-hw/blob/main/Automation%20and%20CI-CD/image/build9.png)

---

## Задание 2

**Что нужно сделать:**

1. Создайте новый проект pipeline.
2. Перепишите сборку из задания 1 на declarative в виде кода.

В качестве ответа пришлите скриншоты с настройками проекта и результатами выполнения сборки.

### Решение 2
![Скриншот настройки проекта](https://github.com/DinisGaliev/netology-hw/blob/main/Automation%20and%20CI-CD/image/Configure%20my_pipline2.png)
![Скриншот настройки проекта](https://github.com/DinisGaliev/netology-hw/blob/main/Automation%20and%20CI-CD/image/build%20my_pipeline2_2.png)

---

## Задание 3

**Что нужно сделать:**

1. Установите на машину Nexus.
1. Создайте raw-hosted репозиторий.
1. Измените pipeline так, чтобы вместо Docker-образа собирался бинарный go-файл. Команду можно скопировать из Dockerfile.
1. Загрузите файл в репозиторий с помощью jenkins.

В качестве ответа пришлите скриншоты с настройками проекта и результатами выполнения сборки.

### Решение 3
![Скриншот настройки проекта](https://github.com/DinisGaliev/netology-hw/blob/main/Automation%20and%20CI-CD/image/Configure%20my_pipline3.png)
![Скриншот настройки проекта](https://github.com/DinisGaliev/netology-hw/blob/main/Automation%20and%20CI-CD/image/build%20my_pipline3_1.png)
![Скриншот настройки проекта](https://github.com/DinisGaliev/netology-hw/blob/main/Automation%20and%20CI-CD/image/build%20my_pipline3_2.png)
![Скриншот настройки проекта](https://github.com/DinisGaliev/netology-hw/blob/main/Automation%20and%20CI-CD/image/build%20my_pipline3_3.png)
---
