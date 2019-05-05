SET search_path = UniversityDB;

-- 1)Une fonction nbEtudiants en PL/pgSQL qui retourne le nombre total d’étudiants; 

CREATE OR REPLACE FUNCTION UNIVERSITYDB.totalEtudiants ()
RETURNS integer AS $total$
declare
	total integer;
BEGIN
	SELECT count(*) into total FROM UNIVERSITYDB.Etudiant;
	RETURN total;
END;
$total$ LANGUAGE plpgsql;

select UNIVERSITYDB.totalEtudiants();

/*2)Un trigger auditGrade qui crée un enregistrement dans une table archive
Audit. Ce trigger se déclenche lorsque la note du cours est mise à jour. L’archive devra
conserver les informations d’inscription ainsi que la date où la modification de la note du
cours a été effectuée ; */

-- Création de la table Audit
CREATE TABLE IF NOT EXISTS UNIVERSITYDB.Audit(
sId VARCHAR(10),
cno VARCHAR(10),
sectno VARCHAR(10),
note NUMERIC(5,2),
datemod DATE,
FOREIGN KEY (sId) REFERENCES UNIVERSITYDB.Etudiant(sId),
FOREIGN KEY (cno, sectno) REFERENCES UNIVERSITYDB.Section(cno,sectno));

CREATE OR REPLACE FUNCTION add_to_Audit() RETURNS TRIGGER AS $audit$
BEGIN
IF(TG_OP='UPDATE') THEN INSERT INTO UNIVERSITYDB.Audit VALUES (NEW.sId, NEW.cno, NEW.sectno, NEW.note, current_date); END IF;
RETURN NEW;
END;
$audit$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS auditGrade ON UNIVERSITYDB.Inscription;
														  
--- CrÃ©ation du trigger
CREATE TRIGGER auditGrade
AFTER UPDATE ON UNIVERSITYDB.Inscription
FOR EACH ROW EXECUTE PROCEDURE add_to_Audit();

-- Test du trigger
UPDATE UNIVERSITYDB.Inscription SET note = 70 WHERE sId = 's3' AND cno = '105' AND sectno = '1';
UPDATE UNIVERSITYDB.Inscription SET note = 80 WHERE sId = 's3' AND cno = '105' AND sectno = '1';

SELECT * FROM UNIVERSITYDB.Audit;











