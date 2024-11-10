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

1. ![](https://github.com/tud777777/git_homework/blob/main/img/tsk1_1.png)
2. Личную информацию можно хранить в файле personal.auto.tfvars.
3. ![](https://github.com/tud777777/git_homework/blob/main/img/tsk1_2.png)
4. Ошибка 1 - у ресурса docker_image не было имени. Ошибка 2 - у ресурса docker_container имя начиналось с цифры. Ошибка 3 - random_password.random_string_FAKE.resulT => random_password.random_string.result
5. ![](https://github.com/tud777777/git_homework/blob/main/img/tsk1_3.png) ![](https://github.com/tud777777/git_homework/blob/main/img/tsk1_4.png)
6. -auto-approve может сломать ифраструктуру если вы логически ошиблись в коде. Он может пригодиться для выполнения в скриптах. ![](https://github.com/tud777777/git_homework/blob/main/img/tsk1_5.png)
7. ![](https://github.com/tud777777/git_homework/blob/main/img/tsk1_6.png)
8. image не был унечтожен из-за этой сторочки keep_locally = true. Из документации: If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation.

--- 

