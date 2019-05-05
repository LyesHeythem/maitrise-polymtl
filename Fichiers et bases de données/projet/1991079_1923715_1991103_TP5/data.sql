SET search_path = tp5DB;

INSERT INTO TP5DB.Clinique VALUES ('CLI001', 'rue Berri', 'Montréal', 'H2L 4E9', '0123456789', '0123456789', 'PER001');
INSERT INTO TP5DB.Clinique VALUES ('CLI002', 'rue de Montréal', 'Québec', 'G1W 1K5', '0987654321', '0987654321', 'PER003');

INSERT INTO TP5DB.Personnel VALUES ('PER001', 'Brus', 'Mathieu', '3710 Chemin Queen Mary à Montréal', '0111111111', DATE '1997-12-31', 'masculin', '046 454 286', 'Gérant', 80000, 'CLI001');
INSERT INTO TP5DB.Personnel VALUES ('PER002', 'Taliercio', 'Antoine', '3 Chemin Queen Mary à Montréal', '0111121111', DATE '1969-04-07', 'masculin', '096 454 286', 'Vétérinaire', 80000, 'CLI001');
INSERT INTO TP5DB.Personnel VALUES ('PER003', 'Bettache', 'Heythem Lyes', '7 Chemin Queen Mary à Montréal', '0122111111', DATE '1997-03-31', 'masculin', '006 454 286', 'Gérant', 80000, 'CLI002');
INSERT INTO TP5DB.Personnel VALUES ('PER004', 'Tremblay', 'Jean', '3 Chemin Queen Mary à Montréal', '0111121111', DATE '1959-01-01', 'masculin', '996 454 286', 'Vétérinaire', 80000, 'CLI002');

INSERT INTO TP5DB.Proprietaire VALUES ('PRO001','CLI001','Jean Tremblay', '2 Chemin Queen Mary à Montréal', '0011223344');
INSERT INTO TP5DB.Proprietaire VALUES ('PRO002','CLI001','Antoine Dupont', '16 Chemin Queen Mary à Montréal', '0055667788');
INSERT INTO TP5DB.Proprietaire VALUES ('PRO003','CLI002','Jean Dupont', '2 Chemin Queen Mary à Montréal', '0011223344');
INSERT INTO TP5DB.Proprietaire VALUES ('PRO004','CLI002','Antoine Tremblay', '16 Chemin Queen Mary à Montréal', '0055667788');

INSERT INTO TP5DB.Animal VALUES ('ANI001', 'CLI001', 'PRO001', 'Medor', 'chien', 'Grand chien', DATE '2011-01-01', DATE '2018-03-03', 'malade');
INSERT INTO TP5DB.Animal VALUES ('ANI002', 'CLI001', 'PRO002', 'Felix', 'chat', 'Petit chat', DATE '2011-01-01', DATE '2018-03-03', 'malade');
INSERT INTO TP5DB.Animal VALUES ('ANI003', 'CLI002', 'PRO003', 'Medor', 'chien', 'Grand chien', DATE '2011-01-01', DATE '2018-03-03', 'malade');
INSERT INTO TP5DB.Animal VALUES ('ANI004', 'CLI002', 'PRO004', 'Felix', 'chat', 'Petit chat', DATE '2011-01-01', DATE '2018-03-03', 'malade');
INSERT INTO TP5DB.Animal VALUES ('ANI005', 'CLI001', 'PRO001', 'Felix', 'chat', 'Petit chat', DATE '2011-01-01', DATE '2018-03-03', 'malade');
INSERT INTO TP5DB.Animal VALUES ('ANI006', 'CLI002', 'PRO003', 'Felix', 'chat', 'Petit chat', DATE '2011-01-01', DATE '2018-03-03', 'malade');

INSERT INTO TP5DB.Examen VALUES ('EXA001', DATE '2019-03-31', TIME '13:03:38', 'La patte est cassée', 'ANI001', 'CLI001', 'PER002');
INSERT INTO TP5DB.Examen VALUES ('EXA002', DATE '2019-04-02', TIME '15:09:18', 'Les poumons sont bouchés', 'ANI002', 'CLI001', 'PER002');
INSERT INTO TP5DB.Examen VALUES ('EXA003', DATE '2019-04-03', TIME '10:53:34', 'La patte est cassée', 'ANI003', 'CLI002', 'PER004');
INSERT INTO TP5DB.Examen VALUES ('EXA004', DATE '2019-04-04', TIME '16:23:59', 'La patte est cassée', 'ANI004', 'CLI002', 'PER004');
INSERT INTO TP5DB.Examen VALUES ('EXA005', DATE '2019-04-07', TIME '13:03:38', 'La patte est toujours cassée', 'ANI001', 'CLI001', 'PER002');

INSERT INTO TP5DB.Traitement VALUES ('T001','Vaccination contre la grippe', 50.00, '3', DATE '2019-03-31', DATE '2019-04-02', 'ANI001', 'CLI001', 'PER002', 'EXA001');
INSERT INTO TP5DB.Traitement VALUES ('T002','Vaccination contre la grippe', 70.00, '3', DATE '2019-03-31', DATE '2019-04-02', 'ANI001', 'CLI001', 'PER002', 'EXA001');
INSERT INTO TP5DB.Traitement VALUES ('T003','Vaccination contre la grippe', 90.00, '3', DATE '2019-03-31', DATE '2019-04-02', 'ANI002', 'CLI001', 'PER002', 'EXA002');
INSERT INTO TP5DB.Traitement VALUES ('T004','Vaccination contre la grippe', 30.00, '3', DATE '2019-03-31', DATE '2019-04-02', 'ANI003', 'CLI002', 'PER004', 'EXA003');
INSERT INTO TP5DB.Traitement VALUES ('T005','Vaccination contre la grippe', 110.00, '3', DATE '2019-03-31', DATE '2019-04-02', 'ANI004', 'CLI002', 'PER004', 'EXA004')