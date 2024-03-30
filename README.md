

# Домашнее задание к занятию 12-03 "`SQL. Часть 1`"
# `Вернигоров Дмитрий`




### Задание 1

Получите уникальные названия районов из таблицы с адресами, которые начинаются на “K” и заканчиваются на “a” и не содержат пробелов.

```SQL
SELECT DISTINCT district FROM address WHERE district LIKE 'K%a' AND district NOT LIKE '% %';
```

![1](https://github.com/joos-net/SQL_1/blob/main/img/1.png)

---

### Задание 2

Получите из таблицы платежей за прокат фильмов информацию по платежам, которые выполнялись в промежуток с 15 июня 2005 года по 18 июня 2005 года включительно и стоимость которых превышает 10.00.

```SQL
SELECT amount, payment_date FROM payment WHERE amount > 10 AND payment_date BETWEEN '2005-06-15 00:00:00' AND '2005-06-18 23:59:59';
```

![2](https://github.com/joos-net/SQL_1/blob/main/img/2.png)

---

### Задание 3

Получите последние пять аренд фильмов.

```SQL
SELECT rental_id, rental_date, last_update  FROM rental ORDER BY rental_date DESC, rental_id DESC LIMIT 5;
```

![3](https://github.com/joos-net/SQL_1/blob/main/img/3.png)

### Задание 4

Одним запросом получите активных покупателей, имена которых Kelly или Willie.

Сформируйте вывод в результат таким образом:
- все буквы в фамилии и имени из верхнего регистра переведите в нижний регистр,
- замените буквы 'll' в именах на 'pp'.

```SQL
SELECT LOWER(first_name), LOWER(last_name), REPLACE(LOWER(first_name), 'll', 'pp')as ll_TO_pp FROM customer WHERE first_name LIKE 'Kelly' OR  first_name  LIKE 'Willie';
```

![4](https://github.com/joos-net/SQL_1/blob/main/img/4.png)

---
