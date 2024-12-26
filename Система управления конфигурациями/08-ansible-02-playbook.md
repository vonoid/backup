# Домашнее задание к занятию `«Работа с Playbook»` - `Васильев Николай`

## Подготовка к выполнению

1. * Необязательно. Изучите, что такое [ClickHouse](https://www.youtube.com/watch?v=fjTNS2zkeBs) и [Vector](https://www.youtube.com/watch?v=CgEhyffisLY).
2. Создайте свой публичный репозиторий на GitHub с произвольным именем или используйте старый.
3. Скачайте [Playbook](./playbook/) из репозитория с домашним заданием и перенесите его в свой репозиторий.
4. Подготовьте хосты в соответствии с группами из предподготовленного playbook.

## Основная часть

1. Подготовьте свой inventory-файл `prod.yml`.
2. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает [vector](https://vector.dev). Конфигурация vector должна деплоиться через template файл jinja2. От вас не требуется использовать все возможности шаблонизатора, просто вставьте стандартный конфиг в template файл. Информация по шаблонам по [ссылке](https://www.dmosk.ru/instruktions.php?object=ansible-nginx-install). не забудьте сделать handler на перезапуск vector в случае изменения конфигурации!
3. При создании tasks рекомендую использовать модули: `get_url`, `template`, `unarchive`, `file`.
4. Tasks должны: скачать дистрибутив нужной версии, выполнить распаковку в выбранную директорию, установить vector.

><details>
><summary>Плей Vector</summary
>
>```yaml
>- name: Install Vector
>  hosts: vector
>  handlers:
>    - name: Start Vector service
>      become: true
>      ansible.builtin.service:
>        name: vector
>        state: restarted
>  tasks:
>    - name: Configure and Install Vector
>      block:
>        - name: Get Vector distrib
>          ansible.builtin.get_url:
>            url: "https://packages.timber.io/vector/{{ vector_release }}/vector_{{ vector_version }}_amd64.deb"
>            dest: "./vector_{{ vector_version }}_amd64.deb"
>            mode: "0755"
>        - name: Install Vector packages
>          become: true
>          ansible.builtin.apt:
>            deb: vector_{{ vector_version }}_amd64.deb
>          notify: Start vector service
>        - name: Copy config
>          become: true
>          ansible.builtin.template:
>            src: "{{ vector_template }}"
>            dest: "{{ vector_config_file }}"
>            mode: "0644"
>          notify: Start Vector service
>
>```
></details>
>
>* Локально создал систему и прописал его ip в prod.yml
>
>* Пришлось переделать site.yml на deb, потому-что CentOS (ни седьмой не восьмой) никак не хотел адекватно работать (только зря время потерял).
> 

5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.
>![img](/img/Снимок%20экрана%202024-12-26%20155344.png)
>Проверил на ошибки и исправил их
6. Попробуйте запустить playbook на этом окружении с флагом `--check`.
>![img](/img/Снимок%20экрана%202024-12-26%20155513.png)
> Останавливается на месте установки, т.к. нет загруженных пакетов для их установки
7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.
>![img](/img/Снимок%20экрана%202024-12-26%20164018.png)
>![img](/img/Снимок%20экрана%202024-12-26%20164036.png)
>![img](/img/Снимок%20экрана%202024-12-26%20164047.png)
8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.
>![img](/img/Снимок%20экрана%202024-12-26%20164146.png)
9. Подготовьте README.md-файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги. Пример качественной документации ansible playbook по [ссылке](https://github.com/opensearch-project/ansible-playbook). Так же приложите скриншоты выполнения заданий №5-8
10. Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-02-playbook` на фиксирующий коммит, в ответ предоставьте ссылку на него.
>[Ссылка](https://github.com/nikolai-vasilyev/ansible02/tree/main/playbook)

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---