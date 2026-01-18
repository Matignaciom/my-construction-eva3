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

import com.myconstruccion.util.DatabaseConnection;

/**
 * Servlet para gestionar la autenticación de usuarios
 * My Construcción - Sistema de Login
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    private static final Logger logger = LogManager.getLogger(LoginServlet.class);
    
    /**
     * Procesa las solicitudes GET (logout)
     */
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
    
    /**
     * Procesa las solicitudes POST (login)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        logger.info("Intento de login para usuario: {}", username);
        
        // Validación básica
        if (username == null || username.trim().isEmpty() || 
            password == null || password.trim().isEmpty()) {
            
            request.setAttribute("error", "Por favor, complete todos los campos.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        
        // Autenticación (demo: admin/admin123)
        if (validarCredenciales(username, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("usuario", username);
            session.setMaxInactiveInterval(30 * 60); // 30 minutos
            
            logger.info("Login exitoso para usuario: {}", username);
            response.sendRedirect("dashboard.jsp");
        } else {
            logger.warn("Credenciales inválidas para usuario: {}", username);
            request.setAttribute("error", "Usuario o contraseña incorrectos.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
    
    /**
     * Valida las credenciales del usuario
     * En producción, esto consultaría la base de datos
     */
    private boolean validarCredenciales(String username, String password) {
        // Credenciales de demostración
        // Usuario: admin | Contraseña: admin123
        // Usuario: usuario | Contraseña: user123
        
        if ("admin".equals(username) && "admin123".equals(password)) {
            return true;
        }
        if ("usuario".equals(username) && "user123".equals(password)) {
            return true;
        }
        
        // Aquí se podría agregar validación contra base de datos
        // return DatabaseConnection.validarUsuario(username, password);
        
        return false;
    }
}
