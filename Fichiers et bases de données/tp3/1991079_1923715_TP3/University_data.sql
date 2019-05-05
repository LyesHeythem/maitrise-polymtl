SET search_path = UniversityDB;

INSERT INTO UNIVERSITYDB.Etudiant VALUES ('Simon Nissan', 's1', 'M', 20, '4.2');
INSERT INTO UNIVERSITYDB.Etudiant VALUES ('Laurent Passepartout', 's2', 'M', 30, '3.2');
INSERT INTO UNIVERSITYDB.Etudiant VALUES ('Alexandra Laplace', 's3', 'F', 40, '2.8');
INSERT INTO UNIVERSITYDB.Etudiant VALUES ('Alex Laplace', 's4', 'F', 30, '3.5');
INSERT INTO UNIVERSITYDB.Etudiant VALUES ('Simon Belanger', 's5', 'M', 20, '3.2');
INSERT INTO UNIVERSITYDB.Etudiant VALUES ('Mark Zuck', 's6', 'M', 30, '1.2');
INSERT INTO UNIVERSITYDB.Etudiant VALUES ('Sophie Yenamarre', 's7', 'M', 30, '4.2');

INSERT INTO UNIVERSITYDB.Dept VALUES ('genChem', 9);
INSERT INTO UNIVERSITYDB.Dept VALUES ('gigl', 40);
INSERT INTO UNIVERSITYDB.Dept VALUES ('Maths', 5);

INSERT INTO UNIVERSITYDB.Prof VALUES ('p1', 'AZ', 'gigl');		
INSERT INTO UNIVERSITYDB.Prof VALUES ('p2', 'MG', 'gigl');
INSERT INTO UNIVERSITYDB.Prof VALUES ('p3', 'NZ', 'Maths');
INSERT INTO UNIVERSITYDB.Prof VALUES ('p4', 'LH', 'Maths');	

INSERT INTO UNIVERSITYDB.Cours VALUES ('105', 'programmation','gigl');
INSERT INTO UNIVERSITYDB.Cours VALUES ('200', 'NLP','gigl');
INSERT INTO UNIVERSITYDB.Cours VALUES ('304',	'Geometrie 101', 'Maths');
INSERT INTO UNIVERSITYDB.Cours VALUES ('305',	'Theoremes en geometrie', 'Maths');
INSERT INTO UNIVERSITYDB.Cours VALUES ('306',	'Geometrie intermediaire', 'Maths');
INSERT INTO UNIVERSITYDB.Cours VALUES ('307',	'Geometrie','Maths');

INSERT INTO UNIVERSITYDB.Section VALUES ('105', '1', 'p1');
INSERT INTO UNIVERSITYDB.Section VALUES ('105', '2', 'p1');
INSERT INTO UNIVERSITYDB.Section VALUES ('305', '1', 'p3');
INSERT INTO UNIVERSITYDB.Section VALUES ('305', '2', 'p4');

INSERT INTO UNIVERSITYDB.Inscription VALUES ('s3', '105', '1', 90);
INSERT INTO UNIVERSITYDB.Inscription VALUES ('s2', '105', '1', 60);
INSERT INTO UNIVERSITYDB.Inscription VALUES ('s1', '105', '2', 70);
INSERT INTO UNIVERSITYDB.Inscription VALUES ('s5', '105', '2', 70);
INSERT INTO UNIVERSITYDB.Inscription VALUES ('s5', '305', '2', 100);
INSERT INTO UNIVERSITYDB.Inscription VALUES ('s6', '305', '2', 65);


-- INSERT INTO UNIVERSITYDB.Inscription VALUES ('s6', '1', '2', 65);
/*Lorsqu'on entre un étudiant dans Inscription avec un numéro de cours qui n’existe pas dans la table des cours,
on a un message d'erreur qui nous dit qu'on viole la contrainte de clé étrangère de (cno, sectno).
La clé (cno, sectno)=(1, 2) n'est pas présente dans la table « section ».
Si un cours n'existe pas , on ne peut pas inscrire d'étudiant dedans.*/
