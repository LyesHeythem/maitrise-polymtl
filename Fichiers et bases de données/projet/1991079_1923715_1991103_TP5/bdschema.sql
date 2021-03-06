SET search_path = tp5DB;

DROP SCHEMA IF EXISTS TP5DB CASCADE;

CREATE SCHEMA TP5DB;

CREATE TABLE IF NOT EXISTS TP5DB.Clinique(
IdClin VARCHAR(10) NOT NULL,
rue VARCHAR(20),
province VARCHAR(20),
codePostal VARCHAR(10),
phoneNo VARCHAR(10),
telecopieurNo VARCHAR(10),
IdGerant VARCHAR(10) NOT NULL,
PRIMARY KEY (IdClin)
);

CREATE TABLE IF NOT EXISTS TP5DB.Personnel(
IdPerson VARCHAR(10) NOT NULL,
nom VARCHAR(20),
prenom VARCHAR(20),
adresse VARCHAR(50),
phoneNo VARCHAR(10),
dateNaissance DATE,
sexe VARCHAR(10),
nas VARCHAR(20),
fonction VARCHAR(20),
salaireAnnuel NUMERIC(15,3),
IdClin VARCHAR(10),
PRIMARY KEY (IdPerson)
);

ALTER TABLE Clinique ADD
CONSTRAINT Clin_fk
FOREIGN KEY (IdGerant)
REFERENCES Personnel(IdPerson);

ALTER TABLE Personnel ADD
CONSTRAINT Pers_fk
FOREIGN KEY (IdClin)
REFERENCES Clinique(IDClin);

ALTER TABLE Clinique ALTER CONSTRAINT Clin_fk
DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE Personnel ALTER CONSTRAINT Pers_fk
DEFERRABLE INITIALLY DEFERRED;

CREATE TABLE IF NOT EXISTS TP5DB.Proprietaire(
IdProp VARCHAR(10) NOT NULL,
IdClin VARCHAR(10) NOT NULL,
nom VARCHAR(20),
adresse VARCHAR(50),
phoneNo VARCHAR(10),
PRIMARY KEY (IdProp, IdClin),
FOREIGN KEY (IdClin) REFERENCES Clinique(IdClin)
);

CREATE TABLE IF NOT EXISTS TP5DB.Animal(
IdAnimal VARCHAR(10) NOT NULL,
IdClin VARCHAR(10) NOT NULL,
IdProp VARCHAR(10),
nom VARCHAR(20),
type VARCHAR(20),
description VARCHAR(40),
dateNaissance DATE,
dateInscriptionClinique DATE,
EtatActuel VARCHAR(30),
PRIMARY KEY (IdAnimal, IdClin),
FOREIGN KEY (IdProp, IdClin) REFERENCES Proprietaire(IdProp, IdClin)
);

CREATE TABLE IF NOT EXISTS TP5DB.Examen(
IdExam VARCHAR(10) NOT NULL,
date DATE,
heure TIME,
descResult VARCHAR(40),
IdAnimal VARCHAR(10),
IdClin VARCHAR(10),
IdPerson VARCHAR(10),
PRIMARY KEY (IdExam),
FOREIGN KEY (IdAnimal, IdClin) REFERENCES Animal(IdAnimal, IdClin),
FOREIGN KEY (IdPerson) REFERENCES Personnel(IdPerson) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS TP5DB.Traitement(
IdTrait VARCHAR(10) NOT NULL,
description VARCHAR(40),
cout NUMERIC(7,2),
quantite VARCHAR(10),
dateDebut DATE,
dateFin DATE,
IdAnimal VARCHAR(10),
IdClin VARCHAR(10),
IdPerson VARCHAR(10),
IdExam VARCHAR(10),
PRIMARY KEY (IdTrait),
FOREIGN KEY (IdAnimal, IdClin) REFERENCES Animal(IdAnimal, IdClin),
FOREIGN KEY (IdPerson) REFERENCES Personnel(IdPerson) ON DELETE SET NULL,
FOREIGN KEY (IdExam) REFERENCES Examen(IdExam)
);