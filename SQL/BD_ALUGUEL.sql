CREATE DATABASE IF NOT EXISTS BD_ALUGUEL;
USE BD_ALUGUEL;

CREATE TABLE IF NOT EXISTS CLIENTE(
	CLI_ID INT AUTO_INCREMENT PRIMARY KEY,
    CLI_NOME VARCHAR(50) NOT NULL,
    CLI_CPF VARCHAR(11) NOT NULL,
    CLI_EMAIL VARCHAR(50) NOT NULL,
    CLI_TELEFONE VARCHAR(9) NOT NULL
);

ALTER TABLE CLIENTE
MODIFY COLUMN CLI_CPF VARCHAR(11) NOT NULL UNIQUE;


CREATE TABLE IF NOT EXISTS PRODUTO(
	PRO_ID INT AUTO_INCREMENT PRIMARY KEY,
    PRO_NOME VARCHAR(50) NOT NULL,
    PRO_DESCRICAO VARCHAR(200),
    PRO_PRECO DOUBLE NOT NULL,
    PRO_QTD_DISPONIVEL INT NOT NULL
);

CREATE TABLE IF NOT EXISTS ALUGUEL(
	ALU_ID INT AUTO_INCREMENT PRIMARY KEY,
    ALU_DATA_ALUGUEL DATE NOT NULL,
    ALU_VALOR_TOTAL DOUBLE NOT NULL,
    ALU_DATA_DEVOLUCAO DATE NOT NULL,
	FK_CLI_ID INT,
    FOREIGN KEY (FK_CLI_ID) REFERENCES CLIENTE(CLI_ID)
);

CREATE TABLE IF NOT EXISTS ALUGUEL_PRODUTO(
	ALP_ID INT AUTO_INCREMENT PRIMARY KEY,
    FK_PRO_ID INT NOT NULL,
    FK_ALU_ID INT NOT NULL,
	FOREIGN KEY (FK_PRO_ID) REFERENCES PRODUTO(PRO_ID),
    FOREIGN KEY (FK_ALU_ID) REFERENCES ALUGUEL(ALU_ID)
);

INSERT INTO CLIENTE  (CLI_NOME, CLI_CPF, CLI_EMAIL, CLI_TELEFONE) 
VALUES ("Lavinia", "46693372899", "lavinia@gmail.com", "924578970");

SELECT * FROM CLIENTE;

INSERT INTO CLIENTE  (CLI_NOME, CLI_CPF, CLI_EMAIL, CLI_TELEFONE) 
VALUES ("Gabriela", "46693345672", "gabriela@gmail.com", "924539876");

SELECT * FROM CLIENTE;

INSERT INTO PRODUTO ( PRO_NOME, 
					  PRO_PRECO,
                      PRO_QTD_DISPONIVEL)
VALUES 				  ("Iphone 18 Pro Max",
						589.90,
                        100);

SELECT * FROM PRODUTO;

INSERT INTO PRODUTO ( PRO_NOME,
					  PRO_DESCRICAO,
					  PRO_PRECO,
                      PRO_QTD_DISPONIVEL)
VALUES 				  ("Lancha Turbo",
					   "Lancha para rio mar",
					    2358.75,
                        5);

SELECT * FROM PRODUTO;

INSERT INTO ALUGUEL (ALU_DATA_ALUGUEL, ALU_DATA_DEVOLUCAO, ALU_VALOR_TOTAL, FK_CLI_ID)
VALUES ("2026-10-08", "2026-10-15", 600.89, 2);

SELECT * FROM ALUGUEL;

INSERT INTO ALUGUEL_PRODUTO (FK_PRO_ID, FK_ALU_ID)
VALUES (1,1);

SELECT * FROM ALUGUEL_PRODUTO;

INSERT INTO CLIENTE  (CLI_NOME, CLI_CPF, CLI_EMAIL, CLI_TELEFONE) 
VALUES ("Ana Silva", "12345678900", "ana.silva@example.com", "987654321"),
("Bruno Souza", "2345678911", "bruno.souza@example.com", "976543210"),
("Carla Mendes", "73522741897", "carla.mendes@example.com", "947248478"),
("Daniel Rocha", "92767536802", "daniel.rocha@example.com", "949956507"),
("Elaine Costa", "22843625831", "elaine.costa@example.com", "903214620"),
("Felipe Lima", "32948349850", "felipe.lima@example.com", "977628075"),
("Giselle Martins", "47607180877", "gisele.martins@example.com", "927979017"),
("Henrique Alves", "13621573844", "henrique.alves@example.com", "926720513"),
("Isabela Ferreira", "44547645817", "isabela.ferreira@example.com", "947248478");

SELECT * FROM CLIENTE;

INSERT INTO PRODUTO ( PRO_NOME, PRO_DESCRICAO, PRO_PRECO, PRO_QTD_DISPONIVEL)
VALUES ("Notebook Dell Inspiron","Notebook com processador Intel Core i7, 16GB de RAM e 512GB SSD.",450,10),
("Smartphone Samsung Galaxy S21","Smartphone com tela de 6.2 polegadas e 128GB de armazenamento.",350,15),
("TV LG 55 4K","Smart TV com resolução 4K e HDR.",250,2),
("Drone DJI Phantom 4","Drone com câmera 4K e estabilização de imagem",300,55),
("Câmera Canon EOS T7","Câmera DSLR com lente 18-55mm e 24.1MP.",450,10),
("Câmera GoPro Hero 9","Câmera de ação com resolução 5K e resistência à água",80,60),
("Tenda Eventos 5x5m","Tenda resistente à água e fácil de montar",200,4),
("Microfone Shure SM58","Microfone para apresentações e shows",40,35),
("Mesa de Som Behringer","Mesa de som com 16 canais e efeitos integrados.",500,3),
("Kit de Iluminação Fotográfican","Kit com softbox, tripés e lâmpadas de LED.",100,6);


SELECT * FROM PRODUTO;
SELECT PRO_NOME, PRO_DESCRICAO FROM PRODUTO;
SELECT PRO_NOME, PRO_DESCRICAO, PRO_PRECO FROM PRODUTO;
;
-- selecionar apenas os produtos com o preco > 250 
SELECT * FROM PRODUTO WHERE PRO_PRECO > 250;

-- selecionar apenas o produto den ID = 3 
SELECT PRO_ID, PRO_NOME FROM PRODUTO WHERE PRO_ID = 3;

-- selecionar todos os produtos que contem nootbook em qualquer parte do nome 
SELECT * FROM PRODUTO WHERE PRO_NOME LIKE '%NOTEBOOK%';

-- atualizar a quantidade de notbook para 200
UPDATE PRODUTO SET PRO_QTD_DISPONIVEL = 200 WHERE PRO_ID = 3; -- UPDATE tem que ter WHERE

SELECT * FROM PRODUTO;

-- atualizar a descricao do notbook para vazio
UPDATE PRODUTO 
SET PRO_DESCRICAO = NULL 
WHERE PRO_ID = 3; -- UPDATE tem que ter WHERE 

-- apagar (deletar) o notebook 
DELETE FROM PRODUTO 
WHERE PRO_ID = 3; -- DELETE tem que ter WHERE



