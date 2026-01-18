<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="es">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>My Construcción - Inicio</title>
            <link rel="stylesheet" href="css/styles.css">
        </head>

        <body>

            <header class="header">
                <a href="index.jsp" class="logo">My<span>Construcción</span></a>
                <nav>
                    <ul class="nav-links">
                        <li><a href="index.jsp">Inicio</a></li>
                        <li><a href="#servicios">Servicios</a></li>
                        <li><a href="#obras">Obras</a></li>
                        <li><a href="login.jsp">Iniciar Sesión</a></li>
                    </ul>
                </nav>
            </header>

            <section class="hero">
                <h1>Construimos tus Sueños</h1>
                <p>
                    Somos líderes en construcción de inmobiliarias. Casas, departamentos,
                    oficinas y remodelaciones con la más alta calidad y compromiso.
                </p>
                <a href="login.jsp" class="btn btn-primary">Acceder al Sistema</a>
                <a href="#servicios" class="btn btn-secondary">Ver Servicios</a>
            </section>

            <div class="container" id="servicios">
                <h2 style="text-align: center; margin-bottom: 2rem;">Nuestros Servicios</h2>
                <div class="services">

                    <div class="service-card">
                        <div class="service-icon">🏠</div>
                        <h3>Construcción de Casas</h3>
                        <p>Diseñamos y construimos la casa de tus sueños con materiales de primera calidad.</p>
                    </div>

                    <div class="service-card">
                        <div class="service-icon">🏢</div>
                        <h3>Departamentos</h3>
                        <p>Proyectos de edificación modernos con acabados Premium y espacios optimizados.</p>
                    </div>

                    <div class="service-card">
                        <div class="service-icon">🏗️</div>
                        <h3>Oficinas Corporativas</h3>
                        <p>Espacios de trabajo funcionales y elegantes para tu empresa.</p>
                    </div>

                    <div class="service-card">
                        <div class="service-icon">🔧</div>
                        <h3>Remodelaciones</h3>
                        <p>Transformamos espacios existentes con renovaciones integrales.</p>
                    </div>

                </div>
            </div>

            <footer class="footer">
                <p>&copy; 2026 My Construcción. Todos los derechos reservados.</p>
                <p>Sistema de Gestión de Ventas y Obras</p>
            </footer>

        </body>

        </html>