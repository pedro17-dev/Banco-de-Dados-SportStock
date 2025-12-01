CREATE DATABASE SportStock;
USE SportStock;

CREATE TABLE categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE fornecedor (
    id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(120)
);

CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    perfil VARCHAR(50) NOT NULL
);

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(120)
);

CREATE TABLE produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    descricao VARCHAR(255),
    preco DECIMAL(10,2) NOT NULL,
    quantidade_estoque INT DEFAULT 0,
    id_categoria INT NOT NULL,
    id_fornecedor INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_fornecedor)
);

CREATE TABLE venda (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    data_venda DATE NOT NULL,
    valor_total DECIMAL(10,2),
    forma_pagamento VARCHAR(50),
    id_cliente INT NOT NULL,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE movimentacao (
    id_movimentacao INT PRIMARY KEY AUTO_INCREMENT,
    data_mov DATE NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    quantidade INT NOT NULL,
    id_produto INT NOT NULL,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE item_venda (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_venda INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venda) REFERENCES venda(id_venda),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

INSERT INTO categoria (nome) VALUES
('Roupas Esportivas'),
('Acessórios'),
('Calçados'),
('Equipamentos');

INSERT INTO fornecedor (nome, telefone, email) VALUES
('SportMax Distribuidora', '1199999-1111', 'contato@sportmax.com'),
('FitFornecimentos', '1188888-2222', 'vendas@fitfor.com'),
('MegaSports', '1177777-3333', 'megasp@mega.com');

INSERT INTO usuario (nome, perfil) VALUES
('Pedro Henrique', 'Atendente'),
('Carla Souza', 'Gerente'),
('Lucas Silva', 'Estoquista');

INSERT INTO cliente (nome, telefone, email) VALUES
('João Mendes', '1191234-5678', 'joao@gmail.com'),
('Maria Eduarda', '1198765-4321', 'maria@gmail.com');

INSERT INTO produto (nome, descricao, preco, quantidade_estoque, id_categoria, id_fornecedor) VALUES
('Camiseta DryFit', 'Camiseta leve e respirável', 59.90, 50, 1, 1),
('Tênis Running Pro', 'Tênis para corrida profissional', 299.90, 20, 3, 3),
('Garrafa Térmica 1L', 'Aço inoxidável', 89.90, 35, 2, 2);

INSERT INTO movimentacao (data_mov, tipo, quantidade, id_produto, id_usuario) VALUES
('2025-02-01', 'entrada', 10, 1, 3),
('2025-02-01', 'saida', 2, 2, 1);

INSERT INTO venda (data_venda, valor_total, forma_pagamento, id_cliente, id_usuario) VALUES
('2025-02-10', 389.80, 'Crédito', 1, 1),
('2025-02-11', 299.90, 'Débito', 2, 1);

INSERT INTO item_venda (id_venda, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 2, 59.90),
(1, 3, 1, 89.90),
(2, 2, 1, 299.90);