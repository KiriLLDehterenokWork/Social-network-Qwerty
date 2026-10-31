# Этап 1: Сборка проекта
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app

# Копируем pom.xml и исходники
COPY pom.xml .
COPY src ./src

# Собираем war архив (пропускаем тесты для ускорения)
RUN mvn clean package -DskipTests

# Этап 2: Запуск в Tomcat
FROM tomcat:10.1-jdk21

# Очищаем стандартные приложения Tomcat, чтобы не мешались
RUN rm -rf /usr/local/tomcat/webapps/*

# Копируем собранный war файл из первого этапа.
# Называем его ROOT.war, чтобы проект был доступен на localhost:8080/ (а не localhost:8080/social-network-c41-onl)
COPY --from=build /app/target/social-network-c41-onl-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]