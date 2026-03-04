-- parte I
-- criando tabela
CREATE TABLE VEICULOS
(
    placa CHAR(8),
    ano NUMBER(4),
    km NUMBER(6),
    marca VARCHAR(50),
    modelo VARCHAR(50)
);

-- inserindo valores
INSERT INTO VEICULOS
VALUES ('IJK-1212', 2022, 0, 'Chevrolet', 'Onix');

INSERT INTO VEICULOS (placa, ano, km, marca, modelo)
VALUES ('IJM-1556', 2015, 72045, 'Volkswagen', 'Gol');

-- realizando pesquisa
SELECT placa, ano
FROM VEICULOS
WHERE km = 0;

-- alterando registros
UPDATE VEICULOS
SET km = 0;
/*  !!!      ATENÇÃO     !!!
    !!! UPDATE sem WHERE !!!
*/

UPDATE VEICULOS
SET modelo = 'Cruze'
WHERE placa = 'IJK-1212';

UPDATE VEICULOS
SET km = 0
WHERE km < 10;

/*  Experimente escrever o comando UPDATE para somar 
    100 quilômetros a todos os veículos cujos anos 
    estão entre 2015 e 2021 (inclusive)
*/
UPDATE VEICULOS
SET km = km + 100
WHERE ano BETWEEN 2015 AND 2021;

-- excluindo registros
DELETE FROM VEICULOS
WHERE placa = 'IJM-1556'; 

-- ordenar registros
SELECT placa, km
FROM VEICULOS
WHERE ano > 2000
ORDER BY km DESC;

SELECT marca, modelo
FROM VEICULOS
ORDER BY marca DESC, modelo ASC;

-- função agregadora
SELECT COUNT(*)
FROM VEICULOS;

SELECT COUNT(*)
FROM VEICULOS
WHERE km = 0;

/*  Agora tente descobrir quantos veículos da 
    marca Ford estão cadastrados no banco de dados.
*/
SELECT COUNT(*)
FROM VEICULOS
WHERE marca = 'Ford';

-- evitando duplicatas
SELECT DISTINCT marca
FROM VEICULOS;

-- parte II
-- valores nulos
CREATE TABLE PESSOAS
(
    cpf VARCHAR(20) NOT NULL,
    nome VARCHAR(150) NOT NULL,
    idade NUMBER(3) NULL,
    endereco VARCHAR(150)
);

-- ordem normal das colunas:
INSERT INTO PESSOAS (cpf, nome, idade, endereco)
VALUES ('32809', 'Maria', 25, 'Rua A, 20');

-- outra ordem qualquer das colunas:
INSERT INTO PESSOAS (idade, endereco, cpf, nome)
VALUES (25, 'Rua A, 20', '30599', 'Pedro');

-- valores nulos:
INSERT INTO PESSOAS (cpf, nome, idade, endereco)
VALUES ('29385', 'Carlos', NULL, NULL);

INSERT INTO PESSOAS (cpf, nome, idade, endereco)
VALUES ('39582', 'Alice', 80, NULL);

INSERT INTO PESSOAS (cpf, nome, idade, endereco)
VALUES ('78838', 'Antonio', NULL, 'Rua B, 80');

-- campos omitidos (valores nulos implicitos):
INSERT INTO PESSOAS (cpf, nome)
VALUES ('90038', 'Ana Paula');

INSERT INTO PESSOAS (cpf, nome, idade)
VALUES ('23487', 'Patricia', 18);

INSERT INTO PESSOAS (cpf, nome, endereco)
VALUES ('23363', 'Jose', 'Rua C, 50');

/*  Experimente alguns comandos SELECT
    para ver como os dados aparecem. Por
    exemplo, descubra quantas pessoas omitiram
    alguma informação para o cadastro.
*/
SELECT COUNT(*) 
  FROM PESSOAS
 WHERE idade    IS NULL
    OR endereco IS NULL;

-- Pessoas com nomes iniciando com a letra 'A':
SELECT *
FROM PESSOAS
WHERE nome LIKE 'A%';

-- Pessoas com nomes iniciando com 'Ana':
SELECT *
FROM PESSOAS
WHERE nome LIKE 'Ana%';

-- Pessoas com nomes que terminam com 'Silva':
SELECT *
FROM PESSOAS
WHERE nome LIKE '%Silva';

-- Pessoas com nomes que contenham 'Carlos':
SELECT *
FROM PESSOAS
WHERE nome LIKE '%Carlos%';

-- Pode corresponder a Maria ou Mario:
SELECT *
FROM PESSOAS
WHERE nome LIKE 'Mari_ da Silva';

-- Pessoas que tenham 25, 30 ou 40 anos de idade:
SELECT *
FROM PESSOAS
WHERE idade IN (25, 30, 40);

-- removendo e adicionando colunas

ALTER TABLE PESSOAS
DROP COLUMN idade;

ALTER TABLE PESSOAS
ADD sexo CHAR(1);

-- manipulando datas

ALTER TABLE PESSOAS
DROP COLUMN idade;

ALTER TABLE PESSOAS
ADD datanasc DATE NULL;

INSERT INTO PESSOAS (cpf, nome, datanasc, endereco)
VALUES ('29048', 'Roberto', '03-FEB-1980', 'Rua D, 80');

-- Formato alternativo (padrão ANSI YYYY-MM-DD):
-- Deve-se acrescentar a palavra DATE antes da data.
INSERT INTO PESSOAS (cpf, nome, datanasc, endereco)
VALUES ('29048', 'Roberto', DATE '1980-02-03', 'Rua D, 80');

-- DUAL é uma tabela interna do Oracle usada com
-- o comando SELECT quando não precisamos de uma
-- tabela real do banco de dados.
SELECT TO_CHAR(SYSDATE, 'MONTH, DD, YYYY HH24:MI:SS')
FROM DUAL;

SELECT nome, TO_CHAR(datanasc, 'MONTH, DD, YYYY')
FROM PESSOAS;

INSERT INTO PESSOAS (cpf, nome, datanasc, endereco)
VALUES (
    '29920',
    'Beto',
    TO_DATE('25-FEB-1979 21:36:28', 'DD-MON-YYYY HH24:MI:SS'),
    'Rua E, 80'
);

SELECT SYSDATE + 1
FROM DUAL;

-- Parte III
-- Restrição de Integridade de Entidade
    -- Primary Keys - Chaves Primarias
    -- Alternate Keys - Chaves Candidatas
CREATE TABLE ALUNOS (
    nroMatricula VARCHAR(10) PRIMARY KEY,
    cpf VARCHAR(20) UNIQUE,
    email VARCHAR(100) UNIQUE,
    nome VARCHAR(150) NOT NULL,
    anoIngresso NUMBER(4) NOT NULL,
    endereco VARCHAR(150) NULL,
    sexo CHAR(1) NOT NULL
);

DROP TABLE ALUNOS;

-- Forma alternativa
CREATE TABLE ALUNOS (
    nroMatricula VARCHAR(10) NOT NULL,
    cpf VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    nome VARCHAR(150) NOT NULL,
    anoIngresso NUMBER(4) NOT NULL,
    endereco VARCHAR(150) NULL,
    sexo CHAR(1) NOT NULL,
    CONSTRAINT PK_ALUNOS PRIMARY KEY (nroMatricula),
    CONSTRAINT AK1_ALUNOS UNIQUE (cpf),
    CONSTRAINT AK2_ALUNOS UNIQUE (email)
);

-- Restrição de Integridade de Domínio
ALTER TABLE ALUNOS
ADD CONSTRAINT CK_AnoIngr CHECK (anoIngresso > 2000);

ALTER TABLE ALUNOS
ADD CONSTRAINT CK_sexo CHECK (sexo IN ('M', 'F')); 

-- Restrição de Integridade Referencial
    -- Foreign Keys - Chaves Estrangeiras
CREATE TABLE ESTADOS (
    uf CHAR(2) NOT NULL,
    nome VARCHAR2(40) NOT NULL,
    regiao CHAR(2) NOT NULL,
    CONSTRAINT PK_ESTADOS PRIMARY KEY (uf)
);

CREATE TABLE CIDADES (
    cod_cidade NUMBER(4) NOT NULL,
    nome VARCHAR2(60) NOT NULL,
    uf CHAR(2) NOT NULL,
    CONSTRAINT PK_CIDADES PRIMARY KEY (cod_cidade)
);

ALTER TABLE CIDADES
ADD (
    CONSTRAINT FK_EST_CID
        FOREIGN KEY (uf)
        REFERENCES ESTADOS (uf)
);

-- Relacionamentos do tipo muitos-para-muitos
/*  Crie uma tabela MEDICOS com os 
    campos ‘crm’, ‘nome’ e ‘especialidade’
*/
CREATE TABLE MEDICOS (
    crm VARCHAR2(20) NOT NULL,
    nome VARCHAR2(60) NOT NULL,
    especialidade VARCHAR2(60) NOT NULL,
    CONSTRAINT PK_MEDICOS PRIMARY KEY (crm)
);

/*  Crie uma tabela PACIENTES com 
    os campos ‘cpf’, ‘nome’ e ‘sexo’
*/
CREATE TABLE PACIENTES (
    cpf VARCHAR2(20) NOT NULL,
    nome VARCHAR2(60) NOT NULL,
    sexo CHAR(1) NOT NULL,
    CONSTRAINT PK_PACIENTES PRIMARY KEY (cpf)
);

/*  Crie uma tabela chamada MEDICOSPACIENTES 
    com os campos ‘crm’ e ‘cpf’
*/
CREATE TABLE MEDICOSPACIENTES  (
    crm VARCHAR2(20) NOT NULL,
    cpf VARCHAR2(20) NOT NULL,
    CONSTRAINT PK_MEDICOSPACIENTES PRIMARY KEY (crm, cpf)
);

/*  Defina uma FK entre MEDICOSPACIENTES.crm e MEDICOS.crm
    Defina outra FK entre MEDICOSPACIENTES.cpf e PACIENTES.cpf
*/
ALTER TABLE MEDICOSPACIENTES
ADD (
    CONSTRAINT FK_MEDICOS
        FOREIGN KEY (crm)
        REFERENCES MEDICOS (crm),
    CONSTRAINT FK_PACIENTES
        FOREIGN KEY (cpf)
        REFERENCES PACIENTES (cpf)
);

/*  Crie uma tabela de consultas,
    que contenha a data de cada consulta
*/
CREATE TABLE CONSULTAS  (
    cod_consulta NUMBER(4) NOT NULL,
    crm VARCHAR2(20) NOT NULL,
    cpf VARCHAR2(20) NOT NULL,
    data_consulta DATE NOT NULL
    CONSTRAINT PK_CONSULTAS PRIMARY KEY (cod_consulta)
);

-- parte IV
-- JOIN
-- Estados que tem cidade - INNER JOIN
SELECT EST.uf, EST.nome, CID.uf, CID.nome
FROM ESTADOS EST INNER JOIN CIDADES CID
ON EST.uf = CID.uf;

-- Todos os estados, menos os que nao tem cidade - OUTER JOIN
SELECT EST.uf, EST.nome, CID.uf, CID.nome
FROM ESTADOS EST LEFT OUTER JOIN CIDADES CID
ON EST.uf = CID.uf;

SELECT EST.uf, EST.nome, CID.uf, CID.nome
FROM ESTADOS EST LEFT OUTER JOIN CIDADES CID
ON EST.uf = CID.uf;

SELECT EST.uf, EST.nome, CID.uf, CID.nome
FROM ESTADOS EST RIGHT OUTER JOIN CIDADES CID
ON EST.uf = CID.uf;

SELECT EST.uf, EST.nome, CID.uf, CID.nome
FROM ESTADOS EST FULL OUTER JOIN CIDADES CID
ON EST.uf = CID.uf;