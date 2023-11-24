**ReactJS Web Checker**

Этот репозиторий содержит Docker-образ для для удобной проверки веб-страниц. Dockerfile использует многоразовые этапы сборки для эффективного управления зависимостями и сборки приложения.

**Использование**

Для создания Docker-образа и запуска приложения выполните следующие шаги:

**Сборка Docker-образа:**

docker build -t react-web-checker .
Запуск Docker-контейнера:

docker run -p 8080:80 react-web-checker
Приложение будет доступно по адресу http://localhost:8080 в вашем веб-браузере.

**Dockerfile**

1. Downloader (Имя этапа: downloader)
Базовый образ Alpine Linux.
Клонирует указанный репозиторий Git в директорию /tmp.
2. React Builder
Базовый образ Node.js 14.
Копирует содержимое из этапа "downloader" в директорию /app.
Устанавливает зависимости и собирает приложение React.
3. Production (Nginx)
Базовый образ Nginx.
Копирует результат сборки из этапа "react_builder" в директорию HTML Nginx.
Копирует файл конфигурации Nginx.
Открывает порт 80 для доступа к веб-приложению.

docker build -t react-web-checker --build-arg TEMPLATE_REPO=https://your-repo.git .

Файл конфигурации Nginx находится в файле nginx.conf. Измените его по мере необходимости.

Сборка работает и была проверено лично мной:
![image](https://github.com/mihoikl/reactjswebchecker/assets/20790438/b943054d-3376-4b16-8adf-cd153937c2bd)
![image](https://github.com/mihoikl/reactjswebchecker/assets/20790438/454234f9-74a0-4165-898d-e6e79a546538)
![image](https://github.com/mihoikl/reactjswebchecker/assets/20790438/2bb0afe2-2b36-43f9-b612-30b31673c4d6)


**Не стесняйтесь исследовать, изменять и интегрировать этот Docker-образ ReactJS Web Checker в свои проекты. Если у вас возникнут проблемы или есть предложения, откройте issue в этом репозитории.**

**Удачного кодинга!** 🚀 
