CREATE OR REPLACE PROCEDURE lab.proc_testecur1() AS
$procedure$
DECLARE 
cur1 refcursor ;
rRecord RECORD ; 
BEGIN 

    BEGIN 
    TRUNCATE lab.testecur1 ;
    COMMIT ;
    END; 
INSERT INTO lab.testecur1(descricao , valor , idtestecur1tipo ) 
SELECT gen , valor , t.id 
FROM generate_series(1 , 10 , 1) gen
CROSS JOIN generate_series(1 , 10 , 2) valor 
CROSS JOIN lab.testecur1tipo t ;

OPEN cur1 SCROLL FOR SELECT * 
    FROM lab.testecur1 ;

    LOOP 
    FETCH NEXT FROM cur1  INTO rRecord;
     IF NOT FOUND THEN 
     COMMIT ; 
     OPEN cur1 SCROLL FOR SELECT * 
     FROM lab.testecur1 ;
     MOVE FIRST IN cur1;
     FETCH NEXT FROM cur1  INTO rRecord;
     EXIT WHEN NOT FOUND ;
     END IF;
    BEGIN 
        UPDATE lab.testecur1 SET descricao = 'random()::VARCHAR(80) '
        WHERE CURRENT OF cur1 ; 
        RAISE NOTICE '% % %' ,rRecord.id , rRecord.valor , rRecord.descricao;
        INSERT INTO lab.testecur1(descricao , valor , idtestecur1tipo ) 
        SELECT gen , valor , t.id 
        FROM generate_series(1 , 2 , 1) gen
        CROSS JOIN generate_series(1 , 2 ,1) valor 
        CROSS JOIN lab.testecur1tipo t ;
    END ;
    END LOOP ;


END ;

$procedure$
LANGUAGE plpgsql ;