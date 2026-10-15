-- Script do banco de dados do CRM Mini
DROP DATABASE IF EXISTS enterprise;
CREATE DATABASE enterprise CHARACTER SET utf8mb4;
USE enterprise;

CREATE TABLE departamento (
  id_departamento INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL
);

CREATE TABLE cliente (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE,
  id_departamento INT,
  FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
);

INSERT INTO departamento (nome) VALUES ('Vendas'), ('Suporte'), ('Financeiro');
INSERT INTO cliente (nome, email, id_departamento) VALUES
  ('Maria Silva', 'maria@email.com', 1),
  ('Joao Souza', 'joao@email.com', 2),
  ('Ana Lima', 'ana@email.com', 3);

-- Usuario usado pela aplicacao
DROP USER IF EXISTS 'saas'@'localhost';
CREATE USER 'saas'@'localhost' IDENTIFIED BY 'saas';
GRANT SELECT, INSERT, UPDATE, DELETE ON enterprise.* TO 'saas'@'localhost';
FLUSH PRIVILEGES;
