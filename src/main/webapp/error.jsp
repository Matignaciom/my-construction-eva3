<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page isErrorPage="true" %>
        <!DOCTYPE html>
        <html lang="es">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>My Construcción - Error</title>
            <link rel="stylesheet" href="css/styles.css">
        </head>

        <body>

            <header class="header">
                <a href="index.jsp" class="logo">My<span>Construcción</span></a>
            </header>

            <div class="login-container">
                <div class="login-form" style="text-align: center;">
                    <div class="service-icon">⚠️</div>
                    <h2>¡Oops! Algo salió mal</h2>
                    <p style="color: rgba(255,255,255,0.7); margin: 1rem 0;">
                        Ha ocurrido un error inesperado. Por favor, intente nuevamente.
                    </p>
                    <a href="index.jsp" class="btn btn-primary">Volver al Inicio</a>
                </div>
            </div>

            <footer class="footer">
                <p>&copy; 2026 My Construcción. Todos los derechos reservados.</p>
            </footer>

        </body>

        </html>