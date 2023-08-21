CREATE OR REPLACE FUNCTION agora(DATE , BOOLEAN )
RETURNS DATE AS 
$function$
BEGIN 
RETURN (SELECT CASE WHEN $2 THEN CURRENT_DATE ELSE NULL END ) ;

END ;
$function$ 
IMMUTABLE
LANGUAGE plpgsql ; 

CREATE OR REPLACE FUNCTION agoratime(DATE , BOOLEAN )
RETURNS TIME AS 
$function$
BEGIN 
RETURN (SELECT CASE WHEN $2 THEN CURRENT_TIME ELSE NULL END ) ;

END ;
$function$ 
IMMUTABLE
LANGUAGE plpgsql ; 

CREATE OPERATOR **(
    leftarg = DATE , 
    rightarg = BOOLEAN ,
    FUNCTION = agora,
    commutator = **
);
CREATE OPERATOR +*(
    leftarg = DATE , 
    rightarg = BOOLEAN ,
    FUNCTION = agoratime ,
    commutator = +*
);
CREATE OR REPLACE FUNCTION agora( )
RETURNS TIMESTAMP WITH TIME ZONE AS 
$function$
BEGIN 
RETURN NOW();

END ;
$function$ 
IMMUTABLE
LANGUAGE plpgsql ; 