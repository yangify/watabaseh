## METHOD 1
#
# Build stage
#
FROM maven:latest AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

#
# Package stage
#
FROM openjdk:11
COPY --from=build /home/app/target/watabaseh-*.jar /usr/local/lib/watabaseh-*.jar
EXPOSE 8080
ENTRYPOINT ["java", "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:8000", "-jar", "/usr/local/lib/watabaseh-*.jar"]


## METHOD 2
#FROM maven:3.8.2-jdk-11
#COPY . .
#RUN mvn clean install
#CMD mvn spring-boot:run -Dspring-boot.run.jvmArguments="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=8000"

#docker run -it -d --name mysql \
# -p 3306:3306 \
# -e MYSQL_ROOT_PASSWORD=root \
# -e MYSQL_USER=user \
# -e MYSQL_PASSWORD=password \
# -e MYSQL_DATABASE=spring-university \
# --platform=linux/amd64 \
# mysql