
create table particionamento (
    id bigserial , 
    nome varchar(50) , 
    descricao varchar(120) , 
    criadoem timestamp, 
    constraint particionamento_pkey primary key (id , criadoem) 

)partition by range (criadoem) ;

create table particionamento202301 partition of particionamento 
for values from ('2023-01-01') to ('2023-02-01') ;

create table particionamento202302 partition of particionamento 
for values from ('2023-02-01') to ('2023-03-01'); 

create table particionamento202303 partition of particionamento
for values from ('2023-03-01') to ('2023-04-01');

create table particionamento202304 partition of particionamento
for values from ('2023-04-01') to ('2023-05-01');


-- Inserir dados ; 
insert into particionamento (nome,descricao,criadoem)
values ('walter' , 'particionamento' , '2023-01-30') ; 

insert into particionamento (nome,descricao,criadoem)
values ('tiago' , 'particionamento' , '2023-02-01');

insert into particionamento (nome,descricao,criadoem)
values ('carlos' , 'particionamento' , '2023-02-02');

insert into particionamento (nome,descricao,criadoem)
values ('maria eduarda' , 'particionamento' , '2023-03-01');

insert into particionamento (nome,descricao,criadoem)
values ('linho' , 'particionamento' , '2023-03-03');

select * from particionamento202301 ; 
select * from particionamento202302 ; 
select * from particionamento202303 ; 
select * from particionamento202304 ; 
 
update particionamento set criadoem = criadoem+interval '1 month'; 

select * from particionamento202301 ; 
select * from particionamento202302 ; 
select * from particionamento202303 ; 
select * from particionamento202304 ; 
select * from particionamento ; 

delete from particionamento ; 

insert into particionamento (nome , descricao , criadoem ) 
select i.table_name||gen , i.table_schema||gen , criadoem
from information_schema.tables i
cross join generate_series(1 , 10) gen
cross join generate_series('2023-01-01'::timestamp , '2023-04-30'::timestamp , interval '3 minutes' ) criadoem;

DO 
$transaction$
begin 
for i in reverse 100000 .. 0 by -1 loop
update set nome = nome||1  from 
(select min(id) , min(nome) from group by )


end ;
$transaction$
language plpgsql ; 
