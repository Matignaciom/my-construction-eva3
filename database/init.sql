-- ============================================
-- My Construcción - Script de Base de Datos
-- MySQL / MariaDB
-- ============================================

-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS myconstruccion
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE myconstruccion;

-- ============================================
-- Tabla de Usuarios
-- ============================================
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    rol ENUM('admin', 'usuario', 'vendedor') DEFAULT 'usuario',
    activo BOOLEAN DEFAULT TRUE,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ============================================
-- Tabla de Clientes
-- ============================================
CREATE TABLE IF NOT EXISTS clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    direccion TEXT,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- Tabla de Obras
-- ============================================
CREATE TABLE IF NOT EXISTS obras (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    tipo ENUM('casa', 'departamento', 'oficina', 'remodelacion') NOT NULL,
    descripcion TEXT,
    direccion VARCHAR(255),
    estado ENUM('planificacion', 'en_progreso', 'completada', 'cancelada') DEFAULT 'planificacion',
    fecha_inicio DATE,
    fecha_fin DATE,
    presupuesto DECIMAL(15, 2),
    cliente_id INT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE SET NULL
);

-- ============================================
-- Datos de Prueba
-- ============================================

-- Insertar usuarios de prueba (contraseñas en texto plano para demo)
INSERT INTO usuarios (username, password, nombre, email, rol) VALUES
('admin', 'admin123', 'Administrador', 'admin@myconstruccion.cl', 'admin'),
('usuario', 'user123', 'Usuario Prueba', 'usuario@myconstruccion.cl', 'usuario');

-- Insertar clientes de prueba
INSERT INTO clientes (nombre, apellido, email, telefono, direccion) VALUES
('Juan', 'Pérez', 'juan.perez@email.com', '+56912345678', 'Av. Principal 123, Santiago'),
('María', 'González', 'maria.gonzalez@email.com', '+56987654321', 'Calle Secundaria 456, Valparaíso');

-- Insertar obras de prueba
INSERT INTO obras (nombre, tipo, descripcion, direccion, estado, presupuesto, cliente_id) VALUES
('Casa Familiar Pérez', 'casa', 'Construcción de casa de 2 pisos con 4 dormitorios', 'Av. Principal 123', 'en_progreso', 85000000.00, 1),
('Departamento Centro', 'departamento', 'Remodelación departamento 80m2', 'Edificio Central, Depto 501', 'planificacion', 25000000.00, 2);

-- ============================================
-- Consultas útiles
-- ============================================

-- Ver todos los usuarios
-- SELECT * FROM usuarios;

-- Ver obras con información del cliente
-- SELECT o.*, c.nombre AS cliente_nombre, c.apellido AS cliente_apellido
-- FROM obras o
-- LEFT JOIN clientes c ON o.cliente_id = c.id;
