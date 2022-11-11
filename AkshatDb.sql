CREATE TABLE Bands(
    Band_no NUMBER(2),
    name VARCHAR2(20) NOT NULL,
    site VARCHAR2(15),
    band_chief VARCHAR2(15),
    CONSTRAINT Bands_pk PRIMARY KEY (Band_no),
    CONSTRAINT Bands_site_unique UNIQUE (site),
    CONSTRAINT Bands_chief_unique UNIQUE (band_chief),
    CONSTRAINT Bands_chief_fk FOREIGN KEY (band_chief) REFERENCES Cats(nickname)
)

CREATE TABLE Functions(
    function VARCHAR2(10),
    min_mice NUMBER(3),
    max_mice NUMBER(3),
    CONSTRAINT Functions_pk PRIMARY KEY (function),
    CONSTRAINT check_min_mice CHECK (min_mice > 5),
    CONSTRAINT check_max_mice CHECK (max_mice > 5 AND max_mice <= 200)  
)

CREATE TABLE Enemies(
    enemy_name VARCHAR2(15),
    hostility_degree NUMBER(2),
    species VARCHAR2(15),
    bride VARCHAR(20),
    CONSTRAINT Enemies_pk PRIMARY KEY (enemy_name),
    CONSTRAINT Enemies_hostility_degree CHECK(hostility_degree >= 1 AND hostility_degree <=10) 
)

CREATE TABLE Cats(
    name VARCHAR2(15) NOT NULL,
    gender VARCHAR2(1),
    nickname VARCHAR2(15),
    function VARCHAR2(10),
    chief VARCHAR2(15),
    in_herd_since DATE DEFAULT sysdate,
    mice_ration NUMBER(3),
    mice_extra NUMBER(3),
    band_no NUMBER(2),
    CONSTRAINT Cats_gender_check CHECK(gender = 'F' OR gender = 'M'),
    CONSTRAINT Cats_pk PRIMARY KEY (nickname),
    CONSTRAINT Cats_function_fk FOREIGN KEY (function) REFERENCES Functions (function),
    CONSTRAINT Cats_chief_fk FOREIGN KEY (nickname) REFERENCES Cats(nickname)
)

ALTER TABLE Cats ADD CONSTRAINT Cats_band_no_fk FOREIGN KEY (band_no) REFERENCES Bands(Band_no)

CREATE TABLE Incidents(
    nickname VARCHAR2(15),
    enemy_name VARCHAR2(15),
    indcident_date DATE NOT NULL,
    incident_desc VARCHAR2(50),
    CONSTRAINT Incidents_nickname_fk1 FOREIGN KEY (nickname) REFERENCES Cats(nickname),
    CONSTRAINT Incidents_enemy_name_fk2 FOREIGN KEY (enemy_name) REFERENCES Enemies(enemy_name),
    CONSTRAINTS Incidents_partial_pk PRIMARY KEY (nickname, enemy_name)
)



