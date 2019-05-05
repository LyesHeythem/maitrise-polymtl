SET search_path = UniversityDB;

-- 1)Retourner tous les étudiants par ordre croissant sur leur nom
SELECT * FROM UNIVERSITYDB.Etudiant ORDER BY snom;
-- 2)Retourner le nom des professeurs et leur département. Nommez les colonnes Professeur et Dep
SELECT pnom AS Professeur, dep AS Dep FROM UNIVERSITYDB.Prof;
-- 3)Retourner le nom des professeurs qui travaillent dans un département de plus de 10 PHDs
SELECT pnom AS Professeur FROM UNIVERSITYDB.Prof, UNIVERSITYDB.Dept WHERE dep = dId AND nombrephds>=10;
-- 4)Retourner la plus haute note du cours '105' (toutes sections confondues)
SELECT max(note) AS NoteMaximale FROM UNIVERSITYDB.Inscription WHERE cno = '105';
-- 5)Retourner la plus haute note du cours '105' par section
SELECT sectno AS Section, max(note) AS NoteMaximale FROM UNIVERSITYDB.Inscription WHERE cno = '105' GROUP BY sectno;
-- 6)Pour chaque cours, retourner le nombre d'étudiants par section pour les sections de plus d'un étudiant (exemple : c3, s1, 20)
SELECT cno AS Cours, sectno AS Section, COUNT(*) AS NombreEtudiants FROM UNIVERSITYDB.Inscription GROUP BY cno, sectno HAVING COUNT(*)>1;
-- 7)Retourner les infos des étudiants et de leurs inscriptions. La table doit également comprendre les étudiants qui ne sont inscrits dans aucun cours
SELECT * FROM UNIVERSITYDB.Etudiant NATURAL LEFT OUTER JOIN UNIVERSITYDB.Inscription;
-- 8)Retourner l'info des étudiants qui ne sont inscrits à aucun cours - Utilisez une sousrequête
SELECT * FROM UNIVERSITYDB.Etudiant WHERE sId NOT IN(SELECT sId FROM UNIVERSITYDB.Inscription);
-- 9)Imprimer les informations des cours qui parlent de géométrie (toutes les combinaisons de titres possibles)
SELECT * FROM UNIVERSITYDB.Cours WHERE cnom LIKE '%geometrie%' OR cnom LIKE '%Geometrie%';
-- 10)Imprimer le nom des étudiants qui suivent un cours de géométrie (toutes les combinaisons de titres possibles)
SELECT snom AS Nom FROM UNIVERSITYDB.Etudiant AS e, UNIVERSITYDB.Inscription AS i NATURAL JOIN (
		SELECT * FROM UNIVERSITYDB.Cours WHERE cnom LIKE '%geometrie%' OR cnom LIKE '%Geometrie%') AS Cours WHERE e.sId = i.sId;
-- 11)Imprimer le nom des étudiants qui sont inscrits à au moins un cours du département GIGL et au moins un cours du département de mathématiques - Utilisez INTERSECT
(SELECT snom FROM UNIVERSITYDB.Etudiant AS e, UNIVERSITYDB.Inscription AS i, UNIVERSITYDB.Cours AS C
 WHERE e.sId = i.sId AND i.cno = c.cno AND c.dep = 'gigl')
INTERSECT
(SELECT snom FROM UNIVERSITYDB.Etudiant AS e, UNIVERSITYDB.Inscription AS i, UNIVERSITYDB.Cours AS C
	WHERE e.sId = i.sId AND i.cno = c.cno AND c.dep = 'Maths');
-- 12)Imprimer le nom des étudiants qui suivent un cours du département GIGL OU un cours du département de mathématiques
(SELECT snom FROM UNIVERSITYDB.Etudiant AS e, UNIVERSITYDB.Inscription AS i, UNIVERSITYDB.Cours AS C
 WHERE e.sId = i.sId AND i.cno = c.cno AND c.dep = 'gigl')
UNION
(SELECT snom FROM UNIVERSITYDB.Etudiant AS e, UNIVERSITYDB.Inscription AS i, UNIVERSITYDB.Cours AS C
	WHERE e.sId = i.sId AND i.cno = c.cno AND c.dep = 'Maths');
-- 13)Quelle est la différence d'âge entre le plus vieux et le plus jeune étudiant ? Affichez le résultat dans une colonne nommée Difference
SELECT MAX(age)-MIN(age) AS Difference FROM UNIVERSITYDB.Etudiant;
-- 14)Quel est le nombre d'étudiants dont la moyenne est supérieure à la moyenne de tous les étudiants ?
SELECT COUNT(*) FROM UNIVERSITYDB.Etudiant WHERE moyenne > (SELECT AVG(moyenne) FROM UNIVERSITYDB.Etudiant);
-- 15)Quels sont le ou les étudiants avec la plus grande moyenne ? Affichez le nom des étudiants et leur moyenne
SELECT snom AS nom, moyenne FROM UNIVERSITYDB.Etudiant WHERE moyenne = (SELECT MAX(moyenne) FROM UNIVERSITYDB.Etudiant);























