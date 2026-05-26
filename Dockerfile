FROM maven:3.9.6-eclipse-temurin-17

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    mariadb-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN mvn clean package -DskipTests

RUN cp target/*.jar app.jar

RUN chmod +x start.sh

RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld

EXPOSE 8080

CMD ["./start.sh"]