package com.myconstruccion.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final Logger logger = LogManager.getLogger(LoginServlet.class);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("logout".equals(action)) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                logger.info("Usuario {} ha cerrado sesión", session.getAttribute("usuario"));
                session.invalidate();
            }
            response.sendRedirect("login.jsp");
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        logger.info("Intento de login para usuario: {}", username);

        if (username == null || username.trim().isEmpty() ||
                password == null || password.trim().isEmpty()) {

            request.setAttribute("error", "Por favor, complete todos los campos.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        if (validarCredenciales(username, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("usuario", username);
            session.setMaxInactiveInterval(30 * 60);

            logger.info("Login exitoso para usuario: {}", username);
            response.sendRedirect("dashboard.jsp");
        } else {
            logger.warn("Credenciales inválidas para usuario: {}", username);
            request.setAttribute("error", "Usuario o contraseña incorrectos.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    private boolean validarCredenciales(String username, String password) {
        if ("admin".equals(username) && "admin123".equals(password)) {
            return true;
        }
        if ("usuario".equals(username) && "user123".equals(password)) {
            return true;
        }
        return false;
    }
}
