# HR Management System

A full-stack HR Management System built using Spring Boot, Spring Security, Thymeleaf, Hibernate/JPA, and MySQL.

## Features

- Employee Management
- Department Management
- Authentication & Authorization
- Spring Security Integration
- REST APIs
- MVC Architecture
- Thymeleaf Templates
- Docker Deployment Support
- Exception Handling
- Swagger Configuration
- Layered Architecture

---

# Tech Stack

## Backend
- Java 17
- Spring Boot
- Spring MVC
- Spring Security
- Spring Data JPA
- Hibernate

## Frontend
- Thymeleaf
- HTML/CSS

## Database
- MySQL

## DevOps
- Docker
- Maven

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
- Create Employee
- Update Employee
- Delete Employee
- List Employees

## Department APIs
- Create Department
- Update Department
- Delete Department
- List Departments

## User Authentication
- Login
- Role-based Authorization

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
spring.datasource.url=jdbc:mysql://localhost:3306/hr_db
spring.datasource.username=root
spring.datasource.password=password
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

# Docker Deployment

## Build Docker Image

```bash
docker build -t hr-management-system .
```

## Run Container

```bash
docker run -p 8080:8080 hr-management-system
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
- Authentication
- Authorization
- Password Encoding
- UserDetailsService

---

# Documentation

Javadocs available inside:

```text
/doc
```

---

# Future Improvements

- JWT Authentication
- PostgreSQL Support
- React Frontend
- CI/CD Pipeline
- Kubernetes Deployment
- Redis Caching

---

# License

This project is licensed under the MIT License.