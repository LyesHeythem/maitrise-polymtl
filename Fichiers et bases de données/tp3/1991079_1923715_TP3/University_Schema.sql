SET search_path = UniversityDB;

DROP SCHEMA IF EXISTS UNIVERSITYDB CASCADE;
CREATE SCHEMA UNIVERSITYDB;

CREATE DOMAIN UNIVERSITYDB.sexType AS CHAR
	CHECK (VALUE IN ('M', 'F'));

CREATE TABLE IF NOT EXISTS UNIVERSITYDB.Etudiant(
snom VARCHAR(30),
sId VARCHAR(10),
sexe sexType,
age INTEGER,
moyenne NUMERIC(5,2),
PRIMARY KEY (sId));

CREATE TABLE IF NOT EXISTS UNIVERSITYDB.Dept(
dId VARCHAR(10),
nombrephds INTEGER,
PRIMARY KEY (dId));

CREATE TABLE IF NOT EXISTS UNIVERSITYDB.Prof(
pId VARCHAR(10),
pnom VARCHAR(30),
dep VARCHAR(10),
PRIMARY KEY (pId),
FOREIGN KEY (dep) REFERENCES UNIVERSITYDB.Dept(dID));

CREATE TABLE IF NOT EXISTS UNIVERSITYDB.Cours(
cno VARCHAR(10),
cnom VARCHAR(30),
dep VARCHAR(10),
PRIMARY KEY (cno),
FOREIGN KEY (dep) REFERENCES UNIVERSITYDB.Dept(dID));

CREATE TABLE IF NOT EXISTS UNIVERSITYDB.Section(
cno VARCHAR(10),
sectno VARCHAR(10),
pId VARCHAR(10),
PRIMARY KEY (cno, sectno),
FOREIGN KEY (pId) REFERENCES UNIVERSITYDB.Prof(pID) ON DELETE SET NULL,
FOREIGN KEY (cno) REFERENCES UNIVERSITYDB.Cours(cno) ON DELETE CASCADE);

CREATE TABLE IF NOT EXISTS UNIVERSITYDB.Inscription(
sId VARCHAR(10),
cno VARCHAR(10),
sectno VARCHAR(10),
note NUMERIC(5,2),
PRIMARY KEY (sId, cno, sectno),
FOREIGN KEY (sId) REFERENCES UNIVERSITYDB.Etudiant(sId),
FOREIGN KEY (cno, sectno) REFERENCES UNIVERSITYDB.Section(cno,sectno));





