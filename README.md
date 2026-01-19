# My Construcción - Sistema Web

Sistema de registro de ventas y obras de construcción desarrollado con Java EE, Maven y MySQL.

## 📋 Descripción

**My Construcción** es una aplicación web desarrollada para gestionar el registro de ventas y obras de construcción. La empresa ofrece servicios de construcción de casas, departamentos, oficinas y remodelaciones.

## 🛠️ Tecnologías Utilizadas

- **Java 11** - Lenguaje de programación
- **Maven** - Gestión de dependencias y build
- **Java EE (Servlets/JSP)** - Framework web
- **MySQL** - Base de datos
- **Log4j2** - Sistema de logging
- **Jenkins** - Integración continua
- **JFrog Artifactory** - Gestión de artefactos

## 📁 Estructura del Proyecto

```
my-construccion/
├── pom.xml                          # Configuración Maven
├── Jenkinsfile                      # Pipeline CI/CD
├── settings.xml                     # Configuración Artifactory
├── src/
│   └── main/
│       ├── java/com/myconstruccion/
│       │   ├── servlet/             # Servlets
│       │   ├── model/               # Modelos
│       │   └── util/                # Utilidades
│       ├── resources/
│       │   └── log4j2.xml           # Configuración logging
│       └── webapp/
│           ├── WEB-INF/
│           │   └── web.xml
│           ├── css/
│           │   └── styles.css
│           ├── index.jsp            # Página inicio
│           ├── login.jsp            # Página login
│           ├── dashboard.jsp        # Panel de control
│           └── error.jsp            # Página de error
```

## 🚀 Instalación y Ejecución

### Prerrequisitos

- JDK 11 o superior
- Apache Maven 3.6+
- MySQL/MariaDB (opcional)
- Apache Tomcat 9+ (servidor de aplicaciones)

### Compilar el proyecto

```bash
# Limpiar y compilar
mvn clean compile

# Generar archivo WAR
mvn clean package
```

El archivo WAR se genera en: `target/my-construccion.war`

### Desplegar en Tomcat

1. Copiar `my-construccion.war` a la carpeta `webapps/` de Tomcat
2. Iniciar Tomcat
3. Acceder a: `http://localhost:8080/my-construccion/`

## 👤 Credenciales de Prueba

| Usuario | Contraseña |
|---------|------------|
| admin   | admin123   |
| usuario | user123    |

## 📦 Dependencias Principales

- MySQL Connector Java 8.0.33
- Java Servlet API 4.0.1
- JSTL 1.2
- Log4j2 2.20.0

## 🔗 Repositorio

- **GitHub**: https://github.com/Matignaciom/my-construction-eva3.git

## 📄 Licencia

Este proyecto fue desarrollado para fines educativos - EVA 3 Automatización de Pruebas.