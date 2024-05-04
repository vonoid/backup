# Домашнее задание к занятию "`Работа с данными (DDL/DML)`" - `Варфоломеева Марьяна`


### Инструкция по выполнению домашнего задания

   1. Сделайте `fork` данного репозитория к себе в Github и переименуйте его по названию или номеру занятия, например, https://github.com/имя-вашего-репозитория/git-hw или  https://github.com/имя-вашего-репозитория/7-1-ansible-hw).
   2. Выполните клонирование данного репозитория к себе на ПК с помощью команды `git clone`.
   3. Выполните домашнее задание и заполните у себя локально этот файл README.md:
      - впишите вверху название занятия и вашу фамилию и имя
      - в каждом задании добавьте решение в требуемом виде (текст/код/скриншоты/ссылка)
      - для корректного добавления скриншотов воспользуйтесь [инструкцией "Как вставить скриншот в шаблон с решением](https://github.com/netology-code/sys-pattern-homework/blob/main/screen-instruction.md)
      - при оформлении используйте возможности языка разметки md (коротко об этом можно посмотреть в [инструкции  по MarkDown](https://github.com/netology-code/sys-pattern-homework/blob/main/md-instruction.md))
   4. После завершения работы над домашним заданием сделайте коммит (`git commit -m "comment"`) и отправьте его на Github (`git push origin`);
   5. Для проверки домашнего задания преподавателем в личном кабинете прикрепите и отправьте ссылку на решение в виде md-файла в вашем Github.
   6. Любые вопросы по выполнению заданий спрашивайте в чате учебной группы и/или в разделе “Вопросы по заданию” в личном кабинете.
   
Желаем успехов в выполнении домашнего задания!
   
### Дополнительные материалы, которые могут быть полезны для выполнения задания

1. [Руководство по оформлению Markdown файлов](https://gist.github.com/Jekins/2bf2d0638163f1294637#Code)

---

### Задание 1
1.1. Поднимите чистый инстанс MySQL версии 8.0+. Можно использовать локальный сервер или контейнер Docker.
```bash
sudo docker run --name mysql-docker -p 3306:3306 -e MYSQL_ROOT_PASSWORD=pass -d mysql:8.0
sudo docker exec -it mysql-docker bash
mysql -u root -p
```
1.2. Создайте учётную запись sys_temp. 
```sql
CREATE USER 'sys_temp'@'localhost' IDENTIFIED BY 'password';
```

1.3. Выполните запрос на получение списка пользователей в базе данных. 
![Список пользователей](https://github.com/Maryana101/DDL-DML-hw/blob/main/img/2.select_user.png)

1.4. Дайте все права для пользователя sys_temp. 
```sql
GRANT ALL PRIVILEGES ON *.* TO 'sys_temp'@'localhost';
```
1.5. Выполните запрос на получение списка прав для пользователя sys_temp. (скриншот)
![Права пользователя](https://github.com/Maryana101/DDL-DML-hw/blob/main/img/3.show_grants.png)

1.6. Переподключитесь к базе данных от имени sys_temp.

```bash
mysql -u sys_temp -p
```
Для смены типа аутентификации с sha2 используйте запрос: 
```sql
ALTER USER 'sys_temp'@'localhost' IDENTIFIED WITH mysql_native_password BY 'pass';
```
1.6. По ссылке https://downloads.mysql.com/docs/sakila-db.zip скачайте дамп базы данных.

1.7. Восстановите дамп в базу данных.

Дамп восстановлен через интерфейс dBeaver:

![Импорт БД](https://github.com/Maryana101/DDL-DML-hw/blob/main/img/5.dump_db.png)

1.8. При работе в IDE сформируйте ER-диаграмму получившейся базы данных. При работе в командной строке используйте команду для получения всех таблиц базы данных. (скриншот)

![Структура БД](https://github.com/Maryana101/DDL-DML-hw/blob/main/img/4.ER-diagramm.png)

---

### Задание 2

Составьте таблицу, используя любой текстовый редактор или Excel, в которой должно быть два столбца: в первом должны быть названия таблиц восстановленной базы, во втором названия первичных ключей этих таблиц. Пример: (скриншот/текст)
```
Название таблицы | Название первичного ключа
customer         | customer_id
```

Запрос на вывод таблиц с PK:
```sql
SELECT pk.TABLE_NAME , C.COLUMN_NAME 
FROM information_schema.TABLE_CONSTRAINTS  AS pk
join information_schema.KEY_COLUMN_USAGE AS C ON
  C.TABLE_NAME = pk.TABLE_NAME AND
  C.CONSTRAINT_NAME = pk.CONSTRAINT_NAME AND
  C.TABLE_SCHEMA = pk.TABLE_SCHEMA
WHERE  pk.TABLE_SCHEMA = 'sakila'
  AND pk.CONSTRAINT_TYPE = 'PRIMARY KEY';
```

![список таблиц](https://github.com/Maryana101/DDL-DML-hw/blob/main/img/6.tables.png)

### Задание 3

3.1. Уберите у пользователя sys_temp права на внесение, изменение и удаление данных из базы sakila.
```sql
REVOKE INSERT, UPDATE, DELETE ON sakila.* FROM 'sys_temp';
```

3.2. Выполните запрос на получение списка прав для пользователя sys_temp. (скриншот)

![новые права](https://github.com/Maryana101/DDL-DML-hw/blob/main/img/7.NEW_GRANTS.png)
