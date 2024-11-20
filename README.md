# Домашнее задание к занятию "`Название занятия`" - `Фамилия и имя студента`


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
Одним запросом получите информацию о магазине, в котором обслуживается более 300 покупателей, и выведите в результат следующую информацию:

фамилия и имя сотрудника из этого магазина;
город нахождения магазина;
количество пользователей, закреплённых в этом магазине.


```
SELECT 
    s.first_name, 
    s.last_name, 
    c.city, 
    COUNT(cu.customer_id) as количество_пользователей
FROM 
    customer cu
JOIN 
    store st ON cu.store_id = st.store_id
JOIN 
    staff s ON st.manager_staff_id = s.staff_id
JOIN 
    address a ON st.address_id = a.address_id
JOIN 
    city c ON a.city_id = c.city_id
GROUP BY 
    s.first_name, 
    s.last_name, 
    c.city
HAVING 
    COUNT(cu.customer_id) > 300;
```
![Название скриншота 1](https://github.com/drumspb/sys-pattern-homework/blob/SQL2/img/1.png)`


---

### Задание 2
Получите количество фильмов, продолжительность которых больше средней продолжительности всех фильмов.

```
SELECT 
    COUNT(*) as количество_фильмов
FROM 
    film
WHERE 
    length > (SELECT AVG(length) FROM film);
```
![Название скриншота 1](https://github.com/drumspb/sys-pattern-homework/blob/SQL2/img/2.png)`


---

### Задание 3
Получите информацию, за какой месяц была получена наибольшая сумма платежей, и добавьте информацию по количеству аренд за этот месяц.
```
SELECT 
    DATE_FORMAT(p.payment_date, '%Y-%M') as период, 
    SUM(p.amount) as сумма_платежей, 
    COUNT(r.rental_id) as количество_аренд
FROM 
    payment p
JOIN 
    rental r ON p.rental_id = r.rental_id
GROUP BY 
    DATE_FORMAT(p.payment_date, '%Y-%M')
ORDER BY 
    сумма_платежей DESC
LIMIT 1; 
```
![Название скриншота 1](https://github.com/drumspb/sys-pattern-homework/blob/SQL2/img/5.png)`
