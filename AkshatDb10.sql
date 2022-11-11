INSERT INTO Functions VALUES ('BOSS',90,110);
INSERT INTO Functions VALUES ('THUG',70,90);
INSERT INTO Functions VALUES ('CATCHING',60,70);
INSERT INTO Functions VALUES ('CATCHER',50,60);
INSERT INTO Functions VALUES ('CAT',40,50);
INSERT INTO Functions VALUES ('NICE',20,30);
INSERT INTO Functions VALUES ('DIVISIVE',45,55);
INSERT INTO Functions VALUES ('HONORARY',6,25);

INSERT INTO Enemies VALUES ('KAZIO',10,'MAN','BOTTLE');
INSERT INTO Enemies VALUES ('STUPID SOPHIA',1,'MAN','BEAD');
INSERT INTO Enemies VALUES ('UNRULY DYZIO',7,'MAN','CHEWING GUM');
INSERT INTO Enemies VALUES ('DUN',4,'DOG','BON');
INSERT INTO Enemies VALUES ('WILD BILL',10,'DOG',NULL);
INSERT INTO Enemies VALUES ('REKS',2,'DOG','BONE');
INSERT INTO Enemies VALUES ('BETHOVEN',1,'DOG','PEDIGRIPALL');
INSERT INTO Enemies VALUES ('SLYBOOTS',5,'FOX','CHICKEN');
INSERT INTO Enemies VALUES ('SLIM',1,'PINE',NULL);
INSERT INTO Enemies VALUES ('BASIL',3,'ROOSTER','HEN TO THE HERD');

SELECT * FROM Bands

INSERT INTO Bands VALUES (1,'SUPERIORS','WHOLE AREA',NULL);
INSERT INTO Bands VALUES (2,'BLACK KNIGHTS','FIELD',NULL);
INSERT INTO Bands VALUES (3,'WHITE HUNTERS','ORCHARD',NULL);
INSERT INTO Bands VALUES (4,'PINTO HUNTERS','HILLOCK',NULL);
INSERT INTO Bands VALUES (5,'ROCKERS','FARM',NULL);


INSERT INTO Cats VALUES ('MRUCZEK','M','TIGER','BOSS',NULL,'2002-01-01',103,33,1);
INSERT INTO Cats VALUES ('BOLEK','M','BALD','THUG','TIGER','2006-08-15',72,21,2);
INSERT INTO Cats VALUES ('JACEK','M','CAKE','CATCHING','BALD','2008-12-01',67,NULL,2);
INSERT INTO Cats VALUES ('BARI','M','TUBE','CATCHER','BALD','2009-09-01',56,NULL,2);
INSERT INTO Cats VALUES ('MICKA','W','LOLA','NICE','TIGER','2009-10-14',25,47,1);
INSERT INTO Cats VALUES ('KOREK','M','ZOMBIES','THUG','TIGER','2004-03-16',75,13,3);
INSERT INTO Cats VALUES ('PUNIA','W','HEN','CATCHING','ZOMBIES','2008-01-01',61,NULL,3);
INSERT INTO Cats VALUES ('LUCEK','M','ZERO','CAT','HEN','2010-03-01',43,NULL,3);
INSERT INTO Cats VALUES ('SONIA','W','FLUFFY','NICE','ZOMBIES','2010-11-18',20,35,3);
INSERT INTO Cats VALUES ('PUCEK','M','REEF','CATCHING','TIGER','2006-10-15',65,NULL,4);
INSERT INTO Cats VALUES ('LATKA','W','EAR','CAT','REEF','2011-01-01',40,NULL,4);
INSERT INTO Cats VALUES ('DUDEK','M','SMALL','CAT','REEF','2011-05-15',40,NULL,4);
INSERT INTO Cats VALUES ('CHYTRY','M','BOLEK','DIVISIVE','TIGER','2002-05-05',50,NULL,1);
INSERT INTO Cats VALUES ('ZUZIA','W','FAST','CATCHING','BALD','2006-07-21',65,NULL,2);
INSERT INTO Cats VALUES ('RUDA','W','LITTLE','NICE','TIGER','2006-09-17',22,42,1);
INSERT INTO Cats VALUES ('BELA','W','MISS','NICE','BALD','2008-02-01',24,28,2);
INSERT INTO Cats VALUES ('KSAWERY','M','MAN','CATCHER','REEF','2008-07-12',51,NULL,4);
INSERT INTO Cats VALUES ('MELA','W','LADY','CATCHER','REEF','2008-11-01',51,NULL,4);

SELECT * FROM Cats;
SELECT * FROM Incidents;
SELECT * FROM Enemies;
SELECT * FROM Functions;
SELECT * FROM Bands;

DROP TABLE Incidents;
DROP TABLE Cats;
DROP TABLE Enemies;
DROP TABLE Functions;
DROP TABLE Bands;

alter table Cats drop constraint Cats_gender_check ;
alter table Cats add CONSTRAINT Cats_gender_check CHECK(gender = 'W' OR gender = 'M');

select constraint_name,constraint_type 
from user_constraints
where table_name = Cats;

update Bands
set band_chief  = 'TIGER'
where band_no =1 ; 


update Bands
set band_chief  = 'BALD'
where band_no = 2; 

update Bands
set band_chief  = 'ZOMBIES'
where band_no = 3; 

update Bands
set band_chief  = 'REEF'
where band_no = 4; 
select * from Bands ; 

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';


INSERT INTO Incidents VALUES ('TIGER','KAZIO','2004-10-13','HE HAS TRYING TO STICK ON THE FORK');
INSERT INTO Incidents VALUES ('ZOMBIES', 'UNRULY DYZIO','2005-03-07','HE FOOTED AN EYE FROM PROCAST');
INSERT INTO Incidents VALUES ('BOLEK','KAZIO','2005-03-29','HE CLEANED DOG');
INSERT INTO Incidents VALUES ('FAST', 'STUPID SOPHIA' ,'2006-09-12','SHE USED THE CAT AS A CLOTH');
INSERT INTO Incidents VALUES ('LITTLE','SLYBOOTS','2007-03-07','HE RECOMMENDED HIMSELF AS A HUSBAND');
INSERT INTO Incidents VALUES ('TIGER','WILD BILL','2007-06-12','HE TRIED TO KILL');
INSERT INTO Incidents VALUES ('BOLEK','WILD BILL','2007-11-10','HE BITE THE EAR');
INSERT INTO Incidents VALUES ('MISS','WILD BILL','2008-12-12','HE BITCHED');
INSERT INTO Incidents VALUES ('MISS','KAZIO','2009-01-07','HE CAUGHT THE TAIL AND MADE A WIND');
INSERT INTO Incidents VALUES ('LADY','KAZIO','2009-02-07','HE WANTED TO SKIN OFF');
INSERT INTO Incidents VALUES ('MAN','REKS','2009-04-14','HE BARKED EXTREMELY RUDELY');
INSERT INTO Incidents VALUES ('BALD','BETHOVEN','2009-05-11','HE DID NOT SHARE THE PORRIDGE');
INSERT INTO Incidents VALUES ('TUBE','WILD BILL','2009-09-03','HE TOOK THE TAIL');
INSERT INTO Incidents VALUES ('CAKE','BASIL','2010-07-12','HE PREVENTED THE CHICKEN FROM BEING HUNTED');
INSERT INTO Incidents VALUES ('FLUFFY','SLIM','2010-11-19','SHE THREW CONES');
INSERT INTO Incidents VALUES ('HEN','DUN','2010-12-14','HE CHASED');
INSERT INTO Incidents VALUES ('SMALL','SLYBOOTS','2011-07-13','HE TOOK THE STOLEN EGGS');
INSERT INTO Incidents VALUES ('EAR', 'UNRULY DYZIO','2011-07-14','HE THREW STONES');

--Task1
SELECT enemy_name "Enemy", incident_desc "Fault description"  FROM Incidents WHERE EXTRACT(YEAR FROM indcident_date) = 2009;

--Task2
SELECT name "NAME", function "FUNCTION", in_herd_since "WITH AS FROM" FROM Cats WHERE gender = 'W' AND in_herd_since BETWEEN '2005-09-01' AND '2007-07-31';

--Task3
SELECT enemy_name "ENEMY", species "SPECIES", hostility_degree "HOSTILITY_DEGREE" FROM Enemies WHERE bride IS NULL ORDER BY hostility_degree ASC;

--Task4
SELECT name || ' called ' || nickname || ' (fun.' || function || ') has been catching mice in band' || band_no || 'since' || in_herd_since "ALL_ABOUT_MALE_CATS" FROM Cats WHERE gender = 'M' ORDER BY in_herd_since DESC, nickname ASC;   

--Task5
SELECT nickname, REGEXP_REPLACE(REGEXP_REPLACE(nickname, 'A', '#', 1,1), 'L', '%', 1, 1) "After replacing A and L" FROM Cats WHERE nickname LIKE '%A%L%' OR nickname LIKE '%L%A%';

--Task6
SELECT name, in_herd_since "In herd",ROUND(mice_ration * 0.9) "Ate", TO_CHAR(ADD_MONTHS(in_herd_since, 6), 'YYYY-MM-DD') "Increase", mice_ration "Eat"
  FROM Cats
 WHERE in_herd_since <= ADD_MONTHS(SYSDATE /*EXAMPLE: TO_DATE('2020/04/04', 'YYYY/MM/DD')*/, -132) 
   AND EXTRACT(MONTH FROM in_herd_since) BETWEEN 3 AND 9
 ORDER BY mice_ration DESC;
 
 --Task7
 SELECT name, NVL(mice_ration * 3, 0) "MICE QUARTERLY", NVL(mice_extra * 3, 0) "EXTRA QUARTERLY"
  FROM Cats
 WHERE mice_ration >= 55 
   AND mice_ration > NVL(mice_extra, 0) * 2
 ORDER BY 2 DESC, 1;
 
 --Task8
 SELECT name, DECODE(FLOOR((mice_ration+NVL(mice_extra, 0)) * 12 / 660), 0, 'Below 660', DECODE(CEIL((mice_ration+NVL(mice_extra, 0)) * 12 / 660), 1, 'Limit', ((mice_ration+NVL(mice_extra, 0)) * 12) )) "Eats annually"
  FROM Cats
 ORDER BY name;
 
 --Task9
 SELECT nickname, in_herd_since "IN HERD", DECODE(FLOOR(EXTRACT(DAY FROM in_herd_since)/16), 
        0, DECODE(FLOOR(EXTRACT(DAY FROM (NEXT_DAY(LAST_DAY (TO_DATE(10, 'MM')) - 7, TO_CHAR(TO_DATE('10-02-1999', 'DD-MM-YYYY'),'DAY'))))/EXTRACT( DAY FROM TO_DATE('27-10-2020' /*'29-10-2020'*/, 'DD-MM-YYYY'))), 
        0, NEXT_DAY(LAST_DAY (TO_DATE(10 + 1, 'MM')) - 7, TO_CHAR(TO_DATE('10-02-1999', 'DD-MM-YYYY'),'DAY')),
           NEXT_DAY(LAST_DAY (TO_DATE(10, 'MM')) - 7, TO_CHAR(TO_DATE('10-02-1999', 'DD-MM-YYYY'),'DAY'))),
           NEXT_DAY(LAST_DAY (TO_DATE(10+1, 'MM')) - 7, TO_CHAR(TO_DATE('10-02-1999', 'DD-MM-YYYY'),'DAY'))) "PAYMENT"
FROM Cats ORDER BY 2;

--Task10
SELECT nickname || DECODE(1, COUNT(*), ' - unique', ' - non-unique') "Uniqueness of the nickname"
  FROM Cats
 GROUP BY nickname
 ORDER BY 1;

SELECT chief || DECODE(1, COUNT(*), ' - unique', ' - non-unique') "Uniqueness of the nickname"
  FROM Cats
 WHERE chief IS NOT NULL
 GROUP BY chief
 ORDER BY 1;
 
 --Task11
--Question is COUNT(*) better or COUNT(nickname)
SELECT nickname "NICKNAME", COUNT(nickname) "Number of Enemies"
FROM Incidents
GROUP BY nickname
HAVING COUNT(nickname) > 1;
 
 --Task12
SELECT 'Number of cats= ' || COUNT(nickname) || ' hunts as ' || function || ' and eats max. ' || MAX(mice_ration + NVL(mice_ration, 0)) " "
FROM cats
WHERE gender != 'M'
GROUP BY function
HAVING
function != 'BOSS'
AND
AVG(mice_ration + NVL(mice_ration, 0)) > 50;

--Task13
SELECT band_no "BAND no", gender "GENDER", MIN(mice_ration) "Minimum ration"
FROM cats
GROUP BY band_no, gender;

--Task14
SELECT LEVEL "Level", nickname "Nickname", function "Function", band_no "Band No"
FROM cats
WHERE gender = 'M'
START WITH function = 'BOSS'
CONNECT BY chief = PRIOR nickname;

--Task15
SELECT
    LPAD(TO_CHAR(LEVEL - 1), (LEVEL -1) * 4 + LENGTH(TO_CHAR(LEVEL - 1)), '===>') || '            ' || name "Hiear",
    NVL(chief, 'Master yourself') "Nickname of the chief",
    function "Function"
FROM cats
WHERE mice_ration > 0
START WITH chief IS NULL
CONNECT BY chief = PRIOR nickname;

--Task16
SELECT
    RPAD(' ', (LEVEL - 1) * 4, ' ') || nickname
FROM cats
START WITH
    gender = 'M' AND
    EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM in_herd_since) > 11 AND
    mice_extra IS NULL
CONNECT BY nickname = PRIOR chief;

