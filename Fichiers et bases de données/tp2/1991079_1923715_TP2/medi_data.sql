INSERT INTO MEDIDB.Doctor VALUES ('D001', 'Arthur Dupont', DATE '1984-01-01', '1 rue Sainte-Catherine à Montréal', '0123456789', 100000.5);
INSERT INTO MEDIDB.Doctor VALUES ('D002', 'Michel Mathieu', DATE '1986-01-01', '7 rue Sainte-Catherine à Montréal', '0023456789', 170000.5);
INSERT INTO MEDIDB.Doctor VALUES ('D003', 'John Smith', DATE '1962-01-01', '19 rue Sainte-Catherine à Montréal', '0111456789', 250000);
INSERT INTO MEDIDB.Doctor VALUES ('D004', 'Michael Bernard', DATE '1975-01-01', '1000 rue Sainte-Catherine à Montréal', '0011456789', 250000);

INSERT INTO MEDIDB.Medical VALUES ('D001', 50);
INSERT INTO MEDIDB.Specialist VALUES ('D002', 'poumon');
INSERT INTO MEDIDB.Medical VALUES ('D003', 0.57);
INSERT INTO MEDIDB.Specialist VALUES ('D004', 'chirurgie');

INSERT INTO MEDIDB.Patient VALUES ('P001', '123456789', 'Mathieu Brus', '56 rue Sainte-Catherine à Montréal', '0123456789', DATE '1997-01-01');
INSERT INTO MEDIDB.Patient VALUES ('P002', '987654321', 'Heythem Lyes Bettache', '32 rue Sainte-Catherine à Montréal', '0023456789', DATE '1996-01-01');

INSERT INTO MEDIDB.Payment VALUES ('Pay001','P001', 'Visite de routine', 'VISA');
INSERT INTO MEDIDB.Payment VALUES ('Pay002','P001', 'Visite de routine', 'CASH');
INSERT INTO MEDIDB.Payment VALUES ('Pay003','P002', 'Visite de routine', 'VISA');
INSERT INTO MEDIDB.Payment VALUES ('Pay004','P002', 'Visite de routine', 'CASH');

INSERT INTO MEDIDB.Appointment VALUES ('Apt001','P001','D001', '2019-02-03', '10:37:29');
INSERT INTO MEDIDB.Appointment VALUES ('Apt002','P002','D001', '2019-02-03', '14:37:29');
INSERT INTO MEDIDB.Appointment VALUES ('Apt003','P001','D002', '2019-02-03', '10:59:29');
INSERT INTO MEDIDB.Appointment VALUES ('Apt004','P002','D002', '2019-02-03', '14:59:29');





