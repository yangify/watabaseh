## METHOD 1
#
# Build stage
#
FROM arm64v8/maven:3-openjdk-11 AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN --mount=type=cache,target=/root/.m2 mvn -f /home/app/pom.xml clean package -Dmaven.test.skip -DskipFormatCode=true

#
# Package stage
#
FROM arm64v8/openjdk:11-oracle
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