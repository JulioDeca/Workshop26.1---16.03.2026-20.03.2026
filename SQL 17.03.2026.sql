CREATE SCHEMA DESAFIO;
USE DESAFIO;

CREATE TABLE MarcasdeCarros (
ID INT AUTO_INCREMENT PRIMARY KEY,
Marca VARCHAR(30) NOT NULL,
Modelo VARCHAR(30) NOT NULL,
Ano INT NOT NULL);

CREATE TABLE MarcasdeMotos (
ID INT AUTO_INCREMENT PRIMARY KEY,
MarcaMoto VARCHAR(15) NOT NULL,
Modelo VARCHAR(15) NOT NULL,
Ano INT NOT NULL);

ALTER TABLE MarcasdeCarros
ADD COLUMN Data_Financiamento DATE NOT NULL;

ALTER TABLE MarcasdeMotos
ADD COLUMN Data_Financiamento_Moto DATE NOT NULL;

INSERT INTO MarcasdeCarros (Marca, Modelo, Ano, Data_Financiamento)
VALUES 
('Chevy', 'Silverado', '2022', '2026-03-18'),
('Ford', 'F150', '2023', '2026-03-18'),
('RAM' , '1500', 2025 , '2026-03-17'),
('FIAT', 'Toro', '2027','2026-03-17'),
('RAM', 'RAMPAGE', '2026','2026-03-19'),
('GWM', 'POER', '2027','2026-03-19'),
('TOYOTA', 'HILUX', '2015','2026-03-15'),
('NISSAN', 'FRONTIER', '2020','2026-03-10'),
('HONDA', 'TACOMA', '2010','2026-03-12'),
('FOTON', 'TUNLAND', '2027','2026-03-18');

INSERT INTO MarcasdeMotos (MarcaMoto, Modelo, Ano, Data_Financiamento_Moto)
VALUES 
('Yamaha', 'R15', '2024', '2026-03-18'),
('BMW', '1200gs', '2023', '2026-03-18'),
('Kawasaki' , 'Ninja', 2025 , '2026-03-17'),
('Triumph', 'SpeedTwin', '2027','2026-03-17'),
('Shineray', 'Storm200', '2026','2026-03-19'),
('Royal Enfield', 'Interceptor', '2027','2026-03-19'),
('Avelloz', 'AZ160', '2015','2026-03-15'),
('Harley-Davidson', 'FATBOY', '2020','2026-03-10'),
('HONDA', 'CG160', '2016','2026-03-12'),
('DUCATI', 'PANIGALE', '2027','2026-03-18');

UPDATE MarcasdeCarros
SET Ano = 2024
WHERE Modelo = 'F150';

SELECT * FROM MarcasdeCarros;

SELECT AVG(Ano) AS Media_Ano FROM MarcasdeCarros;

SELECT MAX(Ano) AS Ano_Mais_Recente FROM MarcasdeCarros;

SELECT COUNT(*)AS Total_Carros FROM MarcasdeCarros;

SELECT Marca, COUNT(*) AS Quantidade
FROM MarcasdeCarros
GROUP BY Marca;

SELECT Marca, AVG(Ano) AS Media_Ano
FROM MarcasdeCarros
GROUP BY Marca;

SELECT c.Marca, c.Modelo, m.MarcaMoto, m.Modelo
FROM MarcasdeCarros c
INNER JOIN MarcasdeMotos m
ON c.Ano = m.Ano;











