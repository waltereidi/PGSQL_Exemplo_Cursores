create sequence if not exists lab.fillfactor_seq ; 
create table if not exists lab.fillfactor( 
    id bigint default nextval('fillfactor_seq'::regclass)  , 
    descricao varchar(120) ,
    nome varchar(60) , 
    d_datacadastro date default current_date , 
    t_horacadastro time default current_time ,
    constraint fillfactor_pkey primary key (id) 
) with (fillfactor = 70 );

create table if not exists lab.fillfactor01(constraint fillfactor01_chk check( date_part('month' , d_datacadastro ) = 1 ) ) inherits(lab.fillfactor) with (fillfactor = 70);
create table if not exists lab.fillfactor02(constraint fillfactor02_chk check( date_part('month' , d_datacadastro ) = 2 ) ) inherits(lab.fillfactor) with (fillfactor = 70);
create table if not exists lab.fillfactor03(constraint fillfactor03_chk check( date_part('month' , d_datacadastro ) = 3 ) ) inherits(lab.fillfactor) with (fillfactor = 70);
create table if not exists lab.fillfactor04(constraint fillfactor04_chk check( date_part('month' , d_datacadastro ) = 4 ) ) inherits(lab.fillfactor) with (fillfactor = 70);
create table if not exists lab.fillfactor05(constraint fillfactor05_chk check( date_part('month' , d_datacadastro ) = 5 ) ) inherits(lab.fillfactor) with (fillfactor = 70);
create table if not exists lab.fillfactor06(constraint fillfactor06_chk check( date_part('month' , d_datacadastro ) = 6 ) ) inherits(lab.fillfactor) with (fillfactor = 70);
create table if not exists lab.fillfactor07(constraint fillfactor07_chk check( date_part('month' , d_datacadastro ) = 7 ) ) inherits(lab.fillfactor) with (fillfactor = 70);
create table if not exists lab.fillfactor08(constraint fillfactor08_chk check( date_part('month' , d_datacadastro ) = 8 ) ) inherits(lab.fillfactor) with (fillfactor = 70);
create table if not exists lab.fillfactor09(constraint fillfactor09_chk check( date_part('month' , d_datacadastro ) = 9 ) ) inherits(lab.fillfactor) with (fillfactor = 70);
create table if not exists lab.fillfactor10(constraint fillfactor10_chk check( date_part('month' , d_datacadastro ) = 10 ) ) inherits(lab.fillfactor) with (fillfactor = 70);
create table if not exists lab.fillfactor11(constraint fillfactor11_chk check( date_part('month' , d_datacadastro ) = 11 ) ) inherits(lab.fillfactor) with (fillfactor = 70);
create table if not exists lab.fillfactor12(constraint fillfactor12_chk check( date_part('month' , d_datacadastro ) = 12 ) ) inherits(lab.fillfactor) with (fillfactor = 70);

create or replace function lab.func_trg_partioninmgni()
returns trigger as 
$function$
    BEGIN 
        if tg_op ='UPDATE' and date_part('month' , NEW.d_datacadastro) <> date_part('month' , OLD.d_datacadastro) then 
        case when date_part('month' , OLD.d_datacadastro ) = 1 then delete from lab.fillfactor01 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 2 then delete from lab.fillfactor02 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 3 then delete from lab.fillfactor03 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 4 then delete from lab.fillfactor04 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 5 then delete from lab.fillfactor05 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 6 then delete from lab.fillfactor06 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 7 then delete from lab.fillfactor07 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 8 then delete from lab.fillfactor08 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 9 then delete from lab.fillfactor09 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 10 then delete from lab.fillfactor10 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 11 then delete from lab.fillfactor11 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 12 then delete from lab.fillfactor12 where id = OLD.id ; 
        else return null  ;end case;
             insert into fillfactor values(new.*);
        return null ; 

        end if ; 
        raise notice  '%',NEW.d_datacadastro;
        

        

        if tg_op='INSERT' then 
        case when date_part('month' , NEW.d_datacadastro ) = 1 then insert into lab.fillfactor01 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 2 then insert into lab.fillfactor02 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 3 then insert into lab.fillfactor03 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 4 then insert into lab.fillfactor04 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 5 then insert into lab.fillfactor05 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 6 then insert into lab.fillfactor06 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 7 then insert into lab.fillfactor07 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 8 then insert into lab.fillfactor08 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 9 then insert into lab.fillfactor09 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 10 then insert into lab.fillfactor10 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 11 then insert into lab.fillfactor11 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 12 then insert into lab.fillfactor12 values(new.*);
        else return null  ;end case; 
        return null;
        end if ; 

        if tg_op='DELETE' then 
        case when date_part('month' , old.d_datacadastro ) = 1 then delete from lab.fillfactor01 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 2 then delete from lab.fillfactor02 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 3 then delete from lab.fillfactor03 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 4 then delete from lab.fillfactor04 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 5 then delete from lab.fillfactor05 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 6 then delete from lab.fillfactor06 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 7 then delete from lab.fillfactor07 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 8 then delete from lab.fillfactor08 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 9 then delete from lab.fillfactor09 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 10 then delete from lab.fillfactor10 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 11 then delete from lab.fillfactor11 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 12 then delete from lab.fillfactor12 where id = OLD.id;
        else return null  ;end case ; 
        return null;
        end if ; 

        return null ; 
    END; 

$function$ 
cost 5 
language plpgsql;
--


create or replace function lab.func_trg_partioninmgni()
returns trigger as 
$function$
    BEGIN 

        if tg_op='INSERT' then 
        case when date_part('month' , NEW.d_datacadastro ) = 1 then insert into lab.fillfactor01 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 2 then insert into lab.fillfactor02 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 3 then insert into lab.fillfactor03 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 4 then insert into lab.fillfactor04 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 5 then insert into lab.fillfactor05 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 6 then insert into lab.fillfactor06 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 7 then insert into lab.fillfactor07 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 8 then insert into lab.fillfactor08 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 9 then insert into lab.fillfactor09 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 10 then insert into lab.fillfactor10 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 11 then insert into lab.fillfactor11 values(new.*);
             when date_part('month' , NEW.d_datacadastro ) = 12 then insert into lab.fillfactor12 values(new.*);
        else return null  ;end case; 
        return null;
        end if ; 
       
    END; 

$function$ 
cost 5 
language plpgsql;

--


create or replace function lab.func_trg_partioninmgnu()
returns trigger as 
$function$
    BEGIN 
        if tg_op ='UPDATE' and date_part('month' , NEW.d_datacadastro) <> date_part('month' , OLD.d_datacadastro) then 
        case when date_part('month' , OLD.d_datacadastro ) = 1 then delete from lab.fillfactor01 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 2 then delete from lab.fillfactor02 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 3 then delete from lab.fillfactor03 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 4 then delete from lab.fillfactor04 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 5 then delete from lab.fillfactor05 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 6 then delete from lab.fillfactor06 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 7 then delete from lab.fillfactor07 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 8 then delete from lab.fillfactor08 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 9 then delete from lab.fillfactor09 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 10 then delete from lab.fillfactor10 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 11 then delete from lab.fillfactor11 where id = OLD.id ; 
             when date_part('month' , OLD.d_datacadastro ) = 12 then delete from lab.fillfactor12 where id = OLD.id ; 
        else return null  ;end case;
             insert into fillfactor values(new.*);
        return null ; 
        else 
            case when date_part('month' , NEW.d_datacadastro ) = 1 then update lab.fillfactor01 set id = new.id , nome = new.nome , descricao=new.descricao , d_datacadastro=new.d_datacadastro , t_horacadastro=new.t_horacadastro  where id = OLD.id ; 
                 when date_part('month' , NEW.d_datacadastro ) = 2 then update lab.fillfactor02 set id = new.id , nome = new.nome , descricao=new.descricao , d_datacadastro=new.d_datacadastro , t_horacadastro=new.t_horacadastro  where id = OLD.id ; 
                 when date_part('month' , NEW.d_datacadastro ) = 3 then update lab.fillfactor03 set id = new.id , nome = new.nome , descricao=new.descricao , d_datacadastro=new.d_datacadastro , t_horacadastro=new.t_horacadastro  where id = OLD.id ; 
                 when date_part('month' , NEW.d_datacadastro ) = 4 then update lab.fillfactor04 set id = new.id , nome = new.nome , descricao=new.descricao , d_datacadastro=new.d_datacadastro , t_horacadastro=new.t_horacadastro  where id = OLD.id ; 
                 when date_part('month' , NEW.d_datacadastro ) = 5 then update lab.fillfactor05 set id = new.id , nome = new.nome , descricao=new.descricao , d_datacadastro=new.d_datacadastro , t_horacadastro=new.t_horacadastro  where id = OLD.id ; 
                 when date_part('month' , NEW.d_datacadastro ) = 6 then update lab.fillfactor06 set id = new.id , nome = new.nome , descricao=new.descricao , d_datacadastro=new.d_datacadastro , t_horacadastro=new.t_horacadastro  where id = OLD.id ; 
                 when date_part('month' , NEW.d_datacadastro ) = 7 then update lab.fillfactor07 set id = new.id , nome = new.nome , descricao=new.descricao , d_datacadastro=new.d_datacadastro , t_horacadastro=new.t_horacadastro  where id = OLD.id ; 
                 when date_part('month' , NEW.d_datacadastro ) = 8 then update lab.fillfactor08 set id = new.id , nome = new.nome , descricao=new.descricao , d_datacadastro=new.d_datacadastro , t_horacadastro=new.t_horacadastro  where id = OLD.id ; 
                 when date_part('month' , NEW.d_datacadastro ) = 9 then update lab.fillfactor09 set id = new.id , nome = new.nome , descricao=new.descricao , d_datacadastro=new.d_datacadastro , t_horacadastro=new.t_horacadastro  where id = OLD.id ; 
                 when date_part('month' , NEW.d_datacadastro ) = 10 then update lab.fillfactor10 set id = new.id , nome = new.nome , descricao=new.descricao , d_datacadastro=new.d_datacadastro , t_horacadastro=new.t_horacadastro  where id = OLD.id ; 
                 when date_part('month' , NEW.d_datacadastro ) = 11 then update lab.fillfactor11 set id = new.id , nome = new.nome , descricao=new.descricao , d_datacadastro=new.d_datacadastro , t_horacadastro=new.t_horacadastro  where id = OLD.id ; 
                 when date_part('month' , NEW.d_datacadastro ) = 12 then update lab.fillfactor12 set id = new.id , nome = new.nome , descricao=new.descricao , d_datacadastro=new.d_datacadastro , t_horacadastro=new.t_horacadastro  where id = OLD.id ; 
                 else return null ; end case ; 
                 return null ;

        end if ; 
        raise notice  '%',NEW.d_datacadastro;
        
        return null ; 
    END; 

$function$ 
cost 5 
language plpgsql;


create or replace function lab.func_trg_partioninmgnd()
returns trigger as 
$function$
    BEGIN 
        if tg_op='DELETE' then 
        case when date_part('month' , old.d_datacadastro ) = 1 then delete from lab.fillfactor01 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 2 then delete from lab.fillfactor02 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 3 then delete from lab.fillfactor03 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 4 then delete from lab.fillfactor04 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 5 then delete from lab.fillfactor05 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 6 then delete from lab.fillfactor06 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 7 then delete from lab.fillfactor07 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 8 then delete from lab.fillfactor08 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 9 then delete from lab.fillfactor09 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 10 then delete from lab.fillfactor10 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 11 then delete from lab.fillfactor11 where id = OLD.id;
             when date_part('month' , old.d_datacadastro ) = 12 then delete from lab.fillfactor12 where id = OLD.id;
        else return null  ;end case ; 
        return null;
        end if ; 
        
        return null ; 
    END; 

$function$ 
cost 5 
language plpgsql;

create trigger trg_partitionmngi 
before insert
on lab.fillfactor
for each row 
execute function lab.func_trg_partioninmgni();
--Triggers partições 
create trigger trg_partitionmngu 
before update
on lab.fillfactor01
for each row 
execute function lab.func_trg_partioninmgnu();

create trigger trg_partitionmngd 
before delete 
on lab.fillfactor01
for each row 
execute function lab.func_trg_partioninmgnd();

--Triggers partições 
create trigger trg_partitionmngu 
before update
on lab.fillfactor02
for each row 
execute function lab.func_trg_partioninmgnu();

create trigger trg_partitionmngd 
before delete 
on lab.fillfactor02
for each row 
execute function lab.func_trg_partioninmgnd();
--Triggers partições 
create trigger trg_partitionmngu 
before update
on lab.fillfactor03
for each row 
execute function lab.func_trg_partioninmgnu();

create trigger trg_partitionmngd 
before delete 
on lab.fillfactor03
for each row 
execute function lab.func_trg_partioninmgnd();
--Triggers partições 
create trigger trg_partitionmngu 
before update
on lab.fillfactor04
for each row 
execute function lab.func_trg_partioninmgnu();

create trigger trg_partitionmngd 
before delete 
on lab.fillfactor04
for each row 
execute function lab.func_trg_partioninmgnd();
--Triggers partições 
create trigger trg_partitionmngu 
before update
on lab.fillfactor05
for each row 
execute function lab.func_trg_partioninmgnu();

create trigger trg_partitionmngd 
before delete 
on lab.fillfactor05
for each row 
execute function lab.func_trg_partioninmgnd();
--Triggers partições 
create trigger trg_partitionmngu 
before update
on lab.fillfactor06
for each row 
execute function lab.func_trg_partioninmgnu();

create trigger trg_partitionmngd 
before delete 
on lab.fillfactor06
for each row 
execute function lab.func_trg_partioninmgnd();
--Triggers partições 
create trigger trg_partitionmngu 
before update
on lab.fillfactor07
for each row 
execute function lab.func_trg_partioninmgnu();

create trigger trg_partitionmngd 
before delete 
on lab.fillfactor07
for each row 
execute function lab.func_trg_partioninmgnd();
--Triggers partições 
create trigger trg_partitionmngu 
before update
on lab.fillfactor08
for each row 
execute function lab.func_trg_partioninmgnu();

create trigger trg_partitionmngd 
before delete 
on lab.fillfactor08
for each row 
execute function lab.func_trg_partioninmgnd();
--Triggers partições 
create trigger trg_partitionmngu 
before update
on lab.fillfactor09
for each row 
execute function lab.func_trg_partioninmgnu();

create trigger trg_partitionmngd 
before delete 
on lab.fillfactor09
for each row 
execute function lab.func_trg_partioninmgnd();
--Triggers partições 
create trigger trg_partitionmngu 
before update
on lab.fillfactor10
for each row 
execute function lab.func_trg_partioninmgnu();

create trigger trg_partitionmngd 
before delete 
on lab.fillfactor10
for each row 
execute function lab.func_trg_partioninmgnd();
--Triggers partições 
create trigger trg_partitionmngu 
before update
on lab.fillfactor11
for each row 
execute function lab.func_trg_partioninmgnu();

create trigger trg_partitionmngd 
before delete 
on lab.fillfactor11
for each row 
execute function lab.func_trg_partioninmgnd();
--Triggers partições 
create trigger trg_partitionmngu 
before update
on lab.fillfactor12
for each row 
execute function lab.func_trg_partioninmgnu();

create trigger trg_partitionmngd 
before delete 
on lab.fillfactor12
for each row 
execute function lab.func_trg_partioninmgnd();
--------------------------------------------------------------------------



create extension if not exists pg_trgm;

create index  d_datacadastro_fillfactor01 on lab.fillfactor01(d_datacadastro);
create index  d_datacadastro_fillfactor02 on lab.fillfactor02(d_datacadastro);
create index  d_datacadastro_fillfactor03 on lab.fillfactor03(d_datacadastro);
create index  d_datacadastro_fillfactor04 on lab.fillfactor04(d_datacadastro);
create index  d_datacadastro_fillfactor05 on lab.fillfactor05(d_datacadastro);
create index  d_datacadastro_fillfactor06 on lab.fillfactor06(d_datacadastro);
create index  d_datacadastro_fillfactor07 on lab.fillfactor07(d_datacadastro);
create index  d_datacadastro_fillfactor08 on lab.fillfactor08(d_datacadastro);
create index  d_datacadastro_fillfactor09 on lab.fillfactor09(d_datacadastro);
create index  d_datacadastro_fillfactor10 on lab.fillfactor10(d_datacadastro);
create index  d_datacadastro_fillfactor11 on lab.fillfactor11(d_datacadastro);
create index  d_datacadastro_fillfactor12 on lab.fillfactor12(d_datacadastro);

create index  nome_fillfactor01 on lab.fillfactor01 using gin (nome gin_trgm_ops );
create index  nome_fillfactor02 on lab.fillfactor02 using gin (nome gin_trgm_ops );
create index  nome_fillfactor03 on lab.fillfactor03 using gin (nome gin_trgm_ops );
create index  nome_fillfactor04 on lab.fillfactor04 using gin (nome gin_trgm_ops );
create index  nome_fillfactor05 on lab.fillfactor05 using gin (nome gin_trgm_ops );
create index  nome_fillfactor06 on lab.fillfactor06 using gin (nome gin_trgm_ops );
create index  nome_fillfactor07 on lab.fillfactor07 using gin (nome gin_trgm_ops );
create index  nome_fillfactor08 on lab.fillfactor08 using gin (nome gin_trgm_ops );
create index  nome_fillfactor09 on lab.fillfactor09 using gin (nome gin_trgm_ops );
create index  nome_fillfactor10 on lab.fillfactor10 using gin (nome gin_trgm_ops );
create index  nome_fillfactor11 on lab.fillfactor11 using gin (nome gin_trgm_ops );
create index  nome_fillfactor12 on lab.fillfactor12 using gin (nome gin_trgm_ops );

------ comandos
insert into lab.fillfactor (descricao , nome , d_datacadastro , t_horacadastro )
select 'desc'||b , 'nome '||a , ('01-'||LPAD(a::text, 2 ,'0')||'-2023')::date , current_time  
from generate_series( 1 , 12 , 1 ) a 
cross join generate_series( 1 , 1000000, 1) b;

do
$$
begin
for i in reverse 1000000 .. 0 by 1
loop 
update lab.fillfactor set nome = 'update1 '||date_part('month' , a.d_datacadastro ) , d_datacadastro=a.d_datacadastro+interval '1 month' 
from lab.fillfactor a
where  fillfactor.id = (select max(id) from fillfactor where nome ~* 'nome' );
end loop;
end;
$$language plpgsql ; 