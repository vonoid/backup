# Домашнее задание к занятию "Что такое DevOps. СI/СD" - Падеев Василий`


---

### Задание 1

Что нужно сделать:

1. Установите себе jenkins по инструкции из лекции или любым другим способом из официальной документации. Использовать Docker в этом задании нежелательно.
2. Установите на машину с jenkins golang.
3. Используя свой аккаунт на GitHub, сделайте себе форк репозитория. В этом же репозитории находится дополнительный материал для выполнения ДЗ.
4. Создайте в jenkins Freestyle Project, подключите получившийся репозиторий к нему и произведите запуск тестов и сборку проекта go test . и docker build ..

```
Поле для вставки кода...
....
....
....
....
```

`При необходимости прикрепитe сюда скриншоты
![1](https://github.com/Vasiliy-Ser/sys-pattern-homework-8-02/blob/homework8.2/Devops.CI-CD/1.png)

![2](https://github.com/Vasiliy-Ser/sys-pattern-homework-8-02/blob/homework8.2/Devops.CI-CD/1.2.png)



---

### Задание 2

Что нужно сделать:

1. Создайте новый проект pipeline.
2. Перепишите сборку из задания 1 на declarative в виде кода.

Поле для вставки кода...
....
....
....
....


При необходимости прикрепитe сюда скриншоты

![3](https://github.com/Vasiliy-Ser/sys-pattern-homework-8-02/blob/homework8.2/Devops.CI-CD/2.1.png)

![4](https://github.com/Vasiliy-Ser/sys-pattern-homework-8-02/blob/homework8.2/Devops.CI-CD/2.2.png)

![5](https://github.com/Vasiliy-Ser/sys-pattern-homework-8-02/blob/homework8.2/Devops.CI-CD/2.3.png)


---

### Задание 3

Что нужно сделать:

1. Установите на машину Nexus.
2. Создайте raw-hosted репозиторий.
3. Измените pipeline так, чтобы вместо Docker-образа собирался бинарный go-файл. Команду можно скопировать из Dockerfile.
4. Загрузите файл в репозиторий с помощью jenkins.



Поле для вставки кода...

```
pipeline {
    agent any
    environment {
        PATH = "/usr/local/go/bin:${env.PATH}"
    }
    stages {
        stage('Git') {
            steps {
               git 'https://github.com/netology-code/sdvps-materials.git'
            }
        }
        stage('Test') {
            steps {
                sh 'go test .'
            }
        }
        stage('Build') {
            steps {
                sh '''
                mkdir -p mkdir -p /var/lib/jenkins/workspace/github
                cp -r . /var/lib/jenkins/workspace/github
                cd /var/lib/jenkins/workspace/github
                CGO_ENABLED=0 GOOS=linux go build -a -installsuffix nocgo -o app
                '''
            }
        }
        stage('Upload to Nexus') {
            steps {
                script {
                    def nexusUrl = 'http://localhost:8081/repository/raw/'
                    def file = 'app'

                    def uploadUrl = "${nexusUrl}${file}?e=${file}"
                    
                    sh """curl -v -u admin:admin \
                        --upload-file /var/lib/jenkins/workspace/github/app \
                        ${uploadUrl}
                       
                    """
                }
            }
        }
    }
} 
```

При необходимости прикрепитe сюда скриншоты

![6](https://github.com/Vasiliy-Ser/sys-pattern-homework-8-02/blob/homework8.2/Devops.CI-CD/3.1.png)

![7](https://github.com/Vasiliy-Ser/sys-pattern-homework-8-02/blob/homework8.2/Devops.CI-CD/3.5edit.png)

![8](https://github.com/Vasiliy-Ser/sys-pattern-homework-8-02/blob/homework8.2/Devops.CI-CD/ALL.png)



Дополнительные задания* (со звёздочкой)
Их выполнение необязательное и не влияет на получение зачёта по домашнему заданию. Можете их решить, если хотите лучше разобраться в материале.


### Задание 4*

Придумайте способ версионировать приложение, чтобы каждый следующий запуск сборки присваивал имени файла новую версию. Таким образом, в репозитории Nexus будет храниться история релизов.

Подсказка: используйте переменную BUILD_NUMBER.

В качестве ответа пришлите скриншоты с настройками проекта и результатами выполнения сборки.


`Приведите ответ в свободной форме........`

1. `Заполните здесь этапы выполнения, если требуется ....`
2. `Заполните здесь этапы выполнения, если требуется ....`
3. `Заполните здесь этапы выполнения, если требуется ....`
4. `Заполните здесь этапы выполнения, если требуется ....`
5. `Заполните здесь этапы выполнения, если требуется ....`
6. 

```
Поле для вставки кода...
....
....
....
....
```

`При необходимости прикрепитe сюда скриншоты
![Название скриншота](ссылка на скриншот)`
