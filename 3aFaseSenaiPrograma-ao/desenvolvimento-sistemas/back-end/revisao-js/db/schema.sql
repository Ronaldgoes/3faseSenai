CREATE DATABASE IF NOT EXISTS almoxarifado_db;


USE almoxarifado_db;

DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS movimentacoes;

CREATE TABLE produtos(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   produto VARCHAR(150) NOT NULL,
    categoria  varchar(80) NOT NULL,
    quanditade INT,
    valor_unitario 	DECIMAL(10,2) NOT NULL,
    estoque_minimo 	INT NOT NULL DEFAULT 0,
    estoque_maximo	INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

    
); 


CREATE TABLE movimentacoes(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    produtos_id INT NOT NULL,
    tipo ENUM('ENTRADA','SAIDA') NOT NULL,
    quantidade INT NOT NULL,
    data_movimentacao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_movimentacoes_produtos
      FOREIGN KEY (produtos_id) REFERENCES produtos(id)
      ON UPDATE CASCADE
      ON DELETE RESTRICT

);

INSERT INTO produtos (
	produto, 
	categoria, 
	valor_unitario, 
	estoque_minimo, 
	estoque_maximo
) 
VALUES
	('luva', 'Epi', 45.00, 2, 20),
	('capacete', 'Epi', 39.90, 2, 15),
	('garfo', 'ultilitario', 120.00, 1, 10);

INSERT INTO movimentacoes (
produtos_id, 
tipo, 
quantidade, 
data_movimentacao) 
VALUES
(1, 'ENTRADA', 10, '2026-01-03 09:00:00'),
(1, 'SAIDA', 3, '2026-01-10 15:10:00'),
(1, 'SAIDA', 2, '2026-01-15 11:30:00'),
(2, 'ENTRADA', 8, '2026-01-04 10:00:00'),
(2, 'SAIDA', 4, '2026-01-17 16:00:00'),
(3, 'ENTRADA', 6, '2026-01-05 08:30:00'),
(3, 'SAIDA', 1, '2026-01-20 13:15:00');


CREATE VIEW vw_produtos AS

SELECT p.id as produtos_id,
p.produto,
p.categoria,
p.valor_unitario,
SUM(
CASE 
	WHEN  m.tipo = 'ENTRADA' THEN m.quantidade
	WHEN  m.tipo = 'SAIDA' THEN -m.quantidade
    ELSE 0
    END
) AS saldo_estoque,
SUM(
CASE 
	WHEN  m.tipo = 'ENTRADA' THEN m.quantidade
	WHEN  m.tipo = 'SAIDA' THEN -m.quantidade
    ELSE 0
    END
)* p.valor_unitario  AS valor_total

FROM produtos p
LEFT JOIN movimentacoes m ON m.produtos_id = p.id
GROUP BY p.id,
p.produto,
p.categoria,
p.valor_unitario;


 SELECT * FROM movimentacoes WHERE tipo='SAIDA' ORDER BY data_movimentacao DESC;

SELECT * FROM produtos