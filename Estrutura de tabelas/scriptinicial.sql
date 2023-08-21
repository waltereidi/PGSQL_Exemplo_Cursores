CREATE SCHEMA IF NOT EXISTS lab ;
CREATE SEQUENCE IF NOT EXISTS lab.testecur1tipo_seq;  
CREATE TABLE IF NOT EXISTS lab.testecur1tipo( 
    id BIGINT DEFAULT nextval('lab.testecur1tipo_seq'::regclass ) , 
    nome VARCHAR(80) NOT NULL, 
    CONSTRAINT testecur1tipo_pkey PRIMARY KEY (id)
);

CREATE SEQUENCE IF NOT EXISTS lab.testecur1_seq; 
CREATE TABLE IF NOT EXISTS lab.testecur1(
    id BIGINT DEFAULT nextval('lab.testecur1_seq'::regclass ) , 
    descricao VARCHAR(80) ,
    valor INTEGER ,
    idtestecur1tipo BIGINT NOT NULL , 

    CONSTRAINT testecur1_pkey PRIMARY KEY (id) ,
    CONSTRAINT fk_testecur1_testecur1tipo FOREIGN KEY (idtestecur1tipo) REFERENCES lab.testecur1tipo(id)  

);


INSERT INTO lab.testecur1tipo (nome )
VALUES ('teste de cursores');
INSERT INTO lab.testecur1tipo (nome) 
VALUES ('cursor em teste');


CREATE TABLE IF NOT EXISTS lab.testeparallelworkers(
    id BIGINT ,
    campodate DATE , 
    agora DATE GENERATED ALWAYS AS ( campodate**TRUE ) STORED
)
WITH ( parallel_workers = 1);