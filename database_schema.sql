/* * NullSector - Central Intelligence Database
 * Operator: GhostByte
 * Target: Persistent Data Storage
 */

CREATE DATABASE IF NOT EXISTS NullSectorDB;
USE NullSectorDB;

CREATE TABLE IF NOT EXISTS sector_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    target_ip VARCHAR(45) NOT NULL,
    operator_name VARCHAR(50) DEFAULT 'GhostByte',
    capture_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    sector_status VARCHAR(100),
    hardware_access JSON, -- Kamera/Mikrofon izin detayları için
    raw_data TEXT
);

-- İlk operatör girişini yapalım
INSERT INTO sector_logs (target_ip, sector_status) 
VALUES ('85.111.76.66', 'DATABASE_INITIALIZED');
