CREATE DATABASE velozcar;
USE velozcar;


CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(14) UNIQUE,
    data_nascimento DATE,
    telefone VARCHAR(20),
    email VARCHAR(50),
    endereco VARCHAR(50),
    data_cadastro DATE
);

CREATE TABLE funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(14) UNIQUE,
    cargo VARCHAR(50),
    salario DECIMAL(10,2),
    telefone VARCHAR(20),
    email VARCHAR(100),
    data_admissao DATE
);

CREATE TABLE veiculo (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) UNIQUE,
    modelo VARCHAR(50),
    marca VARCHAR(50),
    cor VARCHAR(30),
    ano_fabricacao INT,
    valor_diaria DECIMAL(10,2),
    status VARCHAR(20)
);

CREATE TABLE aluguel (
    id_aluguel INT AUTO_INCREMENT PRIMARY KEY,
    data_inicio DATE,
    data_fim DATE,
    valor_total DECIMAL(10,2),
    multa VARCHAR(20),
    observacoes VARCHAR(20),
    id_cliente INT,
    id_funcionario INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);

CREATE TABLE item_aluguel (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_aluguel INT,
    id_veiculo INT,
    quantidade_dias INT,
    status VARCHAR(20),
    valor_diario DECIMAL(20,2),
    desconto VARCHAR(20),
    subtotal DECIMAL(10,2),
    FOREIGN KEY (id_aluguel) REFERENCES aluguel(id_aluguel),
    FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo)
);

CREATE TABLE pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    valor DECIMAL(10,2),
    data_pagamento DATE,
    metodo VARCHAR(20),
    juros VARCHAR(20),
    desconto VARCHAR(10),
    status VARCHAR(20),
    id_aluguel INT,
    FOREIGN KEY (id_aluguel) REFERENCES aluguel(id_aluguel)
);

CREATE TABLE manutencao (
    id_manutencao INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100),
    data DATE,
    custo DECIMAL(10,2),
    garantia VARCHAR(20),
    tipo VARCHAR(20),
    id_veiculo INT,
    id_funcionario INT,
    FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);
INSERT INTO cliente (nome, cpf, data_nascimento, telefone, email, endereco, data_cadastro) VALUES
('Gabriel','321','1989-02-10','9881','gabriel@email','Av Brasil','2026-03-01'),
('Larissa','654','1996-07-12','9882','larissa@email','Rua das Flores','2026-03-02'),
('Thiago','987','1992-11-23','9883','thiago@email','Av Central','2026-03-03'),
('Camila','741','1999-05-14','9884','camila@email','Rua Verde','2026-03-04'),
('Felipe','852','1993-08-19','9885','felipe@email','Rua Azul','2026-03-05'),
('Aline','963','1997-09-09','9886','aline@email','Av Norte','2026-03-06'),
('Diego','159','1991-12-30','9887','diego@email','Rua Sul','2026-03-07'),
('Vanessa','357','1990-03-17','9888','vanessa@email','Rua Oeste','2026-03-08'),
('Rodrigo','258','1988-06-25','9889','rodrigo@email','Rua Leste','2026-03-09'),
('Juliana','369','1994-04-11','9890','juliana@email','Av Recife','2026-03-10'),
('Eduardo','147','1987-01-01','9891','eduardo@email','Rua Paraiba','2026-03-11'),
('Renata','257','1995-02-20','9892','renata@email','Av João Pessoa','2026-03-12'),
('Marcelo','360','1986-07-07','9893','marcelo@email','Rua Bahia','2026-03-13'),
('Tatiane','456','1998-10-15','9894','tatiane@email','Rua Ceará','2026-03-14'),
('Bruna','789','2000-12-05','9895','bruna@email','Av Nordeste','2026-03-15');

INSERT INTO funcionario VALUES
(1,'Fernando','301','Atendente',2100,'9001','fernando@email','2024-02-01'),
(2,'Roberta','302','Gerente',3500,'9002','roberta@email','2023-05-01'),
(3,'André','303','Atendente',2100,'9003','andre@email','2024-06-01'),
(4,'Simone','304','Financeiro',2700,'9004','simone@email','2022-08-01'),
(5,'Rogério','305','Atendente',2100,'9005','rogerio@email','2024-09-01'),
(6,'Patrícia','306','RH',3000,'9006','patricia@email','2021-01-01'),
(7,'Leandro','307','Atendente',2100,'9007','leandro@email','2024-10-01'),
(8,'Mônica','308','Gerente',3600,'9008','monica@email','2022-03-01'),
(9,'Gustavo','309','Atendente',2100,'9009','gustavo@email','2024-11-01'),
(10,'Rafael','310','TI',4000,'9010','rafael@email','2020-01-01'),
(11,'Débora','311','Atendente',2100,'9011','debora@email','2024-12-01'),
(12,'Sérgio','312','Financeiro',2800,'9012','sergio@email','2022-04-01'),
(13,'Bianca','313','RH',2900,'9013','bianca@email','2021-05-01'),
(14,'Fábio','314','Atendente',2100,'9014','fabio@email','2025-01-01'),
(15,'Elaine','315','Gerente',3700,'9015','elaine@email','2023-06-01');

INSERT INTO veiculo VALUES
(1,'ABC1234','Civic','Honda','Cinza',2021,160,'disponivel'),
(2,'DEF5678','Corolla','Toyota','Preto',2022,170,'disponivel'),
(3,'GHI9012','Onix','Chevrolet','Branco',2020,110,'disponivel'),
(4,'JKL3456','HB20','Hyundai','Azul',2023,130,'disponivel'),
(5,'MNO7890','Gol','VW','Prata',2019,95,'disponivel'),
(6,'PQR2345','Ka','Ford','Vermelho',2018,85,'disponivel'),
(7,'STU6789','Cruze','Chevrolet','Cinza',2021,150,'disponivel'),
(8,'VWX1122','Argo','Fiat','Preto',2022,120,'disponivel'),
(9,'YZA3344','Compass','Jeep','Branco',2023,210,'disponivel'),
(10,'BCD5566','Renegade','Jeep','Cinza',2022,190,'disponivel'),
(11,'EFG7788','Tracker','Chevrolet','Azul',2021,140,'disponivel'),
(12,'HIJ9900','Kwid','Renault','Branco',2020,75,'disponivel'),
(13,'KLM2233','Sandero','Renault','Prata',2019,90,'disponivel'),
(14,'NOP4455','Fusion','Ford','Preto',2018,160,'disponivel'),
(15,'QRS6677','Celta','Chevrolet','Vermelho',2017,65,'disponivel');

UPDATE veiculo SET status = 'alugado' WHERE id_veiculo = 1;
UPDATE pagamento SET status = 'concluido' WHERE id_pagamento = 1;

SELECT * FROM cliente;
SELECT * FROM veiculo;

SELECT COUNT(*) FROM cliente;
SELECT AVG(valor_diaria) FROM veiculo;

SELECT cliente.nome, aluguel.valor_total
FROM cliente
JOIN aluguel ON cliente.id_cliente = aluguel.id_cliente;

SELECT veiculo.modelo, item_aluguel.quantidade_dias
FROM veiculo
JOIN item_aluguel ON veiculo.id_veiculo = item_aluguel.id_veiculo;

SELECT aluguel.id_aluguel, pagamento.valor
FROM aluguel
LEFT JOIN pagamento ON aluguel.id_aluguel = pagamento.id_aluguel;

