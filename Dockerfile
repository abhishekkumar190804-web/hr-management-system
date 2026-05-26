# =========================================
# BUILD STAGE
# =========================================

FROM maven:3.9.6-eclipse-temurin-17 AS build

WORKDIR /build

# Cache dependencies
COPY pom.xml .

RUN mvn -q dependency:go-offline

# Copy source
COPY src ./src

# Build application
RUN mvn -q clean package -DskipTests

# =========================================
# RUNTIME STAGE
# =========================================

FROM eclipse-temurin:17-jre-jammy

ENV DEBIAN_FRONTEND=noninteractive

# Install MySQL only
RUN apt-get update && \
    apt-get install -y --no-install-recommends mysql-server && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy jar
COPY --from=build /build/target/*.jar app.jar

# Copy startup files
COPY start.sh .
COPY hr_schema_data_db.sql .

RUN chmod +x start.sh

# MySQL runtime directory
RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld

EXPOSE 8080

CMD ["./start.sh"]