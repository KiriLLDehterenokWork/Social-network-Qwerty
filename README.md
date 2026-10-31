# Social Network Project

Пет-проект социальной сети на Java (Jakarta EE, Servlets, JSP) с базой данных PostgreSQL, полностью упакованный для запуска в Docker.

Стек технологий: Java 21, Jakarta Servlet API 6.1, JSP, JSTL, PostgreSQL 16, HikariCP, jBCrypt, Apache Maven, Docker и Docker Compose.

Инструкция по запуску:

1. Убедитесь, что на компьютере установлен и запущен Docker Desktop.
2. Склонируйте репозиторий:
   git clone https://github.com/KiriLLDehterenokWork/Social-network-Qwerty.git
3. Перейдите в папку с проектом:
   cd Social-network-Qwerty
4. Запустите сборку и старт контейнеров одной командой:
   docker compose up --build -d

После этого Docker скачает нужные образы, соберет war-архив через Maven и запустит сервер Tomcat вместе с базой данных PostgreSQL.

Доступ к приложению:
Сервер будет доступен в браузере по адресу: http://localhost:8080/
Параметры подключения к базе данных: порт 5432, база social_network, пользователь postgres, пароль root.

Основные команды для управления:
Посмотреть логи приложения: docker compose logs -f app.
Посмотреть логи базы данных: docker compose logs -f db.
Остановить контейнеры: docker compose down.
Остановить и удалить сохраненные данные базы: docker compose down -v.