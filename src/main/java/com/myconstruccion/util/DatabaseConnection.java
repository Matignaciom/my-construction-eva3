package com.myconstruccion.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Clase utilitaria para gestionar la conexión a la base de datos MySQL
 * My Construcción - Database Connection Manager
 */
public class DatabaseConnection {

    private static final Logger logger = LogManager.getLogger(DatabaseConnection.class);

    // Configuración de la base de datos
    private static final String DB_URL = "jdbc:mysql://localhost:3306/myconstruccion";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";
    private static final String DB_DRIVER = "com.mysql.cj.jdbc.Driver";

    private static Connection connection = null;

    /**
     * Constructor privado para evitar instanciación
     */
    private DatabaseConnection() {
    }

    /**
     * Obtiene una conexión a la base de datos
     * 
     * @return Connection objeto de conexión
     * @throws SQLException si hay error de conexión
     */
    public static Connection getConnection() throws SQLException {
        try {
            if (connection == null || connection.isClosed()) {
                Class.forName(DB_DRIVER);
                connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                logger.info("Conexión a base de datos establecida correctamente");
            }
        } catch (ClassNotFoundException e) {
            logger.error("Driver MySQL no encontrado: {}", e.getMessage());
            throw new SQLException("Driver MySQL no encontrado", e);
        } catch (SQLException e) {
            logger.error("Error al conectar a la base de datos: {}", e.getMessage());
            throw e;
        }
        return connection;
    }

    /**
     * Cierra la conexión a la base de datos
     */
    public static void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
                logger.info("Conexión a base de datos cerrada correctamente");
            } catch (SQLException e) {
                logger.error("Error al cerrar la conexión: {}", e.getMessage());
            }
        }
    }

    /**
     * Prueba la conexión a la base de datos
     * 
     * @return true si la conexión es exitosa
     */
    public static boolean testConnection() {
        try {
            Connection conn = getConnection();
            if (conn != null && !conn.isClosed()) {
                logger.info("Prueba de conexión exitosa");
                return true;
            }
        } catch (SQLException e) {
            logger.error("Prueba de conexión fallida: {}", e.getMessage());
        }
        return false;
    }
}
