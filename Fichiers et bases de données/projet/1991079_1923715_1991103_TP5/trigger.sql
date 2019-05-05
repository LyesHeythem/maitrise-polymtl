SET search_path = tp5DB;

-- On crée une table archive et un trigger pour le point 5 de la partie application web

CREATE TABLE IF NOT EXISTS TP5DB.Archive(
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

CREATE OR REPLACE FUNCTION add_to_Audit() RETURNS TRIGGER AS $audit$
BEGIN
IF(TG_OP='DELETE') THEN INSERT INTO TP5DB.Archive VALUES (OLD.IdAnimal, OLD.IdClin, OLD.IdProp, OLD.nom, OLD.type, OLD.description, OLD.dateNaissance, OLD.dateInscriptionClinique, OLD.EtatActuel); END IF;
RETURN NEW;
END;
$audit$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS auditGrade ON TP5DB.Animal;
														  
--- CrÃƒÂ©ation du trigger
CREATE TRIGGER auditGrade
AFTER DELETE ON TP5DB.Animal
FOR EACH ROW EXECUTE PROCEDURE add_to_Audit();