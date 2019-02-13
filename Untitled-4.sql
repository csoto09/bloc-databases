CREATE TABLE dogs (
  "id"          INTEGER, 
  "name"        VARCHAR(25),
  "gender"      VARCHAR(1),
  "age"         INTEGER,
  "weight"      INTEGER,
  "breed"       TEXT,
  "intake_date" DATE,
  "in_foster"   DATE,
  
  PRIMARY KEY ("id")
);

CREATE TABLE cats (
  "id"            INTEGER,
  "name"          VARCHAR(16),
  "gender"        VARCHAR(1),
  "age"           INTEGER,
  "intake_date"   DATE,
  "adoption_date" DATE,
  
  PRIMARY KEY ("id")
);

CREATE TABLE adopters (
  "id"           INTEGER,
  "first_name"   VARCHAR(16),
  "last_name"    VARCHAR(16),
  "address"      VARCHAR(64),
  "phone_number" VARCHAR(16),
  
  PRIMARY KEY ("id")
);

CREATE TABLE volunteers (
  "id"                  INTEGER,
  "first_name"          VARCHAR(16),
  "last_name"           VARCHAR(16),
  "address"             VARCHAR(64),
  "phone_number"        VARCHAR(16),
  "available_to_foster" BOOLEAN,
  "foster_dog_id"       INTEGER,
  
  PRIMARY KEY ("id"),
  
  FOREIGN KEY ("foster_dog_id")
    REFERENCES "dogs" ("id")
    ON DELETE SET NULL,

  UNIQUE ("foster_dog_id")
);

CREATE TABLE dog_adoptions (
  "adopter_id" INTEGER,
  "dog_id"     INTEGER,
  "date"       DATE,
  "fee"        DECIMAL(13,4),
  
  FOREIGN KEY ("adopter_id")
    REFERENCES "adopters" ("id")
    ON DELETE CASCADE,
  
  FOREIGN KEY ("dog_id")
    REFERENCES "dogs" ("id")
    ON DELETE CASCADE,
  
  UNIQUE ("dog_id")
);

CREATE TABLE cat_adoptions (
  "adopter_id" INTEGER,
  "cat_id"     INTEGER,
  "date"       DATE,
  "fee"        DECIMAL(13,4),
  
  FOREIGN KEY ("adopter_id")
    REFERENCES "adopters" ("id")
    ON DELETE CASCADE,
  
  FOREIGN KEY ("cat_id")
    REFERENCES "cats" ("id")
    ON DELETE CASCADE,
  
  UNIQUE ("cat_id")
);

INSERT INTO dogs
  ("id",  "name",      "gender", "age", "weight", "breed",              "intake_date")
VALUES
  (10001, 'Boujee',    'F',       3,     36,      'labrador poodle',    '2017-06-22'),
  (10002, 'Munchkin',  'F',       0,     8,       'dachsund chihuahua', '2017-01-13'),
  (10004, 'Marley',    'M',       0,     10,      'labrador',           '2017-05-04'),
  (10003, 'Lassie',    'F',       7,     17,      'collie shepherd',    '2016-07-05'),
  (10006, 'Marmaduke', 'M',       7,     150,     'great dane',         '2016-03-22'),
  (10007, 'Rosco',     'M',       5,     180,     'rottweiler',         '2017-04-01');
    
INSERT INTO cats
  ("id", "name",     "gender", "age", "intake_date")
VALUES
  ( 1,   'Mushi',    'M',       1,    '2016-01-09'),
  ( 2,   'Seashell', 'F',       7,    '2016-01-09'),
  ( 3,   'Azul',     'M',       3,    '2016-01-11'),
  ( 4,   'Victoire', 'M',       7,    '2016-01-11'),
  ( 5,   'Nala',     'F',       1,    '2016-01-12');

INSERT INTO volunteers
  ("id", "first_name", "last_name", "address",                       "phone_number", "available_to_foster", "foster_dog_id")
VALUES
  ( 1,   'Albus',      'Dumbledore', '99 Godric''s Hollow',          '843-746-3649', false,                  NULL),
  ( 2,   'Rubeus',     'Hagrid',     '1 Edge of Forbidden Forest',   '256-667-2378', true,                   10002),
  ( 3,   'Remus',      'Lupin',      '12 Grimmauld Place',           '627-283-3771', true,                   NULL),
  ( 4,   'Sirius',     'Black',      '12 Grimmauld Place',           '878-666-4663', true,                   NULL),
  ( 5,   'Marjorie',   'Dursley',    '1990 Next Door to Fubster',    '463-528-2253', true,                   10006);

INSERT INTO adopters
  ("id", "first_name", "last_name", "address",              "phone_number")
VALUES
  ( 1,   'Hermione',   'Granger',   '32 Granger''s Street',   '676-464-7837'),
  ( 2,   'Arabella',   'Figg',      '4 Wisteria Walk',        '843-228-5239'),
  ( 3,   'Argus',      'Filch',     '14 Old Hogwarts Office', '568-366-7747');

INSERT INTO cat_adoptions
  ("adopter_id", "cat_id", "date",                            "fee")
VALUES
  ( 1,            3,       CURRENT_DATE - INTERVAL '45 DAYS',  50),
  ( 2,            1,       CURRENT_DATE - INTERVAL '20 DAYS',  70),
  ( 3,            4,       CURRENT_DATE - INTERVAL '15 DAYS',  10);

INSERT INTO dog_adoptions
  ("adopter_id", "dog_id", "date",      "fee")
VALUES
  ( 3,            10007,   '2017-08-27', 80);