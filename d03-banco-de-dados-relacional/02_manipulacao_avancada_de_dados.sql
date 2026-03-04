-- Funcoes
/*
    Funcoes numericas mais comuns:
        ABS(n), ACOS(n), ASIN(n), ATAN(n), ATAN2(n), CEIL(n),
        COS(n), COSH(n), EXP(n), FLOOR(n), LN(n), LOG(n),
        MOD(n,m), POWER(n,m), ROUND(n,m), SIGN(n), SIN(n),
        SINH(n), SQRT(n), TAN(n), TANH(n), TRUNC(n,m)
    Funcoes sobre caracteres mais comuns:
        LOWER(s), UPPER(s), INITCAP(s), LTRIM(s1,s2), 
        RTRIM(s1,s2), CONCAT(s1,s2), LPAD(s1,n,s2), 
        RPAD(s1,n,s2), LENGTH(s), SUBSTR(s,n,m),
        REPLACE(s1,s2,s3), CHR(n), SOUNDEX(s), TRANSLATE(s1,s2,s3)
    Funcoes de agregacao mais comuns:
        COUNT (*)
        COUNT ([ALL|DISTINCT] nome_da_coluna)
        SUM ([ALL|DISTINCT] nome_da_coluna)
        AVG ([ALL|DISTINCT] nome_da_coluna)
        MAX ([ALL|DISTINCT] nome_da_coluna)
        MIN ([ALL|DISTINCT] nome_da_coluna)
        STDDEV ([ALL|DISTINCT] nome_da_coluna)
        VARIANCE ([ALL|DISTINCT] nome_da_coluna) 
*/

SELECT AVG(preco) MEDIA FROM PRODUTOS;

SELECT AVG(NVL(preco,0)) MEDIA FROM PRODUTOS; -- NVL converte valor nulo

SELECT MAX(preco) FROM PRODUTOS;

SELECT COUNT(*) NUM_CLIENTES FROM CLIENTES;

SELECT COUNT(ddd) FROM TELEFONES;

-- GROUP BY
CREATE TABLE PRODS (
    codigo NUMERIC(3) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    preco NUMERIC (5,2) NOT NULL,
    tipo CHAR(1) NULL, -- [S]uprimento, [C]omponente, [P]eriférico
    CONSTRAINT PK1 PRIMARY KEY (codigo)
);

INSERT INTO PRODS VALUES( 10, 'HD' ,200 ,'C');
INSERT INTO PRODS VALUES( 11, 'Memoria' ,250 ,'C');
INSERT INTO PRODS VALUES( 12, 'Impressora' ,680 ,'P');
INSERT INTO PRODS VALUES( 13, 'Processador' ,600 ,'C');
INSERT INTO PRODS VALUES( 14, 'DVD-RW' ,2 ,'S');
INSERT INTO PRODS VALUES( 15, 'Papel A4' ,19 ,'S');
INSERT INTO PRODS VALUES( 16, 'Scanner' ,199 ,'P');

-- Deixando um produto sem usuario associado
UPDATE PRODS
SET usuario = NULL
WHERE codigo = 13;
-- Executando novamente
SELECT tipo, usuario, AVG(preco)
FROM PRODS
GROUP BY tipo, usuario
ORDER BY tipo, usuario

SELECT CID.nome, COUNT(*) QTD
FROM CIDADES CID JOIN ENDERECOS END
ON CID.cod_cidade = END.cod_cidade
GROUP BY CID.nome
HAVING COUNT(*) > 10;

-- Subconsultas
SELECT titulo
FROM PRODUTOS
WHERE preco >
    (
        SELECT preco
        FROM PRODUTOS
        WHERE cod_produto = 9
    );

SELECT titulo
FROM PRODUTOS
WHERE importado = 'N' AND preco >
    (
        SELECT MAX(preco)
        FROM PRODUTOS
        WHERE importado = 'S'
     ); 

SELECT ano_lançamento, AVG(preco)
FROM PRODUTOS
GROUP BY ano_lancamento
HAVING AVG(preco) >
    (
        SELECT AVG(preco)
        FROM PRODUTOS
        WHERE ano_lancamento = trunc(sysdate, 'YYYY')
    );

-- Atualizacoes com subconsulta
-- INSERT
INSERT INTO PRODS (codigo, nome, preco, tipo)
SELECT
    cod_produto
    SUBSTR(titulo, 1, 15),
    preco,
    'L' -- coluna constante para todos os registros
FROM produtos
WHERE importado = 'N'
AND titulo LIKE 'A%'
AND cod_produto > 2;

-- update
UPDATE PRODUTOS
SET preco = preco - (10/100 * preco)
WHERE cod_produto IN
    ( SELECT cod_produto
    FROM PRODUTOS
    WHERE prazo_entrega > 30 );

-- delete
DELETE FROM PRODS
WHERE codigo IN
    ( SELECT cod_produto
    FROM PRODUTOS
    WHERE
    importado = 'N'
    AND titulo LIKE 'A%'
    AND cod_produto > 100 );

-- index
CREATE INDEX idx_autores_nome ON AUTORES (nome);

-- sequence
CREATE SEQUENCE seq_titulacoes START WITH 6;

SELECT seq_titulações.nextval FROM DUAL;

INSERT INTO TITULACOES ( cod_titulação, titulo) VALUES (seq_titulações.nextval,
‘Tecnnologo’ );

SELECT seq_titulações.currval FROM DUAL; 

CREATE TABLE TITULACOES
(
    cod_titulacao NUMBER(4) DEFAULT seq_titulacoes.nextval NOT NULL,
    titulo VARCHAR (20) NOT NULL,
    CONSTRAINT pk_titulacoes PRIMARY KEY (cod_titulacao)
);