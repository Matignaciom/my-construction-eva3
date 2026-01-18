<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="es">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>My Construcción - Dashboard</title>
            <link rel="stylesheet" href="css/styles.css">
        </head>

        <body>

            <!-- Verificar sesión -->
            <c:if test="${empty sessionScope.usuario}">
                <c:redirect url="login.jsp" />
            </c:if>

            <!-- Header -->
            <header class="header">
                <a href="index.jsp" class="logo">My<span>Construcción</span></a>
                <nav>
                    <ul class="nav-links">
                        <li><a href="dashboard.jsp">Dashboard</a></li>
                        <li><a href="login?action=logout">Cerrar Sesión</a></li>
                    </ul>
                </nav>
            </header>

            <!-- Dashboard Content -->
            <div class="container dashboard">
                <div class="welcome-message">
                    <h2>¡Bienvenido, ${sessionScope.usuario}!</h2>
                    <p>Has iniciado sesión correctamente en el sistema de My Construcción.</p>
                </div>

                <h3 style="margin-bottom: 1.5rem;">Panel de Control</h3>

                <div class="services">
                    <div class="service-card">
                        <div class="service-icon">📊</div>
                        <h3>Ventas</h3>
                        <p>Gestionar registro de ventas y clientes.</p>
                    </div>

                    <div class="service-card">
                        <div class="service-icon">🏗️</div>
                        <h3>Obras</h3>
                        <p>Administrar proyectos de construcción activos.</p>
                    </div>

                    <div class="service-card">
                        <div class="service-icon">👥</div>
                        <h3>Clientes</h3>
                        <p>Registro centralizado de información de clientes.</p>
                    </div>

                    <div class="service-card">
                        <div class="service-icon">📧</div>
                        <h3>Contactos</h3>
                        <p>Gestión de correos y solicitudes de contacto.</p>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <footer class="footer">
                <p>&copy; 2026 My Construcción. Todos los derechos reservados.</p>
            </footer>

        </body>

        </html>