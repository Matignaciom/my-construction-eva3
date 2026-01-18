<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="es">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>My Construcción - Iniciar Sesión</title>
            <link rel="stylesheet" href="css/styles.css">
        </head>

        <body>

            <header class="header">
                <a href="index.jsp" class="logo">My<span>Construcción</span></a>
                <nav>
                    <ul class="nav-links">
                        <li><a href="index.jsp">Inicio</a></li>
                        <li><a href="login.jsp">Iniciar Sesión</a></li>
                    </ul>
                </nav>
            </header>

            <div class="login-container">
                <form class="login-form" action="login" method="POST">
                    <h2>Iniciar Sesión</h2>

                    <c:if test="${not empty error}">
                        <div class="alert alert-error">
                            ${error}
                        </div>
                    </c:if>

                    <c:if test="${not empty success}">
                        <div class="alert alert-success">
                            ${success}
                        </div>
                    </c:if>

                    <div class="form-group">
                        <label for="username">Usuario</label>
                        <input type="text" id="username" name="username" placeholder="Ingrese su usuario" required>
                    </div>

                    <div class="form-group">
                        <label for="password">Contraseña</label>
                        <input type="password" id="password" name="password" placeholder="Ingrese su contraseña"
                            required>
                    </div>

                    <button type="submit" class="btn btn-primary">
                        Iniciar Sesión
                    </button>

                    <p style="text-align: center; margin-top: 1.5rem; color: rgba(255,255,255,0.6);">
                        <a href="index.jsp" style="color: #e94560;">Volver al inicio</a>
                    </p>
                </form>
            </div>

            <footer class="footer">
                <p>&copy; 2026 My Construcción. Todos los derechos reservados.</p>
            </footer>

        </body>

        </html>