SET search_path = TP5DB;

-- 1) Lister les le numéro et nom des cliniques, leur adresse et leur gestionnaire, ordonnés par le numéro de clinique
SELECT IdClin, rue, province, codePostal, IdGerant FROM TP5DB.Clinique ORDER BY IdClin;
-- 2) Lister les noms des animaux sans doublons dans toutes les cliniques
SELECT nom FROM TP5DB.Animal EXCEPT (SELECT nom FROM TP5DB.Animal EXCEPT SELECT DISTINCT nom FROM TP5DB.Animal);
-- 3) Lister les numéros et noms des propriétaires d’animaux ainsi que les détails de leurs animaux dans une clinique donnée (à vous de la choisir)
SELECT P.IdProp, A.nom, A.IdAnimal, A.IdClin, A.IdProp, A.nom, A.type, A.description, A.dateNaissance, A.dateInscriptionClinique, A.EtatActuel FROM TP5DB.Proprietaire AS P JOIN TP5DB.Animal AS A ON (P.IdProp = A.IdProp AND P.IdClin = A.IdClin) WHERE A.IdClin = 'CLI001';
-- 4) Lister l’ensemble des examens d’un animal donné
SELECT * FROM TP5DB.Examen WHERE (IdAnimal = 'ANI001' AND IdClin = 'CLI001');
-- 5) Lister le détail des traitements d’un animal suite à un examen donné
SELECT * FROM TP5DB.Traitement WHERE (IdAnimal = 'ANI001' AND IdClin = 'CLI001' AND IdExam = 'EXA001');
-- 6) Lister le salaire total des employés par clinique ordonné par numéro de clinique
SELECT IdClin, SUM(salaireAnnuel) FROM TP5DB.Personnel GROUP BY IdClin ORDER BY IdClin;
-- 7) Lister le nombre total d’animaux d’un type donné (vous pouvez le choisir) dans chaque clinique
SELECT IdClin, COUNT(*) FROM (SELECT * FROM TP5DB.Animal WHERE type = 'chien') AS S GROUP BY IdClin;
-- 8) Lister le coût minimum, maximum et moyen des traitements
SELECT MIN(cout) AS coutMinimal, MAX(cout) AS coutMaximal, AVG(cout) AS coutMoyen FROM TP5DB.Traitement;
-- 9) Quels sont les noms des employés de plus de 50 ans ordonnés par nom ?
SELECT nom FROM TP5DB.Personnel WHERE (CURRENT_DATE - dateNaissance)/365>=50 ORDER BY nom;
-- 10) Quels sont les propriétaires dont le nom contient « blay » ?
SELECT * FROM TP5DB.Proprietaire WHERE nom LIKE '%blay%';
-- 11) Supprimez le vétérinaire « Jean Tremblay »
DELETE FROM TP5DB.Personnel WHERE prenom = 'Jean' AND nom = 'Tremblay' AND fonction = 'Vétérinaire';
SELECT * FROM TP5DB.Personnel;
-- 12) Lister les détails des propriétaires qui ont un chat et un chien
(SELECT P.IdProp, P.IdClin, P.nom, P.adresse, P.phoneNo FROM TP5DB.Proprietaire AS P JOIN TP5DB.Animal AS A ON (P.IdProp = A.IdProp AND P.IdClin = A.IdClin) WHERE type = 'chien')
INTERSECT
(SELECT P.IdProp, P.IdClin, P.nom, P.adresse, P.phoneNo FROM TP5DB.Proprietaire AS P JOIN TP5DB.Animal AS A ON (P.IdProp = A.IdProp AND P.IdClin = A.IdClin) WHERE type = 'chat')
-- 13) Lister les détails des propriétaires qui ont un chat ou un chien
(SELECT P.IdProp, P.IdClin, P.nom, P.adresse, P.phoneNo FROM TP5DB.Proprietaire AS P JOIN TP5DB.Animal AS A ON (P.IdProp = A.IdProp AND P.IdClin = A.IdClin) WHERE type = 'chien')
UNION
(SELECT P.IdProp, P.IdClin, P.nom, P.adresse, P.phoneNo FROM TP5DB.Proprietaire AS P JOIN TP5DB.Animal AS A ON (P.IdProp = A.IdProp AND P.IdClin = A.IdClin) WHERE type = 'chat')
-- 14) Lister les détails des propriétaires qui ont un chat mais pas de chien vacciné contre la grippe (la condition vacciné contre la grippe ne s’applique qu’aux chiens)
(SELECT P.IdProp, P.IdClin, P.nom, P.adresse, P.phoneNo FROM TP5DB.Proprietaire AS P JOIN TP5DB.Animal AS A ON (P.IdProp = A.IdProp AND P.IdClin = A.IdClin) WHERE type = 'chat')
EXCEPT
(SELECT P.IdProp, P.IdClin, P.nom, P.adresse, P.phoneNo FROM 
 (TP5DB.Proprietaire AS P JOIN TP5DB.Animal AS A ON (P.IdProp = A.IdProp AND P.IdClin = A.IdClin)) 
													 JOIN TP5DB.Traitement AS T ON (A.IdAnimal = T.IdAnimal AND A.IdClin = T.IdClin) WHERE type = 'chien' AND T.description = 'Vaccination contre la grippe');
-- 15) Lister tous les animaux d’une clinique donnée avec leurs traitements s’ils existent. Dans le cas contraire, affichez null.
SELECT * FROM TP5DB.Animal AS A LEFT OUTER JOIN TP5DB.Traitement AS T ON (A.IdAnimal = T.IdAnimal AND A.IdClin = T.IdClin) WHERE A.IdClin = 'CLI001';
