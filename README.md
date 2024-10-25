# Домашнее задание к занятию "`Оркестрация группой Docker контейнеров на примере Docker Compose`" - `Баграш Фёдор`


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

https://hub.docker.com/repository/docker/tud777777/custom-nginx/general

--- 

### Задание 2

![](https://github.com/tud777777/git_homework/blob/main/img/img1.png)
![](https://github.com/tud777777/git_homework/blob/main/img/img2.png)
![](https://github.com/tud777777/git_homework/blob/main/img/img3.png)
![](https://github.com/tud777777/git_homework/blob/main/img/img4.png)

--- 


### Задание 3

![](https://github.com/tud777777/git_homework/blob/main/img/img5.png)
Контейнер выключился потому что CTRL-c отправляет SIGKILL в контейнер. 
![](https://github.com/tud777777/git_homework/blob/main/img/img6.png)
![](https://github.com/tud777777/git_homework/blob/main/img/img7.png)
![](https://github.com/tud777777/git_homework/blob/main/img/img8.png)
Докер пробрасывает 80 порт на порт 8080, а мы изменили порт nginx на 81 и поэтому nginx доступен только внутри контейнера.
![](https://github.com/tud777777/git_homework/blob/main/img/img9.png)

--- 


### Задание 4

![](https://github.com/tud777777/git_homework/blob/main/img/img10.png)

--- 

### Задание 5

![](https://github.com/tud777777/git_homework/blob/main/img/img11.png)
Путь по умолчанию для файла Compose — compose.yaml (предпочтительно) или compose.yml в рабочем каталоге. Compose также поддерживает docker-compose.yaml и docker-compose.yml для обратной совместимости с более ранними версиями. Если существуют оба файла, Compose предпочитает канонический compose.yaml.
![](https://github.com/tud777777/git_homework/blob/main/img/img12.png)
![](https://github.com/tud777777/git_homework/blob/main/img/img13.png)
![](https://github.com/tud777777/git_homework/blob/main/img/img14.png)
Опция --remove-orphans в Docker указывает удалить все контейнеры, которые не находятся в конфигурации docker-compose.yml. Она удаляет орфанные контейнеры, которые могут оставаться после предыдущего запуска или удаления контейнеров.
![](https://github.com/tud777777/git_homework/blob/main/img/img15.png)

--- 
