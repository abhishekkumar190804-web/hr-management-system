# HR Management System

A full-stack HR Management System built using Spring Boot, Spring Security, Thymeleaf, Hibernate/JPA, and MySQL.

## Features

* Employee Management
* Department Management
* Authentication & Authorization
* Spring Security Integration
* REST APIs
* MVC Architecture
* Thymeleaf Templates
* Docker Deployment Support
* Exception Handling
* Swagger Configuration
* Layered Architecture
* Single Container Deployment (Spring Boot + MySQL)

---

# Tech Stack

## Backend

* Java 17
* Spring Boot
* Spring MVC
* Spring Security
* Spring Data JPA
* Hibernate

## Frontend

* Thymeleaf
* HTML/CSS

## Database

* MySQL

## DevOps

* Docker
* Maven

---

# Project Structure

```bash
src/main/java/com/selimhorri/app/pack
├── configs
├── controllers
├── exceptions
├── models
├── repositories
├── security
└── services
```

---

# API Modules

## Employee APIs

* Create Employee
* Update Employee
* Delete Employee
* List Employees

## Department APIs

* Create Department
* Update Department
* Delete Department
* List Departments

## User Authentication

* Login
* Role-based Authorization

---

# Default Login Credentials

| Role     | Username       | Password |
| -------- | -------------- | -------- |
| Admin    | `selimhorri`   | `0000`   |
| Employee | `amineladjimi` | `0000`   |

---

# Installation

## Clone Repository

```bash
git clone https://github.com/abhishekkumar190804-web/hr-management-system.git
cd hr-management-system
```

---

# Configure Database

Update:

```properties
src/main/resources/application.properties
```

Example:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/hr_dev_db
spring.datasource.username=root
spring.datasource.password=root
```

---

# Run Application

## Using Maven

```bash
mvn spring-boot:run
```

Application runs on:

```text
http://localhost:8080
```

---

# Database Setup

Import the provided SQL schema:

```bash
mysql -u root -p < hr_schema_data_db.sql
```

Databases included:

* `hr_dev_db`
* `hr_test_db`
* `hr_prod_db`

---

# Docker Deployment

This project supports a single-container deployment where:

* MySQL runs inside the same container
* Spring Boot application starts automatically
* Database schema loads automatically

---

## Dockerfile

```dockerfile
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    maven \
    mysql-server \
    && apt-get clean

WORKDIR /app

COPY . .

RUN mvn clean package -DskipTests

RUN service mysql start && \
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root'; FLUSH PRIVILEGES;"

RUN service mysql start && \
    mysql -uroot -proot < hr_schema_data_db.sql

EXPOSE 8080

CMD service mysql start && \
    java -jar target/*.jar
```

---

## Build Docker Image

```bash
docker build -t hr-management-system .
```

---

## Run Docker Container

```bash
docker run -p 8080:8080 hr-management-system
```

Application URL:

```text
http://localhost:8080
```

---

# Render Deployment

This project is deployment-ready for Render using Docker.

Required property:

```properties
server.port=${PORT:8080}
```

---

# Security

Implemented using Spring Security:

* Authentication
* Authorization
* Password Encoding
* UserDetailsService

---

# Swagger API Documentation

After running the application:

```text
http://localhost:8080/swagger-ui/
```

---

# Documentation

Javadocs available inside:

```text
/doc
```

---

# Future Improvements

* JWT Authentication
* PostgreSQL Support
* React Frontend
* CI/CD Pipeline
* Kubernetes Deployment
* Redis Caching

---

# License

This project is licensed under the MIT License.
